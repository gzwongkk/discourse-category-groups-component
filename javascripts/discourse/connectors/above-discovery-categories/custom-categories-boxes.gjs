/* eslint-disable ember/no-classic-components, ember/require-tagless-components */
import Component from "@ember/component";
import { classNames } from "@ember-decorators/component";
import CategoriesGroups from "../../components/categories-groups";

@classNames("above-discovery-categories-outlet", "custom-categories-boxes")
export default class CustomCategoriesBoxes extends Component {
  <template>
    {{#if this.site.desktopView}}
      <CategoriesGroups
        @categories={{this.outletArgs.categories}}
        @mode="boxes"
      />
    {{/if}}
  </template>
}
