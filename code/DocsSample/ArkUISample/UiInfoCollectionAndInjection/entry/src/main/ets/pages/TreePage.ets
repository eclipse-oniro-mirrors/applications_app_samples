/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import nativeUi from 'libentry.so';
import { parseTree, findNode, countNodes, failure, TreeOptions, OUTPUT_LIMIT } from '../common/Collection';

@Entry
@Component
struct TreePage {
  @State visibleOnly: boolean = false;
  @State filterLayout: boolean = false;
  @State interaction: boolean = false;
  @State accessibility: boolean = false;
  @State visual: boolean = false;
  @State functional: boolean = false;
  @State busy: boolean = false;
  @State active: boolean = false;
  @State status: string = 'idle';
  @State result: string = '';
  @State targetText: string = 'treeTarget';

  aboutToAppear(): void {
    this.active = true;
  }

  aboutToDisappear(): void {
    this.active = false;
  }

  // [Start ui_tree_page_collect]
  private async collect(asynchronous: boolean): Promise<void> {
    if (this.busy) { return; }
    this.busy = true;
    const options: TreeOptions = {
      visibleOnly: this.visibleOnly, filterLayout: this.filterLayout,
      interaction: this.interaction, accessibility: this.accessibility,
      visual: this.visual, functional: this.functional
    };
    try {
      const context = this.getUIContext();
      const value = asynchronous ? await nativeUi.collectTreeAsync(context, options) :
        nativeUi.collectTree(context, options);
      if (!this.active) { return; }
      const tree = parseTree(value);
      const target = findNode(tree, 'treeTarget');
      const hidden = findNode(tree, 'hiddenTarget');
      this.status = `schema=${tree.schemaVersion}; target=${target !== undefined}; ` +
        `hidden=${hidden !== undefined}; nodes=${countNodes(tree)}`;
      this.result = target === undefined ? value.slice(0, OUTPUT_LIMIT) :
        JSON.stringify(target, null, 2).slice(0, OUTPUT_LIMIT);
    } catch (error) {
      if (this.active) { this.status = failure(error); }
    } finally {
      if (this.active) { this.busy = false; }
    }
  }
  // [End ui_tree_page_collect]

  build() {
    Scroll() {
      Column({ space: 12 }) {
        Text($r('app.string.tree_page_title'))
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
        TextInput({ text: this.targetText, placeholder: $r('app.string.tree_input_placeholder') })
          .id('treeTarget')
          .accessibilityText($r('app.string.tree_target_a11y'))
          .onChange((value: string) => { this.targetText = value; })
        Text($r('app.string.tree_hidden_node'))
          .id('hiddenTarget')
          .visibility(Visibility.None)
        Column({ space: 6 }) {
          Row({ space: 8 }) {
            Toggle({ type: ToggleType.Checkbox, isOn: this.visibleOnly })
              .id('toggleVisibleOnly')
              .onChange((value: boolean) => { this.visibleOnly = value; })
            Text($r('app.string.option_visible_only'))
              .fontSize(14)
          }
          Row({ space: 8 }) {
            Toggle({ type: ToggleType.Checkbox, isOn: this.filterLayout })
              .id('toggleFilterLayout')
              .onChange((value: boolean) => { this.filterLayout = value; })
            Text($r('app.string.option_filter_layout'))
              .fontSize(14)
          }
          Row({ space: 8 }) {
            Toggle({ type: ToggleType.Checkbox, isOn: this.interaction })
              .id('toggleInteraction')
              .onChange((value: boolean) => { this.interaction = value; })
            Text($r('app.string.option_interaction'))
              .fontSize(14)
          }
          Row({ space: 8 }) {
            Toggle({ type: ToggleType.Checkbox, isOn: this.accessibility })
              .id('toggleAccessibility')
              .onChange((value: boolean) => { this.accessibility = value; })
            Text($r('app.string.option_accessibility'))
              .fontSize(14)
          }
          Row({ space: 8 }) {
            Toggle({ type: ToggleType.Checkbox, isOn: this.visual })
              .id('toggleVisual')
              .onChange((value: boolean) => { this.visual = value; })
            Text($r('app.string.option_visual'))
              .fontSize(14)
          }
          Row({ space: 8 }) {
            Toggle({ type: ToggleType.Checkbox, isOn: this.functional })
              .id('toggleFunctional')
              .onChange((value: boolean) => { this.functional = value; })
            Text($r('app.string.option_functional'))
              .fontSize(14)
          }
        }
        .alignItems(HorizontalAlign.Start)
        Row({ space: 12 }) {
          Button($r('app.string.tree_sync_button'))
            .id('treeSyncButton')
            .enabled(!this.busy)
            .onClick(() => { this.collect(false); })
          Button($r('app.string.tree_async_button'))
            .id('treeAsyncButton')
            .enabled(!this.busy)
            .onClick(() => { this.collect(true); })
        }
        Text(this.status)
          .id('treeStatus')
          .fontSize(14)
          .fontColor(Color.Gray)
        Text(this.result)
          .id('treeResult')
          .fontSize(12)
          .fontColor(Color.Gray)
          .maxLines(20)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
      }
      .alignItems(HorizontalAlign.Start)
      .padding(16)
    }
    .height('100%')
    .width('100%')
  }
}
