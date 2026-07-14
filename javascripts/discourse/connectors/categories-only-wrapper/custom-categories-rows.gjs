/* eslint-disable ember/no-classic-components, ember/require-tagless-components */
import Component from "@ember/component";
import { service } from "@ember/service";
import { tagName } from "@ember-decorators/component";
import CategoriesGroups from "../../components/categories-groups";

@tagName("")
export default class CustomCategoriesRows extends Component {
  @service siteSettings;

  get useCompactGroups() {
    return (
      (this.site.mobileView && settings.show_on_mobile) ||
      (this.site.desktopView &&
        this.siteSettings.desktop_category_page_style ===
          "categories_and_latest_topics")
    );
  }

  <template>
    {{#if this.useCompactGroups}}
      <CategoriesGroups
        @categories={{this.outletArgs.categories}}
        @mode="rows"
      />
    {{else}}
      {{yield}}
    {{/if}}
  </template>
}
