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

import { CapabilityController, QUERY_CODEC_DETAIL_FAILED } from '../controller/CapabilityController';
import { CodecBrief, ScenarioItem, ScenarioGroup, CodecCategoryConstants, SCENARIO_GROUPS } from '../model/CodecModel';
import Logger from '../common/utils/Logger';

const TAG: string = '[CodecCapabilityIndex]';

@Entry
@Component
struct Index {
  @State currentTabIndex: number = 0;
  @State codecCategory: number = CodecCategoryConstants.VIDEO_DECODER;
  @State codecList: CodecBrief[] = [];
  @State selectedCodecName: string = '';
  @State codecDetailText: string | Resource = $r('app.string.codec_detail_hint');
  @State scenarioResultTitle: string | Resource = $r('app.string.scenario_result_title_default');
  @State scenarioResultText: string | Resource = $r('app.string.scenario_result_hint');
  @State runningScenarioId: number = -1;

  aboutToAppear(): void {
    this.refreshCodecList(this.codecCategory);
  }

  private refreshCodecList(category: number): void {
    this.codecList = CapabilityController.getCodecList(category);
    this.selectedCodecName = '';
    this.codecDetailText = $r('app.string.codec_detail_hint');
    Logger.info(TAG, 'refreshCodecList, category: %{public}d, size: %{public}d', category, this.codecList.length);
  }

  private getFormattedString(resource: Resource, ...args: (string | number)[]): string {
    return getContext().resourceManager.getStringSync(resource.id, ...args);
  }

  private onCodecClicked(item: CodecBrief): void {
    this.selectedCodecName = item.name;
    const detail = CapabilityController.getCodecDetail(this.codecCategory, item.name);
    this.codecDetailText = detail === QUERY_CODEC_DETAIL_FAILED ? $r('app.string.codec_detail_query_failed') : detail;
    Logger.info(TAG, 'onCodecClicked, name: %{public}s', item.name);
  }

  private onScenarioClicked(item: ScenarioItem): void {
    if (this.runningScenarioId !== -1) {
      return;
    }
    this.runningScenarioId = item.id;
    this.scenarioResultTitle = item.name;
    CapabilityController.runScenario(item.id)
      .then((result: string) => {
        this.scenarioResultTitle = item.name;
        this.scenarioResultText = result;
        this.runningScenarioId = -1;
      })
      .catch((err: Error) => {
        this.scenarioResultTitle = item.name;
        this.scenarioResultText = this.getFormattedString($r('app.string.scenario_execute_failed'), err.message);
        this.runningScenarioId = -1;
      });
  }

  @Builder
  CategoryButton(label: string | Resource, category: number) {
    Button(label)
      .fontSize(14)
      .fontColor(this.codecCategory === category ? Color.White : '#333333')
      .backgroundColor(this.codecCategory === category ? '#007DFF' : '#F1F3F5')
      .borderRadius(16)
      .height(32)
      .padding({ left: 14, right: 14 })
      .margin({ right: 8 })
      .onClick(() => {
        this.refreshCodecList(category);
      })
  }

  @Builder
  CodecListItem(item: CodecBrief) {
    Column({ space: 4 }) {
      Row({ space: 8 }) {
        Text(item.name)
          .fontSize(14)
          .fontColor('#333333')
          .layoutWeight(1)
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
        Text(item.isHardware ? $r('app.string.hardware') : $r('app.string.software'))
          .fontSize(11)
          .fontColor(item.isHardware ? '#0F8B42' : '#8A5B00')
          .backgroundColor(item.isHardware ? '#E6F4EA' : '#FFF3E0')
          .borderRadius(4)
          .padding({ left: 6, right: 6, top: 2, bottom: 2 })
        if (item.isSecure) {
          Text($r('app.string.secure'))
            .fontSize(11)
            .fontColor('#B3261E')
            .backgroundColor('#FCE8E6')
            .borderRadius(4)
            .padding({ left: 6, right: 6, top: 2, bottom: 2 })
        }
      }
      .width('100%')

      Text(item.mime + this.getFormattedString($r('app.string.max_instances_format'), item.maxInstances))
        .fontSize(12)
        .fontColor('#999999')
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
    }
    .alignItems(HorizontalAlign.Start)
    .width('100%')
    .padding(12)
    .borderRadius(8)
    .backgroundColor(this.selectedCodecName === item.name ? '#E8F1FF' : '#FFFFFF')
    .onClick(() => {
      this.onCodecClicked(item);
    })
  }

  @Builder
  ScenarioGroupHeader(title: string | Resource) {
    Text(title)
      .fontSize(13)
      .fontColor('#666666')
      .width('100%')
      .padding({ left: 12, top: 8, bottom: 8 })
      .backgroundColor('#F1F3F5')
  }

