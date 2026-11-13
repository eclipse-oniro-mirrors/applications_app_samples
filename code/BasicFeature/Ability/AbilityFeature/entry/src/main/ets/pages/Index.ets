/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { common, Want } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import {
  MENU_ID_ANIMATION_TOGGLE,
  MENU_ID_IMPLICIT_NO_POPUP,
  MENU_ID_IMPLICIT_POPUP,
  MENU_ID_LANGUAGE_EN,
  MENU_ID_LANGUAGE_ZH,
  MENU_ID_MODE_DARK,
  MENU_ID_MODE_LIGHT,
  MENU_ID_START_OPTIONS,
  MENU_ID_STORAGE_CHECK,
  MENU_ID_STORAGE_CLEAR,
  MENU_ID_STORAGE_CREATE
} from '../common/MenuIds';
import CharacterOperation from '../characteroperation/CharacterOperation';
import {
  buildImplicitViewWant,
  buildNewAbilityWant,
  buildStartOptions,
  formatStartOptions
} from '../model/LaunchIntent';
import { logger } from '../util/Logger';

interface GroupModel {
  title: string;
  showToggle?: boolean;
  list: ListItemModel[];
}

export interface ListItemModel {
  id: string;
  text: Resource;
  rType?: string;
  callback?: () => void;
}

const TAG: string = 'Index';

@Entry
@Component
struct Index {
  @State isChinese: boolean = true;
  @State isLight: boolean = true;
  @State isAnimation: boolean = false;
  @State list: GroupModel[] = [
    {
      title: '1',
      list: [
        {
          id: MENU_ID_LANGUAGE_ZH,
          text: $r('app.string.Set_Chinese_language'),
          rType: 'right',
          callback: () => {
            this.isChinese = true;
            this.createOperation().setZHCNLanguage();
          }
        },
        {
          id: MENU_ID_LANGUAGE_EN,
          text: $r('app.string.Set_English_Language'),
          rType: 'right',
          callback: () => {
            this.isChinese = false;
            this.createOperation().setENUSLanguage();
          }
        }
      ]
    },
    {
      title: '2',
      list: [
        {
          id: MENU_ID_MODE_LIGHT,
          text: $r('app.string.Set_Light_Mode'),
          rType: 'right',
          callback: () => {
            this.isLight = true;
            this.createOperation().setLightColorMode();
          }
        },
        {
          id: MENU_ID_MODE_DARK,
          text: $r('app.string.Set_Dark_Mode'),
          rType: 'right',
          callback: () => {
            this.isLight = false;
            this.createOperation().setDarkColorMode();
          }
        }
      ]
    },
    {
      title: '3',
      list: [
        {
          id: MENU_ID_IMPLICIT_POPUP,
          text: $r('app.string.Implicit_Launch_Popup'),
          rType: 'arrow',
          callback: () => {
            this.launchImplicit(false);
          }
        },
        {
          id: MENU_ID_IMPLICIT_NO_POPUP,
          text: $r('app.string.Implicit_Launch_not_Popup'),
          rType: 'arrow',
          callback: () => {
            this.launchImplicit(true);
          }
        }
      ]
    },
    {
      title: '4',
      list: [
        {
          id: MENU_ID_STORAGE_CREATE,
          text: $r('app.string.CreateStorageData'),
          rType: 'arrow',
          callback: () => {
            this.createOperation().createStorageData();
          }
        },
        {
          id: MENU_ID_STORAGE_CHECK,
          text: $r('app.string.CheckStorageData'),
          rType: 'arrow',
          callback: () => {
            this.createOperation().checkStorageData();
          }
        },
        {
          id: MENU_ID_STORAGE_CLEAR,
          text: $r('app.string.ClearStorageData'),
          rType: 'arrow',
          callback: () => {
            this.createOperation().clearStorageData();
          }
        }
      ]
    },
    {
      title: '5',
      showToggle: true,
      list: [
        {
          id: MENU_ID_START_OPTIONS,
          text: $r('app.string.setStartOptionsPage'),
          rType: '',
          callback: () => {
            this.launchNewAbility();
          }
        }
      ]
    }
  ]

  private getHostContext(): common.UIAbilityContext {
    return this.getUIContext().getHostContext() as common.UIAbilityContext;
  }

  private createOperation(): CharacterOperation {
    return new CharacterOperation(this.getHostContext(), this.getUIContext());
  }

