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

import { screenLockFileManager } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ScreenLockFile]';
const PAGE_PADDING: number = 24;
const SECTION_SPACING: number = 16;
const ITEM_SPACING: number = 12;
const TITLE_FONT_SIZE: number = 28;
const SUBTITLE_FONT_SIZE: number = 20;
const BODY_FONT_SIZE: number = 16;
const SMALL_FONT_SIZE: number = 14;
const CONTENT_MAX_WIDTH: number = 720;
const BUTTON_HEIGHT: number = 48;
const CARD_RADIUS: number = 12;
const CARD_PADDING: number = 20;
const MAX_HISTORY_SIZE: number = 10;

interface OperationRecord {
  operation: string;
  result: string;
  timestamp: string;
}

@Component
export struct ScreenLockFileHome {
  @State private operationResult: ResourceStr = $r('app.string.operation_ready');
  @State private operationHistory: OperationRecord[] = [];
  @State private acquireCount: number = 0;
  @State private releaseCount: number = 0;

  private getKeyStatusName(status: screenLockFileManager.KeyStatus): string {
    if (status === screenLockFileManager.KeyStatus.KEY_NOT_EXIST) {
      return getContext(this).resourceManager.getStringSync($r('app.string.key_status_not_exist_format'), status);
    }
    if (status === screenLockFileManager.KeyStatus.KEY_RELEASED) {
      return getContext(this).resourceManager.getStringSync($r('app.string.key_status_released_format'), status);
    }
    return getContext(this).resourceManager.getStringSync($r('app.string.key_status_exist_format'), status);
  }

  private getAccessStatusName(status: screenLockFileManager.AccessStatus): string {
    if (status === screenLockFileManager.AccessStatus.ACCESS_GRANTED) {
      return getContext(this).resourceManager.getStringSync($r('app.string.access_status_granted_format'), status);
    }
    return getContext(this).resourceManager.getStringSync($r('app.string.access_status_denied_format'), status);
  }

  private getReleaseStatusName(status: screenLockFileManager.ReleaseStatus): string {
    if (status === screenLockFileManager.ReleaseStatus.RELEASE_GRANTED) {
      return getContext(this).resourceManager.getStringSync($r('app.string.release_status_granted_format'), status);
    }
    return getContext(this).resourceManager.getStringSync($r('app.string.release_status_denied_format'), status);
  }

  private getPendingCount(): number {
    const pending: number = this.acquireCount - this.releaseCount;
    if (pending < 0) {
      return 0;
    }
    return pending;
  }

  private formatTimestamp(): string {
    const now: Date = new Date();
    const hours: string = now.getHours().toString().padStart(2, '0');
    const minutes: string = now.getMinutes().toString().padStart(2, '0');
    const seconds: string = now.getSeconds().toString().padStart(2, '0');
    return `${hours}:${minutes}:${seconds}`;
  }

  private addHistory(operation: string, result: string): void {
    const record: OperationRecord = {
      operation: operation,
      result: result,
      timestamp: this.formatTimestamp()
    };
    const newHistory: OperationRecord[] = [];
    newHistory.push(record);
    for (let i: number = 0; i < this.operationHistory.length && i < MAX_HISTORY_SIZE - 1; i++) {
      newHistory.push(this.operationHistory[i]);
    }
    this.operationHistory = newHistory;
  }

  private getErrorSuggestion(code: number): Resource {
    switch (code) {
      case 801:
        return $r('app.string.error_suggestion_801');
      case 29300002:
        return $r('app.string.error_suggestion_29300002');
      case 29300003:
        return $r('app.string.error_suggestion_29300003');
      case 29300004:
        return $r('app.string.error_suggestion_29300004');
      case 29300005:
        return $r('app.string.error_suggestion_29300005');
      default:
        return $r('app.string.error_suggestion_default');
    }
  }

