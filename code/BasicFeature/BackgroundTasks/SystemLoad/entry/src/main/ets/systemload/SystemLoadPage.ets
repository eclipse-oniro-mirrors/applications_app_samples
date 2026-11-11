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

import { BusinessError, systemLoad } from '@kit.BasicServicesKit';
import { logger, SystemLoadService } from '@ohos/systemload';

export const SYSTEM_LOAD_PAGE_VISIBLE: string = 'systemLoadPageVisible';

@Component
export struct SystemLoadPage {
  @State private levelName: Resource = $r('app.string.level_name_unavailable');
  @State private levelText: Resource = $r('app.string.level_value_unavailable');
  @State private levelDescription: Resource = $r('app.string.level_unavailable');
  @State private levelRecommendation: Resource = $r('app.string.recommendation_unavailable');
  @State private sourceText: Resource = $r('app.string.local_data');
  @State private listenerText: Resource = $r('app.string.not_listening');
  @State private secondaryListenerText: Resource = $r('app.string.not_listening');
  @State private operationText: ResourceStr = $r('app.string.operation_ready');
  @State private callbackHistory: ResourceStr = $r('app.string.callback_history_empty');
  @State private primaryCallbackCount: number = 0;
  @State private secondaryCallbackCount: number = 0;
  @State private isMock: boolean = false;
  @State private isLoading: boolean = false;
  @State private isActive: boolean = false;
  @StorageLink(SYSTEM_LOAD_PAGE_VISIBLE) @Watch('onPageVisibleChange') private isPageVisible: boolean = true;
  private isPrimarySubscribed: boolean = false;
  private isSecondarySubscribed: boolean = false;
  private requestId: number = 0;
  private mockLevelIndex: number = 2;
  private callbackRecords: string[] = [];
  private readonly mockLevels: systemLoad.SystemLoadLevel[] = [
    systemLoad.SystemLoadLevel.LOW,
    systemLoad.SystemLoadLevel.NORMAL,
    systemLoad.SystemLoadLevel.MEDIUM,
    systemLoad.SystemLoadLevel.HIGH,
    systemLoad.SystemLoadLevel.OVERHEATED,
    systemLoad.SystemLoadLevel.WARNING,
    systemLoad.SystemLoadLevel.EMERGENCY,
    systemLoad.SystemLoadLevel.ESCAPE
  ];

  private readonly primarySystemLoadCallback = (level: systemLoad.SystemLoadLevel): void => {
    if (!this.isActive || this.isMock) {
      return;
    }
    this.primaryCallbackCount++;
    this.recordCallback('P', level);
    this.requestId++;
    this.isLoading = false;
    this.updateLevel(level);
    logger.info(`Primary system load callback: ${level}`);
  };

  private readonly secondarySystemLoadCallback = (level: systemLoad.SystemLoadLevel): void => {
    if (!this.isActive || this.isMock) {
      return;
    }
    this.secondaryCallbackCount++;
    this.recordCallback('S', level);
    logger.info(`Secondary system load callback: ${level}`);
  };

  aboutToAppear(): void {
    this.isActive = this.isPageVisible;
    if (this.isActive) {
      this.loadLocalSystemLoad();
    }
  }

  aboutToDisappear(): void {
    this.isActive = false;
    this.requestId++;
    this.unsubscribeAllListeners(false);
  }

  private onPageVisibleChange(): void {
    if (this.isPageVisible) {
      this.isActive = true;
      if (!this.isMock) {
        this.loadLocalSystemLoad();
      }
      return;
    }
    this.isActive = false;
    this.requestId++;
    this.isLoading = false;
    this.unsubscribeAllListeners(false);
  }

  private setLevelDisplay(name: Resource, value: Resource, description: Resource,
    recommendation: Resource): void {
    this.levelName = name;
    this.levelText = value;
    this.levelDescription = description;
    this.levelRecommendation = recommendation;
  }

