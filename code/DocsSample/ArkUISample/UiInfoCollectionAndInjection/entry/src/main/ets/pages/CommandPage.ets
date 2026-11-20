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
import { LengthMetrics } from '@kit.ArkUI';
import { parseTree, requireNodeId, failure, FULL_TREE } from '../common/Collection';

const PRESET_SET_TEXT = '{"schemaVersion":1,"cmd":{"type":"setText","action_info":{"value":"hello"}}}';
const PRESET_ADD_TEXT = '{"schemaVersion":1,"cmd":{"type":"addText","action_info":{"value":" world"}}}';
const PRESET_DELETE_TEXT = '{"schemaVersion":1,"cmd":{"type":"deleteText","action_info":{"start":0,"end":5}}}';
const PRESET_SELECT_TEXT =
  '{"schemaVersion":1,"cmd":{"type":"selectText","action_info":{"selectionStart":0,"selectionEnd":5}}}';
const PRESET_COPY = '{"schemaVersion":1,"cmd":{"type":"copy","action_info":{}}}';
const PRESET_SWIPER_SWITCH =
  '{"schemaVersion":1,"cmd":{"type":"swiperSwitch","action_info":{"direction":"forward"}}}';
const PRESET_TABS_SWITCH = '{"schemaVersion":1,"cmd":{"type":"tabsSwitch","action_info":{"index":1}}}';

@Entry
@Component
struct CommandPage {
  @State busy: boolean = false;
  @State active: boolean = false;
  @State status: string = 'idle';
  @State command: string = PRESET_SET_TEXT;
  @State targetType: string = 'input';
  @State inputText: string = 'hello';
  @State swiperIndex: number = 0;
  @State tabsIndex: number = 0;

  aboutToAppear(): void {
    this.active = true;
  }

  aboutToDisappear(): void {
    this.active = false;
  }

  // [Start ui_command_submit_ets]
  private async submit(): Promise<void> {
    if (this.busy) { return; }
    this.busy = true;
    this.status = 'pending';
    try {
      const context = this.getUIContext();
      const tree = parseTree(nativeUi.collectTree(context, FULL_TREE));
      const id = requireNodeId(tree, 'commandTarget');
      const value = await nativeUi.injectCommand(context, id, this.command);
      if (this.active) { this.status = `result=${value.result}; node=${id}`; }
    } catch (error) {
      if (this.active) { this.status = failure(error); }
    } finally {
      if (this.active) { this.busy = false; }
    }
  }
  // [End ui_command_submit_ets]