  private showError(operation: string, error: BusinessError): void {
    const errorMsg: string = getContext(this).resourceManager.getStringSync(
      $r('app.string.error_result_format'), operation, error.code, error.message);
    const suggestion: string = getContext(this).resourceManager.getStringSync(this.getErrorSuggestion(error.code));
    const suggestionText: string = getContext(this).resourceManager.getStringSync(
      $r('app.string.error_suggestion_label'), suggestion);
    this.operationResult = getContext(this).resourceManager.getStringSync(
      $r('app.string.error_with_suggestion_format'), errorMsg, suggestionText);
    this.addHistory(operation, getContext(this).resourceManager.getStringSync(
      $r('app.string.history_error_format'), error.code));
    hilog.error(DOMAIN, TAG, '%{public}s failed. Code: %{public}d, message: %{public}s',
      operation, error.code, error.message);
  }

  private queryKeyState(): void {
    try {
      const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      const resultText: string = getContext(this).resourceManager.getStringSync(
        $r('app.string.operation_result_format'), 'queryAppKeyState', this.getKeyStatusName(status));
      this.operationResult = resultText;
      this.addHistory('queryAppKeyState', this.getKeyStatusName(status));
      hilog.info(DOMAIN, TAG, 'queryAppKeyState succeeded. Status: %{public}d', status);
    } catch (error) {
      this.showError('queryAppKeyState', error as BusinessError);
    }
  }

  private acquire(): void {
    try {
      const keyStatus: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      if (keyStatus !== screenLockFileManager.KeyStatus.KEY_EXIST) {
        const keyName: string = this.getKeyStatusName(keyStatus);
        const tipText: string = getContext(this).resourceManager.getStringSync(
          $r('app.string.acquire_precondition_failed'), keyName);
        this.operationResult = tipText;
        this.addHistory('acquireAccess', getContext(this).resourceManager.getStringSync(
          $r('app.string.precondition_failed_history')));
        hilog.warn(DOMAIN, TAG, 'acquireAccess precondition failed. KeyStatus: %{public}d', keyStatus);
        return;
      }

      const status: screenLockFileManager.AccessStatus = screenLockFileManager.acquireAccess();
      const resultText: string = getContext(this).resourceManager.getStringSync(
        $r('app.string.operation_result_format'), 'acquireAccess', this.getAccessStatusName(status));
      this.operationResult = resultText;
      if (status === screenLockFileManager.AccessStatus.ACCESS_GRANTED) {
        this.acquireCount = this.acquireCount + 1;
      }
      this.addHistory('acquireAccess', this.getAccessStatusName(status));
      hilog.info(DOMAIN, TAG, 'acquireAccess succeeded. Status: %{public}d', status);
    } catch (error) {
      this.showError('acquireAccess', error as BusinessError);
    }
  }

  private release(): void {
    try {
      if (this.acquireCount <= this.releaseCount) {
        const tipText: string = getContext(this).resourceManager.getStringSync(
          $r('app.string.release_pairing_failed'), this.acquireCount, this.releaseCount);
        this.operationResult = tipText;
        this.addHistory('releaseAccess', getContext(this).resourceManager.getStringSync(
          $r('app.string.pairing_check_failed_history')));
        hilog.warn(DOMAIN, TAG, 'releaseAccess pairing check failed. Acquire: %{public}d, Release: %{public}d',
          this.acquireCount, this.releaseCount);
        return;
      }

      const status: screenLockFileManager.ReleaseStatus = screenLockFileManager.releaseAccess();
      const resultText: string = getContext(this).resourceManager.getStringSync(
        $r('app.string.operation_result_format'), 'releaseAccess', this.getReleaseStatusName(status));
      this.operationResult = resultText;
      if (status === screenLockFileManager.ReleaseStatus.RELEASE_GRANTED) {
        this.releaseCount = this.releaseCount + 1;
      }
      this.addHistory('releaseAccess', this.getReleaseStatusName(status));
      hilog.info(DOMAIN, TAG, 'releaseAccess succeeded. Status: %{public}d', status);
    } catch (error) {
      this.showError('releaseAccess', error as BusinessError);
    }
  }

  private queryAllStates(): void {
    try {
      const keyStatus: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      const keyName: string = this.getKeyStatusName(keyStatus);
      const allResult: string = getContext(this).resourceManager.getStringSync(
        $r('app.string.query_all_states_format'), keyName, this.acquireCount, this.releaseCount,
        this.getPendingCount());
      this.operationResult = allResult;
      this.addHistory('queryAllStates', allResult);
      hilog.info(DOMAIN, TAG, 'queryAllStates. KeyStatus: %{public}d, acquire: %{public}d, release: %{public}d',
        keyStatus, this.acquireCount, this.releaseCount);
    } catch (error) {
      this.showError('queryAllStates', error as BusinessError);
    }
  }