  /**
   * 隐式启动：不带 flag 时由系统弹“未找到”提示框，带 FLAG_START_WITHOUT_TIPS 时直接返回失败。
   */
  private launchImplicit(withoutTips: boolean): void {
    const want: Want = buildImplicitViewWant(withoutTips);
    this.getHostContext().startAbility(want, (err: BusinessError) => {
      logger.info(`${TAG} implicit start withoutTips=${withoutTips}, err=${JSON.stringify(err)}`);
    });
  }

  /**
   * 携带 StartOptions 显式启动 NewAbility，位置/大小/动效由 Toggle 状态决定。
   */
  private launchNewAbility(): void {
    const bundleName: string = this.getHostContext().abilityInfo.bundleName;
    const want: Want = buildNewAbilityWant(bundleName);
    const options = buildStartOptions(this.isAnimation);
    logger.info(`${TAG} start NewAbility with ${formatStartOptions(options)}`);
    this.getHostContext().startAbility(want, options, (err: BusinessError) => {
      if (err && err.code !== 0) {
        logger.error(`${TAG} startAbility failed, err: ${JSON.stringify(err)}`);
      } else {
        logger.info(`${TAG} startAbility success`);
      }
    });
  }

  build() {
    Column() {
      Text($r('app.string.system_BasicCharacter_Demo'))
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .padding({ left: 24, right: 24 })
        .height(56)
        .width('100%')

      Column() {
        List({ space: 0, initialIndex: 0 }) {
          ForEach(this.list, (groupItem: GroupModel, groupIndex: number) => {
            if (groupItem.showToggle === true) {
              ListItem() {
                Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
                  Text($r('app.string.start_animation'))
                    .fontSize(14)
                    .padding({ left: 12, right: 12 })
                  Text(this.isAnimation ? $r('app.string.close') : $r('app.string.open'))
                    .margin({ right: 12 })
                    .fontSize(14)
                    .onClick(() => {
                      this.isAnimation = !this.isAnimation;
                    })
                    .fontColor($r('sys.color.ohos_id_color_floating_button_bg_normal'))
                }.width('100%')
              }
              .id(MENU_ID_ANIMATION_TOGGLE)
              .width('100%')
              .height(25)
              .padding({ top: 10 })
            }
            ListItemGroup() {
              ForEach(groupItem.list, (item: ListItemModel, index: number) => {
                ListItem() {
                  Column() {
                    Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
                      Text(item.text)
                        .fontSize(16)
                        .height(48)
                        .fontColor($r('sys.color.ohos_id_color_toolbar_sub_bg_dark'))

                      if (item.rType === 'arrow') {
                        Image($r('app.media.ic_arrow'))
                          .width(24).height(24).padding({ left: 12 })
                      } else if (item.rType === 'right') {
                        if (groupIndex === 0) {
                          if (this.isChinese && index === 0) {
                            Image($r('app.media.ic_check')).width(24).height(24)
                          } else if (!this.isChinese && index === 1) {
                            Image($r('app.media.ic_check')).width(24).height(24)
                          }
                        } else if (groupIndex === 1) {
                          if (this.isLight && index === 0) {
                            Image($r('app.media.ic_check')).width(24).height(24)
                          } else if (!this.isLight && index === 1) {
                            Image($r('app.media.ic_check')).width(24).height(24)
                          }
                        }
                      }
                    }.width('100%')

                    if (groupItem.list.length > 1 && index < groupItem.list.length - 1) {
                      Divider().height(2).color($r('app.color.line_color')).opacity(0.05)
                    }
                  }.width('100%')
                }
                .id(item.id)
                .align(Alignment.Start)
                .onClick(item.callback)
                .width('100%')
                .padding({ left: 12, right: 12 })
              })
            }
            .padding({ top: 4, bottom: 4 })
            .borderRadius(24)
            .width('100%')
            .backgroundColor($r('sys.color.ohos_id_color_foreground_contrary'))
            .margin({ top: 10, bottom: 10 })
          })
        }
        .scrollBar(BarState.Off)
        .listDirection(Axis.Vertical)
        .friction(0.6)
        .edgeEffect(EdgeEffect.Spring)
        .padding({ left: 12, right: 12 })
        .width('100%')
        .height('100%')
      }.width('100%')
    }.width('100%')
    .height('100%')
    .backgroundColor($r('sys.color.ohos_id_color_text_field_sub_bg'))
    .padding({ top: 36, bottom: 106 })
  }
}
