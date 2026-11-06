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
 
import { AtomicServiceSearch } from '@kit.ArkUI';
import { DemoPageScaffold } from '../../components/DemoPageScaffold';
import { LogPanel } from '../../components/LogPanel';
import { DemoItem, DEMO_ITEMS, filterDemos } from '../../model/DemoLogic';
import { DEFAULT_LAYOUT_PROFILE, LayoutProfile } from '../../model/DeviceProfile';
import { AppColors, AppRadius, AppSpacing, AppText } from '../../common/Theme';
import { Logger } from '../../utils/Logger';

@Component
export struct SearchDemo {
  navPathStack: NavPathStack = new NavPathStack();
  @StorageProp('layoutProfile') layout: LayoutProfile = DEFAULT_LAYOUT_PROFILE;
  @State keyword: string = '';
  @State category: string = '';
  @State categoryIndex: number = 0;

  private getString(resource: Resource, ...args: Array<string | number>): string {
    const context = this.getUIContext().getHostContext();
    if (context === undefined) {
      return '';
    }
    try {
      return context.resourceManager.getStringSync(resource.id, ...args);
    } catch (err) {
      return '';
    }
  }

  aboutToAppear(): void {
    this.category = this.getString($r('app.string.category_all'));
    Logger.info('Search', '生命周期', '进入 Search 演示页');
  }

  aboutToDisappear(): void {
    Logger.info('Search', '生命周期', '离开 Search 演示页');
  }

  private results(): DemoItem[] {
    return filterDemos(DEMO_ITEMS, this.keyword, this.category);
  }

  build() {
    DemoPageScaffold({
      title: 'AtomicServiceSearch',
      subtitle: $r('app.string.search_page_subtitle'),
      logSource: 'Search',
      navPathStack: this.navPathStack
    }) {
      Scroll() {
        Column({ space: AppSpacing.XL }) {
          Column({ space: AppSpacing.XL }) {
            AtomicServiceSearch({
              value: this.keyword,
              placeholder: this.getString($r('app.string.search_input_placeholder')),
              search: {
                searchButton: {
                  searchButtonValue: $r('app.string.search_button')
                },
                onChange: (value: string) => {
                  this.keyword = value;
                },
                onSubmit: (value: string) => {
                  Logger.info('Search', '提交',
                    `搜索「${value.length > 0 ? value : '空'}」，命中 ${this.results().length} 项`);
                }
              },
              select: {
                options: [
                  { value: $r('app.string.category_all'), icon: $r('sys.media.ohos_ic_public_more') },
                  { value: $r('app.string.category_container'), icon: $r('sys.media.ohos_ic_public_phone') },
                  { value: $r('app.string.category_interaction'), icon: $r('sys.media.ohos_ic_public_location') },
                  { value: $r('app.string.category_capability'), icon: $r('sys.media.ohos_ic_public_share') }
                ],
                selected: this.categoryIndex,
                selectValue: this.category,
                onSelect: (index: number, selectValue: string) => {
                  this.categoryIndex = index;
                  this.category = selectValue;
                  Logger.info('Search', '选择',
                    `类别切换为「${selectValue}」，命中 ${this.results().length} 项`);
                }
              },
              operation: {
                auxiliaryItem: {
                  value: $r('sys.media.ohos_ic_public_scan'),
                  action: () => {
                    Logger.info('Search', '辅助位', '触发扫一扫（示例动作）');
                  }
                },
                independentItem: {
                  value: $r('sys.media.ohos_ic_public_share'),
                  action: () => {
                    Logger.info('Search', '独立位', '触发分享（示例动作）');
                  }
                }
              }
            })
              .width('100%')
          }
          .width('100%')
          .padding(AppSpacing.CARD)
          .backgroundColor(AppColors.CARD_BG)
          .borderRadius(AppRadius.LARGE)

          Row() {
            Text($r('app.string.search_results_title', this.results().length))
              .fontSize(AppText.SECTION)
              .fontWeight(FontWeight.Medium)
              .fontColor(AppColors.TEXT_PRIMARY)
            Blank()
            Text(this.getString($r('app.string.search_summary'), this.category,
              this.keyword.length > 0 ? this.keyword : this.getString($r('app.string.search_all_keywords'))))
              .fontSize(AppText.BODY)
              .fontColor(AppColors.TEXT_TERTIARY)
          }
          .width('100%')

          ForEach(this.results(), (item: DemoItem) => {
            Row({ space: AppSpacing.LG }) {
              Column({ space: 3 }) {
                Text(item.title)
                  .fontSize(AppText.TITLE)
                  .fontWeight(FontWeight.Medium)
                  .fontColor(AppColors.TEXT_PRIMARY)
                Text(item.subtitle)
                  .fontSize(AppText.BODY)
                  .fontColor(AppColors.TEXT_SECONDARY)
              }
              .alignItems(HorizontalAlign.Start)
              .layoutWeight(1)

              Text(item.category)
                .fontSize(AppText.SMALL)
                .fontColor(AppColors.PRIMARY)
                .backgroundColor(AppColors.PRIMARY_SOFT)
                .borderRadius(AppRadius.TAG)
                .padding({ left: 6, right: 6, top: 2, bottom: 2 })

              Text($r('app.string.action_enter'))
                .fontSize(AppText.SMALL)
                .fontColor(AppColors.PRIMARY)
            }
            .width('100%')
            .padding(AppSpacing.XL)
            .backgroundColor(AppColors.CARD_BG)
            .borderRadius(AppRadius.CARD)
            .onClick(() => {
              Logger.info('Search', '导航', `打开 ${item.title}（${item.key}）`);
              this.navPathStack.pushPath({ name: item.key });
            })
          }, (item: DemoItem) => item.key)

          if (this.results().length === 0) {
            Text($r('app.string.search_empty'))
              .fontSize(AppText.LABEL)
              .fontColor(AppColors.TEXT_MUTED)
              .width('100%')
              .padding(AppSpacing.LARGE)
              .backgroundColor(AppColors.CARD_BG)
              .borderRadius(AppRadius.CARD)
          }

          LogPanel({ title: $r('app.string.log_title_search'), filterSource: 'Search' })
        }
        .width('100%')
        .constraintSize({ maxWidth: this.layout.pageMaxWidth })
        .padding(AppSpacing.PAGE)
      }
      .layoutWeight(1)
      .align(Alignment.TopStart)
      .scrollBar(BarState.Auto)
    }
  }
}