  @Builder
  ScenarioListItem(item: ScenarioItem) {
    Row() {
      Text(item.name)
        .fontSize(14)
        .fontColor(this.runningScenarioId === item.id ? '#007DFF' : '#333333')
        .layoutWeight(1)
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
      Text(this.runningScenarioId === item.id ? $r('app.string.executing') : $r('app.string.execute'))
        .fontSize(12)
        .fontColor('#007DFF')
        .padding({ left: 8, right: 4 })
    }
    .width('100%')
    .padding(12)
    .borderRadius(8)
    .backgroundColor('#FFFFFF')
    .margin({ top: 4, bottom: 4 })
    .onClick(() => {
      this.onScenarioClicked(item);
    })
  }

  build() {
    Column() {
      Text($r('app.string.main_title'))
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .fontColor('#333333')
        .width('100%')
        .padding({ left: 16, top: 12, bottom: 12 })

      Tabs({ barPosition: BarPosition.Start, index: this.currentTabIndex }) {
        TabContent() {
          Column() {
            Row() {
              this.CategoryButton(CodecCategoryConstants.CATEGORY_NAMES[0], CodecCategoryConstants.VIDEO_DECODER)
              this.CategoryButton(CodecCategoryConstants.CATEGORY_NAMES[1], CodecCategoryConstants.VIDEO_ENCODER)
              this.CategoryButton(CodecCategoryConstants.CATEGORY_NAMES[2], CodecCategoryConstants.AUDIO_DECODER)
              this.CategoryButton(CodecCategoryConstants.CATEGORY_NAMES[3], CodecCategoryConstants.AUDIO_ENCODER)
            }
            .width('100%')
            .padding({ left: 12, right: 12, top: 4, bottom: 8 })

            Text(this.getFormattedString($r('app.string.codec_count'), this.codecList.length))
              .fontSize(12)
              .fontColor('#999999')
              .width('100%')
              .padding({ left: 16, bottom: 4 })

            List({ space: 8 }) {
              ForEach(this.codecList, (item: CodecBrief) => {
                ListItem() {
                  this.CodecListItem(item)
                }
              }, (item: CodecBrief) => item.name)
            }
            .width('100%')
            .layoutWeight(1)
            .padding({ left: 12, right: 12 })
            .scrollBar(BarState.Auto)

            Divider().margin({ top: 4, bottom: 4 })

            Text($r('app.string.capability_detail'))
              .fontSize(15)
              .fontWeight(FontWeight.Medium)
              .fontColor('#333333')
              .width('100%')
              .padding({ left: 16, top: 4, bottom: 4 })

            Scroll() {
              Column() {
                Text(this.codecDetailText)
                  .fontSize(13)
                  .fontColor('#555555')
                  .fontFamily('monospace')
                  .width('100%')
                  .padding({ left: 16, right: 16, top: 4, bottom: 12 })
              }
              .alignItems(HorizontalAlign.Start)
            }
            .align(Alignment.TopStart)
            .width('100%')
            .height(220)
            .scrollBar(BarState.Auto)
          }
          .width('100%')
          .height('100%')
          .backgroundColor('#F5F6F7')
        }
        .tabBar($r('app.string.tab_codec_list'))

        TabContent() {
          Column() {
            List() {
              ForEach(SCENARIO_GROUPS, (group: ScenarioGroup) => {
                  ListItem() {
                    this.ScenarioGroupHeader(group.title)
                  }
                  ForEach(group.items, (item: ScenarioItem) => {
                    ListItem() {
                      this.ScenarioListItem(item)
                    }
                  }, (item: ScenarioItem) => item.id.toString())
                }, (group: ScenarioGroup, index: number) => index.toString())
            }
            .width('100%')
            .layoutWeight(1)
            .padding({ left: 12, right: 12 })
            .scrollBar(BarState.Auto)

            Divider().margin({ top: 4, bottom: 4 })

            Text(this.scenarioResultTitle)
              .fontSize(15)
              .fontWeight(FontWeight.Medium)
              .fontColor('#333333')
              .width('100%')
              .padding({ left: 16, top: 4, bottom: 4 })
              .maxLines(1)
              .textOverflow({ overflow: TextOverflow.Ellipsis })

            Scroll() {
              Column() {
                Text(this.scenarioResultText)
                  .fontSize(13)
                  .fontColor('#555555')
                  .fontFamily('monospace')
                  .width('100%')
                  .padding({ left: 16, right: 16, top: 4, bottom: 12 })
              }
              .alignItems(HorizontalAlign.Start)
            }
            .align(Alignment.TopStart)
            .width('100%')
            .height(220)
            .scrollBar(BarState.Auto)
          }
          .width('100%')
          .height('100%')
          .backgroundColor('#F5F6F7')
        }
        .tabBar($r('app.string.tab_scenario_verify'))
      }
      .barMode(BarMode.Fixed)
      .layoutWeight(1)
      .onChange((index: number) => {
        this.currentTabIndex = index;
      })
    }
    .width('100%')
    .height('100%')
  }
}