  private updateLevel(level: systemLoad.SystemLoadLevel): void {
    switch (level) {
      case systemLoad.SystemLoadLevel.LOW:
        this.setLevelDisplay($r('app.string.level_name_low'), $r('app.string.level_value_low'),
          $r('app.string.level_low'), $r('app.string.recommendation_low'));
        return;
      case systemLoad.SystemLoadLevel.NORMAL:
        this.setLevelDisplay($r('app.string.level_name_normal'), $r('app.string.level_value_normal'),
          $r('app.string.level_normal'), $r('app.string.recommendation_normal'));
        return;
      case systemLoad.SystemLoadLevel.MEDIUM:
        this.setLevelDisplay($r('app.string.level_name_medium'), $r('app.string.level_value_medium'),
          $r('app.string.level_medium'), $r('app.string.recommendation_medium'));
        return;
      case systemLoad.SystemLoadLevel.HIGH:
        this.setLevelDisplay($r('app.string.level_name_high'), $r('app.string.level_value_high'),
          $r('app.string.level_high'), $r('app.string.recommendation_high'));
        return;
      case systemLoad.SystemLoadLevel.OVERHEATED:
        this.setLevelDisplay($r('app.string.level_name_overheated'), $r('app.string.level_value_overheated'),
          $r('app.string.level_overheated'), $r('app.string.recommendation_overheated'));
        return;
      case systemLoad.SystemLoadLevel.WARNING:
        this.setLevelDisplay($r('app.string.level_name_warning'), $r('app.string.level_value_warning'),
          $r('app.string.level_warning'), $r('app.string.recommendation_warning'));
        return;
      case systemLoad.SystemLoadLevel.EMERGENCY:
        this.setLevelDisplay($r('app.string.level_name_emergency'), $r('app.string.level_value_emergency'),
          $r('app.string.level_emergency'), $r('app.string.recommendation_emergency'));
        return;
      case systemLoad.SystemLoadLevel.ESCAPE:
        this.setLevelDisplay($r('app.string.level_name_escape'), $r('app.string.level_value_escape'),
          $r('app.string.level_escape'), $r('app.string.recommendation_escape'));
        return;
      default:
        this.setLevelDisplay($r('app.string.level_name_unknown'), $r('app.string.level_value_unavailable'),
          $r('app.string.level_unavailable'), $r('app.string.recommendation_unavailable'));
    }
  }

  private recordCallback(listener: string, level: systemLoad.SystemLoadLevel): void {
    const recordResourceId: number = listener === 'P' ?
      $r('app.string.primary_callback_record').id : $r('app.string.secondary_callback_record').id;
    const context = this.getUIContext().getHostContext();
    if (!context) {
      logger.error('Failed to record callback: host context is unavailable');
      return;
    }
    try {
      const record = context.resourceManager.getStringSync(recordResourceId, level);
      this.callbackRecords.unshift(record);
      if (this.callbackRecords.length > 6) {
        this.callbackRecords.pop();
      }
      this.callbackHistory = this.callbackRecords.join('\n');
    } catch (error) {
      let err: BusinessError = error as BusinessError;
      logger.error(`Failed to load callback record, code: ${err.code}, message: ${err.message}`);
    }
  }

  private setOperationError(error: BusinessError): void {
    this.operationText = $r('app.string.operation_failed', error.code);
  }

  private subscribePrimarySystemLoad(showOperation: boolean = true): void {
    if (this.isPrimarySubscribed) {
      if (showOperation) {
        this.operationText = $r('app.string.primary_already_registered');
      }
      return;
    }
    try {
      SystemLoadService.onSystemLoadChange(this.primarySystemLoadCallback);
      this.isPrimarySubscribed = true;
      this.listenerText = $r('app.string.listening');
      if (showOperation) {
        this.operationText = $r('app.string.primary_registered');
      }
    } catch (error) {
      let err: BusinessError = error as BusinessError;
      logger.error(`Failed to register primary listener, code: ${err.code}, message: ${err.message}`);
      this.setOperationError(err);
    }
  }

  private unsubscribePrimarySystemLoad(): void {
    if (!this.isPrimarySubscribed) {
      this.operationText = $r('app.string.primary_not_registered');
      return;
    }
    try {
      SystemLoadService.offSystemLoadChange(this.primarySystemLoadCallback);
      this.isPrimarySubscribed = false;
      this.listenerText = $r('app.string.not_listening');
      this.operationText = $r('app.string.primary_unregistered');
    } catch (error) {
      let err: BusinessError = error as BusinessError;
      logger.error(`Failed to unregister primary listener, code: ${err.code}, message: ${err.message}`);
      this.setOperationError(err);
    }
  }

  private subscribeSecondarySystemLoad(): void {
    if (this.isSecondarySubscribed) {
      this.operationText = $r('app.string.secondary_already_registered');
      return;
    }
    try {
      SystemLoadService.onSystemLoadChange(this.secondarySystemLoadCallback);
      this.isSecondarySubscribed = true;
      this.secondaryListenerText = $r('app.string.listening');
      this.operationText = $r('app.string.secondary_registered');
    } catch (error) {
      let err: BusinessError = error as BusinessError;
      logger.error(`Failed to register secondary listener, code: ${err.code}, message: ${err.message}`);
      this.setOperationError(err);
    }
  }