  private clearHistory(): void {
    this.operationHistory = [];
    this.operationResult = $r('app.string.operation_ready');
    hilog.info(DOMAIN, TAG, '%{public}s', 'Operation history cleared.');
  }

  build(): void {
    Scroll() {
      Column({ space: SECTION_SPACING }) {
        Text($r('app.string.page_title'))
          .fontSize(TITLE_FONT_SIZE)
          .fontWeight(FontWeight.Bold)
          .fontColor($r('app.color.primary_text'))
          .width('100%')
        Text($r('app.string.page_description'))
          .fontSize(BODY_FONT_SIZE)
          .fontColor($r('app.color.secondary_text'))
          .lineHeight(PAGE_PADDING)
          .width('100%')

        Column({ space: ITEM_SPACING }) {
          Text($r('app.string.precondition_title'))
            .fontSize(SUBTITLE_FONT_SIZE)
            .fontWeight(FontWeight.Medium)
            .fontColor($r('app.color.primary_text'))
            .width('100%')
          Text($r('app.string.precondition_description'))
            .fontSize(BODY_FONT_SIZE)
            .fontColor($r('app.color.secondary_text'))
            .lineHeight(PAGE_PADDING)
            .width('100%')
          Text($r('app.string.data_type_description'))
            .fontSize(BODY_FONT_SIZE)
            .fontColor($r('app.color.secondary_text'))
            .lineHeight(PAGE_PADDING)
            .width('100%')
          Text($r('app.string.access_pairing_description'))
            .fontSize(BODY_FONT_SIZE)
            .fontColor($r('app.color.secondary_text'))
            .lineHeight(PAGE_PADDING)
            .width('100%')
        }
        .alignItems(HorizontalAlign.Start)
        .padding(CARD_PADDING)
        .width('100%')
        .borderRadius(CARD_RADIUS)
        .backgroundColor($r('app.color.card_background'))

        Column({ space: ITEM_SPACING }) {
          Text($r('app.string.data_type_enum_title'))
            .fontSize(SUBTITLE_FONT_SIZE)
            .fontWeight(FontWeight.Medium)
            .fontColor($r('app.color.primary_text'))
            .width('100%')
          Text(getContext(this).resourceManager.getStringSync($r('app.string.data_type_media_format'),
            screenLockFileManager.DataType.MEDIA_DATA))
            .fontSize(BODY_FONT_SIZE)
            .fontColor($r('app.color.secondary_text'))
            .width('100%')
          Text(getContext(this).resourceManager.getStringSync($r('app.string.data_type_all_format'),
            screenLockFileManager.DataType.ALL_DATA))
            .fontSize(BODY_FONT_SIZE)
            .fontColor($r('app.color.secondary_text'))
            .width('100%')
        }
        .alignItems(HorizontalAlign.Start)
        .padding(CARD_PADDING)
        .width('100%')
        .borderRadius(CARD_RADIUS)
        .backgroundColor($r('app.color.card_background'))

        Button($r('app.string.query_key_state'))
          .id('queryKeyStateButton')
          .type(ButtonType.Capsule)
          .width('100%')
          .height(BUTTON_HEIGHT)
          .onClick((): void => {
            this.queryKeyState();
          })
        Button($r('app.string.acquire_access'))
          .id('acquireAccessButton')
          .type(ButtonType.Capsule)
          .width('100%')
          .height(BUTTON_HEIGHT)
          .onClick((): void => {
            this.acquire();
          })
        Button($r('app.string.release_access'))
          .id('releaseAccessButton')
          .type(ButtonType.Capsule)
          .buttonStyle(ButtonStyleMode.NORMAL)
          .width('100%')
          .height(BUTTON_HEIGHT)
          .onClick((): void => {
            this.release();
          })
        Button($r('app.string.query_all_states'))
          .id('queryAllStatesButton')
          .type(ButtonType.Capsule)
          .buttonStyle(ButtonStyleMode.NORMAL)
          .width('100%')
          .height(BUTTON_HEIGHT)
          .onClick((): void => {
            this.queryAllStates();
          })

        Column({ space: ITEM_SPACING }) {
          Text($r('app.string.result_title'))
            .fontSize(SUBTITLE_FONT_SIZE)
            .fontWeight(FontWeight.Medium)
            .fontColor($r('app.color.primary_text'))
            .width('100%')
          Text(this.operationResult)
            .id('operationResult')
            .fontSize(BODY_FONT_SIZE)
            .fontColor($r('app.color.result_text'))
            .lineHeight(PAGE_PADDING)
            .width('100%')
          Text($r('app.string.result_description'))
            .fontSize(BODY_FONT_SIZE)
            .fontColor($r('app.color.secondary_text'))
            .lineHeight(PAGE_PADDING)
            .width('100%')
        }
        .alignItems(HorizontalAlign.Start)
        .padding(CARD_PADDING)
        .width('100%')
        .borderRadius(CARD_RADIUS)
        .backgroundColor($r('app.color.card_background'))

        Column({ space: ITEM_SPACING }) {
          Text($r('app.string.pairing_status_title'))
            .fontSize(SUBTITLE_FONT_SIZE)
            .fontWeight(FontWeight.Medium)
            .fontColor($r('app.color.primary_text'))
            .width('100%')
          Text(getContext(this).resourceManager.getStringSync($r('app.string.pairing_status_format'),
            this.acquireCount, this.releaseCount, this.getPendingCount()))
            .id('pairingStatus')
            .fontSize(BODY_FONT_SIZE)
            .fontColor($r('app.color.result_text'))
            .width('100%')
        }
        .alignItems(HorizontalAlign.Start)
        .padding(CARD_PADDING)
        .width('100%')
        .borderRadius(CARD_RADIUS)
        .backgroundColor($r('app.color.card_background'))

        Column({ space: ITEM_SPACING }) {
          Row() {
            Text($r('app.string.operation_history_title'))
              .fontSize(SUBTITLE_FONT_SIZE)
              .fontWeight(FontWeight.Medium)
              .fontColor($r('app.color.primary_text'))
            Blank()
            Button($r('app.string.clear_history'))
              .id('clearHistoryButton')
              .type(ButtonType.Capsule)
              .height(32)
              .fontSize(SMALL_FONT_SIZE)
              .onClick((): void => {
                this.clearHistory();
              })
          }
          .width('100%')

          if (this.operationHistory.length === 0) {
            Text($r('app.string.no_history'))
              .id('noHistoryText')
              .fontSize(SMALL_FONT_SIZE)
              .fontColor($r('app.color.secondary_text'))
              .width('100%')
          }

          ForEach(this.operationHistory, (record: OperationRecord) => {
            Row() {
              Text(getContext(this)
                .resourceManager
                .getStringSync($r('app.string.history_timestamp_format'), record.timestamp))
                .fontSize(SMALL_FONT_SIZE)
                .fontColor($r('app.color.secondary_text'))
                .width(70)
              Text(record.operation)
                .fontSize(SMALL_FONT_SIZE)
                .fontWeight(FontWeight.Medium)
                .fontColor($r('app.color.primary_text'))
                .width(140)
              Text(record.result)
                .fontSize(SMALL_FONT_SIZE)
                .fontColor($r('app.color.result_text'))
                .layoutWeight(1)
            }
            .width('100%')
            .alignItems(VerticalAlign.Center)
          }, (record: OperationRecord) => `${record.timestamp}_${record.operation}`)
        }
        .alignItems(HorizontalAlign.Start)
        .padding(CARD_PADDING)
        .width('100%')
        .borderRadius(CARD_RADIUS)
        .backgroundColor($r('app.color.card_background'))
      }
      .alignItems(HorizontalAlign.Start)
      .constraintSize({ maxWidth: CONTENT_MAX_WIDTH })
      .padding(PAGE_PADDING)
      .width('100%')
    }
    .align(Alignment.Top)
    .backgroundColor($r('app.color.page_background'))
    .width('100%')
    .height('100%')
  }
}
