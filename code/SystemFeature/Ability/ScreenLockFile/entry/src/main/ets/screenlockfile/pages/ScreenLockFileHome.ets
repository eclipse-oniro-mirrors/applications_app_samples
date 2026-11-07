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

const DOMAIN = 0x0001;
const TAG = '[Sample_ScreenLockFile]';
const PAGE_PADDING = 24;
const SECTION_SPACING = 16;
const ITEM_SPACING = 12;
const TITLE_FONT_SIZE = 28;
const SUBTITLE_FONT_SIZE = 20;
const BODY_FONT_SIZE = 16;
const SMALL_FONT_SIZE = 14;
const CONTENT_MAX_WIDTH = 720;
const BUTTON_HEIGHT = 48;
const CARD_RADIUS = 12;
const CARD_PADDING = 20;
const MAX_HISTORY_SIZE = 10;

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
      return `KEY_NOT_EXIST (${status})`;
    }
    if (status === screenLockFileManager.KeyStatus.KEY_RELEASED) {
      return `KEY_RELEASED (${status})`;
    }
    return `KEY_EXIST (${status})`;
  }

  private getAccessStatusName(status: screenLockFileManager.AccessStatus): string {
    if (status === screenLockFileManager.AccessStatus.ACCESS_GRANTED) {
      return `ACCESS_GRANTED (${status})`;
    }
    return `ACCESS_DENIED (${status})`;
  }

  private getReleaseStatusName(status: screenLockFileManager.ReleaseStatus): string {
    if (status === screenLockFileManager.ReleaseStatus.RELEASE_GRANTED) {
      return `RELEASE_GRANTED (${status})`;
    }
    return `RELEASE_DENIED (${status})`;
  }

  private getPendingCount(): number {
    const pending = this.acquireCount - this.releaseCount;
    if (pending < 0) {
      return 0;
    }
    return pending;
  }

  private formatTimestamp(): string {
    const now = new Date();
    const hours = now.getHours().toString().padStart(2, '0');
    const minutes = now.getMinutes().toString().padStart(2, '0');
    const seconds = now.getSeconds().toString().padStart(2, '0');
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
    for (let i = 0; i < this.operationHistory.length && i < MAX_HISTORY_SIZE - 1; i++) {
      newHistory.push(this.operationHistory[i]);
    }
    this.operationHistory = newHistory;
  }

  private getErrorSuggestion(code: number): string {
    switch (code) {
      case 801:
        return '请检查设备是否支持 ScreenLockFileManager';
      case 29300002:
        return '系统服务异常，请重启设备';
      case 29300003:
        return '请先在 module.json5 中声明 PROTECT_SCREEN_LOCK_DATA 权限';
      case 29300004:
        return '文件访问被拒绝，请检查密钥状态';
      case 29300005:
        return '请先调用 acquireAccess 申请访问权限';
      default:
        return '未知错误';
    }
  }

  private showError(operation: string, error: BusinessError): void {
    const errorMsg = `${operation}: ${error.code}, ${error.message}`;
    const suggestion = this.getErrorSuggestion(error.code);
    this.operationResult = `${errorMsg}\n建议: ${suggestion}`;
    this.addHistory(operation, `Error(${error.code})`);
    hilog.error(DOMAIN, TAG, '%{public}s failed. Code: %{public}d, message: %{public}s',
      operation, error.code, error.message);
  }

  private queryKeyState(): void {
    try {
      const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      const resultText = `queryAppKeyState: ${this.getKeyStatusName(status)}`;
      this.operationResult = resultText;
      this.addHistory('queryAppKeyState', this.getKeyStatusName(status));
      hilog.info(DOMAIN, TAG, 'queryAppKeyState succeeded. Status: %{public}d', status);
    } catch (error) {
      this.showError('queryAppKeyState', error as BusinessError);
    }
  }

  private acquire(): void {
    try {
      // 前置条件检查: 查询密钥状态是否为 KEY_EXIST
      const keyStatus: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      if (keyStatus !== screenLockFileManager.KeyStatus.KEY_EXIST) {
        const keyName = this.getKeyStatusName(keyStatus);
        const tipText = `前置条件不满足\n密钥状态: ${keyName}\n请先开启锁屏敏感数据保护功能`;
        this.operationResult = tipText;
        this.addHistory('acquireAccess', 'Precondition failed');
        hilog.warn(DOMAIN, TAG, 'acquireAccess precondition failed. KeyStatus: %{public}d', keyStatus);
        return;
      }

      // 调用 acquireAccess 申请访问权限
      const status: screenLockFileManager.AccessStatus = screenLockFileManager.acquireAccess();
      const resultText = `acquireAccess: ${this.getAccessStatusName(status)}`;
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
      // 前置条件检查: 确认已申请访问权限
      if (this.acquireCount <= this.releaseCount) {
        const tipText =
          `配对检查失败\n申请次数: ${this.acquireCount}，释放次数: ${this.releaseCount}\n请先调用 acquireAccess 申请访问权限`;
        this.operationResult = tipText;
        this.addHistory('releaseAccess', 'Pairing check failed');
        hilog.warn(DOMAIN, TAG, 'releaseAccess pairing check failed. Acquire: %{public}d, Release: %{public}d',
          this.acquireCount, this.releaseCount);
        return;
      }

      // 调用 releaseAccess 释放访问权限
      const status: screenLockFileManager.ReleaseStatus = screenLockFileManager.releaseAccess();
      const resultText = `releaseAccess: ${this.getReleaseStatusName(status)}`;
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
      const keyName = this.getKeyStatusName(keyStatus);
      const allResult =
        `KeyState: ${keyName} | Acquire: ${this.acquireCount} | Release: ${this.releaseCount} | Pending: ${this.getPendingCount()}`;
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
    this.acquireCount = 0;
    this.releaseCount = 0;
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

        // DataType 枚举程序化展示
        Column({ space: ITEM_SPACING }) {
          Text($r('app.string.data_type_enum_title'))
            .fontSize(SUBTITLE_FONT_SIZE)
            .fontWeight(FontWeight.Medium)
            .fontColor($r('app.color.primary_text'))
            .width('100%')
          Text(`MEDIA_DATA = ${screenLockFileManager.DataType.MEDIA_DATA} (0x00000001)`)
            .fontSize(BODY_FONT_SIZE)
            .fontColor($r('app.color.secondary_text'))
            .width('100%')
          Text(`ALL_DATA = ${screenLockFileManager.DataType.ALL_DATA} (0xffffffff)`)
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
          Text(`Acquire: ${this.acquireCount}  |  Release: ${this.releaseCount}  |  Pending: ${this.getPendingCount()}`)
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
              Text(`[${record.timestamp}]`)
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