  build() {
    Scroll() {
      Column({ space: 12 }) {
        Text($r('app.string.command_page_title'))
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
        Row({ space: 12 }) {
          Radio({ value: 'input', group: 'commandTarget' })
            .id('targetRadioInput')
            .checked(this.targetType === 'input')
            .onChange((checked: boolean) => { if (checked) { this.targetType = 'input'; } })
          Text($r('app.string.target_input'))
            .fontSize(14)
          Radio({ value: 'swiper', group: 'commandTarget' })
            .id('targetRadioSwiper')
            .checked(this.targetType === 'swiper')
            .onChange((checked: boolean) => { if (checked) { this.targetType = 'swiper'; } })
          Text($r('app.string.target_swiper'))
            .fontSize(14)
          Radio({ value: 'tabs', group: 'commandTarget' })
            .id('targetRadioTabs')
            .checked(this.targetType === 'tabs')
            .onChange((checked: boolean) => { if (checked) { this.targetType = 'tabs'; } })
          Text($r('app.string.target_tabs'))
            .fontSize(14)
        }
        if (this.targetType === 'input') {
          TextInput({ text: this.inputText, placeholder: $r('app.string.command_input_placeholder') })
            .id('commandTarget')
            .onChange((value: string) => { this.inputText = value; })
          Text($r('app.string.command_input_state', this.inputText))
            .id('commandTargetState')
            .fontSize(14)
            .fontColor(Color.Gray)
        } else if (this.targetType === 'swiper') {
          Swiper() {
            Text($r('app.string.swiper_item_0'))
              .width('100%')
              .height(80)
              .textAlign(TextAlign.Center)
              .backgroundColor('#F1F3F5')
            Text($r('app.string.swiper_item_1'))
              .width('100%')
              .height(80)
              .textAlign(TextAlign.Center)
              .backgroundColor('#E8EAED')
            Text($r('app.string.swiper_item_2'))
              .width('100%')
              .height(80)
              .textAlign(TextAlign.Center)
              .backgroundColor('#F1F3F5')
          }
          .id('commandTarget')
          .loop(false)
          .onChange((index: number) => { this.swiperIndex = index; })
          Text($r('app.string.command_swiper_state', this.swiperIndex))
            .id('commandTargetState')
            .fontSize(14)
            .fontColor(Color.Gray)
        } else {
          Tabs() {
            TabContent() {
              Text($r('app.string.tabs_item_0'))
                .width('100%')
                .height(80)
                .textAlign(TextAlign.Center)
            }
            .tabBar($r('app.string.tabs_item_0'))
            TabContent() {
              Text($r('app.string.tabs_item_1'))
                .width('100%')
                .height(80)
                .textAlign(TextAlign.Center)
            }
            .tabBar($r('app.string.tabs_item_1'))
            TabContent() {
              Text($r('app.string.tabs_item_2'))
                .width('100%')
                .height(80)
                .textAlign(TextAlign.Center)
            }
            .tabBar($r('app.string.tabs_item_2'))
          }
          .id('commandTarget')
          .height(200)
          .barPosition(BarPosition.Start)
          .onChange((index: number) => { this.tabsIndex = index; })
          Text($r('app.string.command_tabs_state', this.tabsIndex))
            .id('commandTargetState')
            .fontSize(14)
            .fontColor(Color.Gray)
        }
        Flex({ wrap: FlexWrap.Wrap, space: { main: LengthMetrics.px(8), cross: LengthMetrics.px(8) } }) {
          Button($r('app.string.preset_set_text'))
            .id('presetSetText')
            .fontSize(14)
            .onClick(() => { this.command = PRESET_SET_TEXT; })
          Button($r('app.string.preset_add_text'))
            .id('presetAddText')
            .fontSize(14)
            .onClick(() => { this.command = PRESET_ADD_TEXT; })
          Button($r('app.string.preset_delete_text'))
            .id('presetDeleteText')
            .fontSize(14)
            .onClick(() => { this.command = PRESET_DELETE_TEXT; })
          Button($r('app.string.preset_select_text'))
            .id('presetSelectText')
            .fontSize(14)
            .onClick(() => { this.command = PRESET_SELECT_TEXT; })
          Button($r('app.string.preset_copy'))
            .id('presetCopy')
            .fontSize(14)
            .onClick(() => { this.command = PRESET_COPY; })
          Button($r('app.string.preset_swiper_switch'))
            .id('presetSwiperSwitch')
            .fontSize(14)
            .onClick(() => { this.command = PRESET_SWIPER_SWITCH; })
          Button($r('app.string.preset_tabs_switch'))
            .id('presetTabsSwitch')
            .fontSize(14)
            .onClick(() => { this.command = PRESET_TABS_SWITCH; })
        }
        TextArea({ text: this.command, placeholder: $r('app.string.command_json_placeholder') })
          .id('commandJson')
          .height(90)
          .fontSize(12)
          .onChange((value: string) => { this.command = value; })
        Button($r('app.string.command_submit'))
          .id('commandSubmitButton')
          .enabled(!this.busy)
          .onClick(() => { this.submit(); })
        Text(this.status)
          .id('commandStatus')
          .fontSize(14)
          .fontColor(Color.Gray)
      }
      .alignItems(HorizontalAlign.Start)
      .padding(16)
    }
    .height('100%')
    .width('100%')
  }
}
