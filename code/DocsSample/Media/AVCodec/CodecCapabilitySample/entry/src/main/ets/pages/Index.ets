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

import { CapabilityController } from '../controller/CapabilityController';
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
  @State codecDetailText: string = '点击编解码器查看能力详情。';
  @State scenarioResultTitle: string = '场景验证结果';
  @State scenarioResultText: string = '点击场景条目执行对应示例。';
  @State runningScenarioName: string = '';

  aboutToAppear(): void {
    this.refreshCodecList(this.codecCategory);
  }

  private refreshCodecList(category: number): void {
    this.codecList = CapabilityController.getCodecList(category);
    this.selectedCodecName = '';
    this.codecDetailText = '点击编解码器查看能力详情。';
    Logger.info(TAG, 'refreshCodecList, category: %{public}d, size: %{public}d', category, this.codecList.length);
  }

  private onCodecClicked(item: CodecBrief): void {
    this.selectedCodecName = item.name;
    this.codecDetailText = CapabilityController.getCodecDetail(this.codecCategory, item.name);
    Logger.info(TAG, 'onCodecClicked, name: %{public}s', item.name);
  }

  private onScenarioClicked(item: ScenarioItem): void {
    if (this.runningScenarioName !== '') {
      return;
    }
    this.runningScenarioName = item.name;
    this.scenarioResultTitle = item.name + '（执行中...）';
    CapabilityController.runScenario(item.id)
      .then((result: string) => {
        this.scenarioResultTitle = item.name;
        this.scenarioResultText = result;
        this.runningScenarioName = '';
      })
      .catch((err: Error) => {
        this.scenarioResultTitle = item.name;
        this.scenarioResultText = '场景执行失败: ' + err.message;
        this.runningScenarioName = '';
      });
  }

  @Builder
  CategoryButton(label: string, category: number) {
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
        Text(item.isHardware ? '硬件' : '软件')
          .fontSize(11)
          .fontColor(item.isHardware ? '#0F8B42' : '#8A5B00')
          .backgroundColor(item.isHardware ? '#E6F4EA' : '#FFF3E0')
          .borderRadius(4)
          .padding({ left: 6, right: 6, top: 2, bottom: 2 })
        if (item.isSecure) {
          Text('安全')
            .fontSize(11)
            .fontColor('#B3261E')
            .backgroundColor('#FCE8E6')
            .borderRadius(4)
            .padding({ left: 6, right: 6, top: 2, bottom: 2 })
        }
      }
      .width('100%')

      Text(item.mime + ' · 最大实例数: ' + item.maxInstances.toString())
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
  ScenarioGroupHeader(title: string) {
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
        .fontColor(this.runningScenarioName === item.name ? '#007DFF' : '#333333')
        .layoutWeight(1)
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
      Text(this.runningScenarioName === item.name ? '执行中' : '执行')
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
      Text('获取支持的编解码能力')
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

            Text('共 ' + this.codecList.length.toString() + ' 个编解码器')
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

            Text('能力详情')
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
        .tabBar('编解码器列表')

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
                }, (item: ScenarioItem, index: number) => group.title + '_' + index.toString())
              }, (group: ScenarioGroup) => group.title)
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
        .tabBar('场景验证')
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