  private unsubscribeSecondarySystemLoad(): void {
    if (!this.isSecondarySubscribed) {
      this.operationText = $r('app.string.secondary_not_registered');
      return;
    }
    try {
      SystemLoadService.offSystemLoadChange(this.secondarySystemLoadCallback);
      this.isSecondarySubscribed = false;
      this.secondaryListenerText = $r('app.string.not_listening');
      this.operationText = $r('app.string.secondary_unregistered');
    } catch (error) {
      let err: BusinessError = error as BusinessError;
      logger.error(`Failed to unregister secondary listener, code: ${err.code}, message: ${err.message}`);
      this.setOperationError(err);
    }
  }

  private unsubscribeRegisteredCallbacks(): boolean {
    let allUnregistered = true;
    if (this.isPrimarySubscribed) {
      try {
        SystemLoadService.offSystemLoadChange(this.primarySystemLoadCallback);
        this.isPrimarySubscribed = false;
        this.listenerText = $r('app.string.not_listening');
      } catch (error) {
        allUnregistered = false;
        let err: BusinessError = error as BusinessError;
        logger.error(`Failed to unregister primary listener during fallback, code: ${err.code}, message: ${err.message}`);
      }
    }
    if (this.isSecondarySubscribed) {
      try {
        SystemLoadService.offSystemLoadChange(this.secondarySystemLoadCallback);
        this.isSecondarySubscribed = false;
        this.secondaryListenerText = $r('app.string.not_listening');
      } catch (error) {
        allUnregistered = false;
        let err: BusinessError = error as BusinessError;
        logger.error(`Failed to unregister secondary listener during fallback, code: ${err.code}, message: ${err.message}`);
      }
    }
    return allUnregistered;
  }

  private unsubscribeAllListeners(showOperation: boolean = true): void {
    if (!this.isPrimarySubscribed && !this.isSecondarySubscribed) {
      if (showOperation) {
        this.operationText = $r('app.string.no_listeners');
      }
      return;
    }
    try {
      SystemLoadService.offAllSystemLoadChange();
      this.isPrimarySubscribed = false;
      this.isSecondarySubscribed = false;
      this.listenerText = $r('app.string.not_listening');
      this.secondaryListenerText = $r('app.string.not_listening');
      if (showOperation) {
        this.operationText = $r('app.string.all_unregistered');
      }
    } catch (error) {
      let err: BusinessError = error as BusinessError;
      logger.error(`Failed to unregister all listeners, code: ${err.code}, message: ${err.message}`);
      const allUnregistered = this.unsubscribeRegisteredCallbacks();
      if (showOperation) {
        this.operationText = allUnregistered ? $r('app.string.all_unregistered') : $r('app.string.operation_failed',
          err.code);
      }
    }
  }

  private async requestLocalLevel(): Promise<systemLoad.SystemLoadLevel> {
    return await SystemLoadService.getLocalLevel();
  }

  private async loadLocalSystemLoad(): Promise<void> {
    const requestId = ++this.requestId;
    this.isLoading = true;
    try {
      const level: systemLoad.SystemLoadLevel = await this.requestLocalLevel();
      if (requestId !== this.requestId || !this.isActive) {
        return;
      }
      this.isMock = false;
      this.sourceText = $r('app.string.local_data');
      this.updateLevel(level);
      this.operationText = $r('app.string.operation_local_loaded');
      this.subscribePrimarySystemLoad(false);
      logger.info(`Local system load loaded: ${level}`);
    } catch (error) {
      if (requestId !== this.requestId || !this.isActive) {
        return;
      }
      let err: BusinessError = error as BusinessError;
      logger.error(`Failed to load local system load, code: ${err.code}, message: ${err.message}`);
      this.isMock = true;
      this.sourceText = $r('app.string.mock_fallback');
      this.unsubscribeAllListeners(false);
      this.updateLevel(this.mockLevels[this.mockLevelIndex]);
      this.operationText = $r('app.string.operation_local_unavailable');
    } finally {
      if (requestId === this.requestId) {
        this.isLoading = false;
      }
    }
  }

  private showMockSystemLoad(): void {
    this.requestId++;
    this.isLoading = false;
    this.isMock = true;
    this.sourceText = $r('app.string.mock_data');
    this.unsubscribeAllListeners(false);
    this.updateLevel(this.mockLevels[this.mockLevelIndex]);
    this.operationText = $r('app.string.operation_mock_selected');
  }

