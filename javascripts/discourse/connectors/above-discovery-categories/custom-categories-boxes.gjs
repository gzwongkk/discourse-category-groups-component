/* eslint-disable ember/no-classic-components, ember/require-tagless-components */
import Component from "@ember/component";
import { action } from "@ember/object";
import didInsert from "@ember/render-modifiers/modifiers/did-insert";
import didUpdate from "@ember/render-modifiers/modifiers/did-update";
import { service } from "@ember/service";
import { classNames } from "@ember-decorators/component";
import { and } from "discourse/truth-helpers";
import CategoriesGroups from "../../components/categories-groups";

@classNames("above-discovery-categories-outlet", "custom-categories-boxes")
export default class CustomCategoriesBoxes extends Component {
  @service router;
  @service site;

  wasMobileView = false;

  @action
  captureViewport() {
    this.wasMobileView = this.site.mobileView;
  }

  @action
  refreshCategoriesAfterMobile() {
    const isMobileView = this.site.mobileView;
    const movedToDesktop = this.wasMobileView && !isMobileView;

    this.wasMobileView = isMobileView;

    if (
      movedToDesktop &&
      this.router.currentRouteName === "discovery.categories"
    ) {
      this.router.refresh();
    }
  }

  <template>
    <span
      hidden
      {{didInsert this.captureViewport}}
      {{didUpdate this.refreshCategoriesAfterMobile this.site.mobileView}}
    ></span>

    {{#if this.site.desktopView}}
      <CategoriesGroups
        @categories={{this.outletArgs.categories}}
        @mode="boxes"
      />
    {{else if (and settings.show_on_mobile this.site.mobileView)}}
      <CategoriesGroups
        @categories={{this.outletArgs.categories}}
        @mode="mobile"
      />
    {{/if}}
  </template>
}