  private changeMockLevel(offset: number): void {
    if (!this.isMock) {
      return;
    }
    this.mockLevelIndex = (this.mockLevelIndex + offset + this.mockLevels.length) % this.mockLevels.length;
    this.updateLevel(this.mockLevels[this.mockLevelIndex]);
    this.operationText = $r('app.string.operation_mock_level_changed');
  }

  private refreshSystemLoad(): void {
    if (this.isMock) {
      this.updateLevel(this.mockLevels[this.mockLevelIndex]);
      this.operationText = $r('app.string.operation_mock_refreshed');
      return;
    }
    this.loadLocalSystemLoad();
  }

  build() {
    Scroll() {
      Column() {
        Text($r('app.string.system_load_title'))
          .id('system_load_title')
          .width('100%')
          .fontSize(28)
          .fontWeight(FontWeight.Bold)
          .fontColor($r('app.color.primary_text'))
        Text($r('app.string.system_load_subtitle'))
          .width('100%')
          .fontSize(14)
          .fontColor($r('app.color.secondary_text'))
          .margin({ top: 8 })

        Row() {
          Button($r('app.string.local_data'))
            .id('local_data_button')
            .type(ButtonType.Capsule)
            .layoutWeight(1)
            .height(40)
            .fontSize(14)
            .fontColor(this.isMock ? $r('app.color.accent') : $r('app.color.button_text'))
            .backgroundColor(this.isMock ? $r('app.color.unselected_background') : $r('app.color.accent'))
            .onClick(() => {
              this.loadLocalSystemLoad();
            })
          Button($r('app.string.mock_data'))
            .id('mock_data_button')
            .type(ButtonType.Capsule)
            .layoutWeight(1)
            .height(40)
            .fontSize(14)
            .fontColor(this.isMock ? $r('app.color.button_text') : $r('app.color.accent'))
            .backgroundColor(this.isMock ? $r('app.color.accent') : $r('app.color.unselected_background'))
            .margin({ left: 8 })
            .onClick(() => {
              this.showMockSystemLoad();
            })
          Button($r('app.string.refresh'))
            .id('refresh_button')
            .type(ButtonType.Capsule)
            .width(72)
            .height(40)
            .fontSize(14)
            .fontColor($r('app.color.button_text'))
            .backgroundColor($r('app.color.accent'))
            .margin({ left: 8 })
            .onClick(() => {
              this.refreshSystemLoad();
            })
        }
        .width('100%')
        .margin({ top: 24 })

        if (this.isMock) {
          Row() {
            Button($r('app.string.mock_previous'))
              .id('mock_previous_button')
              .type(ButtonType.Capsule)
              .layoutWeight(1)
              .height(40)
              .fontSize(14)
              .onClick(() => {
                this.changeMockLevel(-1);
              })
            Button($r('app.string.mock_next'))
              .id('mock_next_button')
              .type(ButtonType.Capsule)
              .layoutWeight(1)
              .height(40)
              .fontSize(14)
              .margin({ left: 12 })
              .onClick(() => {
                this.changeMockLevel(1);
              })
          }
          .width('100%')
          .margin({ top: 12 })
        }

        Row() {
          Text($r('app.string.data_source'))
            .fontSize(14)
            .fontColor($r('app.color.secondary_text'))
          Text(this.sourceText)
            .id('data_source_text')
            .layoutWeight(1)
            .fontSize(14)
            .fontColor($r('app.color.primary_text'))
            .margin({ left: 8 })
          if (this.isLoading) {
            LoadingProgress()
              .width(20)
              .height(20)
              .color($r('app.color.accent'))
              .margin({ left: 8 })
          }
        }
        .width('100%')
        .margin({ top: 16 })

        Column() {
          Text(this.levelName)
            .id('system_level_name')
            .fontSize(36)
            .fontWeight(FontWeight.Bold)
            .fontColor($r('app.color.accent'))
          Text(this.levelText)
            .id('system_level_value')
            .fontSize(18)
            .fontColor($r('app.color.secondary_text'))
            .margin({ top: 8 })
          Text(this.levelDescription)
            .id('system_level_description')
            .width('100%')
            .fontSize(16)
            .fontColor($r('app.color.primary_text'))
            .textAlign(TextAlign.Center)
            .margin({ top: 20 })
          Text($r('app.string.recommendation_title'))
            .width('100%')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
            .fontColor($r('app.color.secondary_text'))
            .margin({ top: 20 })
          Text(this.levelRecommendation)
            .id('system_level_recommendation')
            .width('100%')
            .fontSize(14)
            .fontColor($r('app.color.primary_text'))
            .margin({ top: 8 })
        }
        .id('system_level_card')
        .width('100%')
        .padding(24)
        .margin({ top: 16 })
        .backgroundColor($r('app.color.card_background'))
        .borderRadius(16)

        Column() {
          Text($r('app.string.listener_controls'))
            .width('100%')
            .fontSize(18)
            .fontWeight(FontWeight.Medium)
            .fontColor($r('app.color.primary_text'))
          Row() {
            Text($r('app.string.primary_listener'))
              .fontSize(14)
              .fontColor($r('app.color.secondary_text'))
            Text(this.listenerText)
              .id('listener_status_text')
              .layoutWeight(1)
              .textAlign(TextAlign.End)
              .fontSize(14)
              .fontColor($r('app.color.primary_text'))
          }
          .width('100%')
          .margin({ top: 16 })
          Text($r('app.string.primary_callback_count', this.primaryCallbackCount))
            .id('primary_callback_count')
            .width('100%')
            .fontSize(13)
            .fontColor($r('app.color.secondary_text'))
            .margin({ top: 8 })
          Row() {
            Button($r('app.string.register_primary'))
              .id('register_primary_button')
              .layoutWeight(1)
              .height(38)
              .fontSize(13)
              .enabled(!this.isMock && this.isActive)
              .onClick(() => {
                this.subscribePrimarySystemLoad();
              })
            Button($r('app.string.unregister_primary'))
              .id('unregister_primary_button')
              .layoutWeight(1)
              .height(38)
              .fontSize(13)
              .enabled(!this.isMock && this.isActive)
              .margin({ left: 8 })
              .onClick(() => {
                this.unsubscribePrimarySystemLoad();
              })
          }
          .width('100%')
          .margin({ top: 12 })

          Row() {
            Text($r('app.string.secondary_listener'))
              .fontSize(14)
              .fontColor($r('app.color.secondary_text'))
            Text(this.secondaryListenerText)
              .id('secondary_listener_status_text')
              .layoutWeight(1)
              .textAlign(TextAlign.End)
              .fontSize(14)
              .fontColor($r('app.color.primary_text'))
          }
          .width('100%')
          .margin({ top: 20 })
          Text($r('app.string.secondary_callback_count', this.secondaryCallbackCount))
            .id('secondary_callback_count')
            .width('100%')
            .fontSize(13)
            .fontColor($r('app.color.secondary_text'))
            .margin({ top: 8 })
          Row() {
            Button($r('app.string.register_secondary'))
              .id('register_secondary_button')
              .layoutWeight(1)
              .height(38)
              .fontSize(13)
              .enabled(!this.isMock && this.isActive)
              .onClick(() => {
                this.subscribeSecondarySystemLoad();
              })
            Button($r('app.string.unregister_secondary'))
              .id('unregister_secondary_button')
              .layoutWeight(1)
              .height(38)
              .fontSize(13)
              .enabled(!this.isMock && this.isActive)
              .margin({ left: 8 })
              .onClick(() => {
                this.unsubscribeSecondarySystemLoad();
              })
          }
          .width('100%')
          .margin({ top: 12 })
          Button($r('app.string.unregister_all'))
            .id('unregister_all_button')
            .width('100%')
            .height(38)
            .fontSize(13)
            .enabled(!this.isMock && this.isActive)
            .margin({ top: 12 })
            .onClick(() => {
              this.unsubscribeAllListeners();
            })

          Row() {
            Text($r('app.string.operation_status'))
              .fontSize(14)
              .fontColor($r('app.color.secondary_text'))
            Text(this.operationText)
              .id('operation_status_text')
              .layoutWeight(1)
              .textAlign(TextAlign.End)
              .fontSize(13)
              .fontColor($r('app.color.primary_text'))
              .margin({ left: 8 })
          }
          .width('100%')
          .margin({ top: 20 })
          Text($r('app.string.callback_history'))
            .width('100%')
            .fontSize(14)
            .fontColor($r('app.color.secondary_text'))
            .margin({ top: 16 })
          Text(this.callbackHistory)
            .id('callback_history_text')
            .width('100%')
            .fontSize(13)
            .fontColor($r('app.color.primary_text'))
            .margin({ top: 8 })
        }
        .width('100%')
        .padding(20)
        .margin({ top: 16 })
        .backgroundColor($r('app.color.card_background'))
        .borderRadius(16)
      }
      .id('system_load_page')
      .width('100%')
      .padding({ left: 20, right: 20, top: 32, bottom: 20 })
    }
    .id('system_load_scroll')
    .width('100%')
    .height('100%')
    .align(Alignment.Top)
    .scrollBar(BarState.Auto)
    .backgroundColor($r('app.color.page_background'))
  }
}
