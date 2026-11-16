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

import { common } from '@kit.AbilityKit';
import { PAGE_LOG_LIMIT } from '../common/AppConstants';
import { text } from '../common/StringResource';
import { AppColors, AppRadius, AppSize, AppSpacing, AppText } from '../common/Theme';
import { maskDeviceId } from '../model/DeviceAddress';
import { ProfileKind, ProfileMeta, metaOf } from '../model/ProfileCatalog';
import { LogLevel } from '../model/LogStore';
import { ProfileSnapshot, ProfileViewState } from '../model/ProfileSnapshot';
import { ProbeStatus, isReadyStatus, nextSubscriptionAction, probeStatusHint, probeStatusName,
  summarizeDeviceList } from '../model/ProfileState';
import {
  BluetoothStateResult,
  PairedDeviceResult,
  listPairedDevices,
  readBluetoothState,
  readRemoteDeviceName
} from '../utils/BluetoothAccess';
import { Logger } from '../utils/Logger';
import { PermissionOutcome, requestBluetoothPermission } from '../utils/PermissionUtil';
import { profileFactoryOf } from '../utils/ProfileFactory';
import { HfpAgResult, probeHfpAg } from '../utils/ProfileFeature';
import { ProfileSession } from '../utils/ProfileSession';
import { ActionButton, KeyValueRow, SectionCard, StatusChip, WidgetTone } from './CommonWidgets';
import { LogPanel } from './LogPanel';

/**
 * HFP（AG 角色）演示页：创建实例 → 查询设备 → 查询连接状态 → 订阅 → 释放。
 * 蓝牙调用顺序统一收敛在这里，页面只负责把会话快照渲染成卡片。
 */
@Component
export struct ProfileDemoPage {
  kind: ProfileKind = ProfileKind.HFP;
  title: string = '';
  logSource: string = '';
  navPathStack: NavPathStack = new NavPathStack();
  @State probeStatus: ProbeStatus = ProbeStatus.IDLE;
  @State statusText: string = probeStatusName(ProbeStatus.IDLE);
  @State statusCode: number = 0;
  @State statusMessage: string = text('snapshot_no_instance');
  @State hintText: string = probeStatusHint(ProbeStatus.IDLE);
  @State deviceSummary: string = summarizeDeviceList([]);
  @State connectionText: string = text('snapshot_no_query');
  @State subscribed: boolean = false;
  @State updatedAt: string = '--:--:--';
  @State devices: string[] = [];
  @State selectedDevice: string = '';
  @State bluetoothText: string = text('state_unread');
  @State permissionText: string = text('state_unqueried');
  @State pairedText: string = text('state_unqueried');
  @State featureText: string = text('state_unqueried');
  private session: ProfileSession | null = null;

  private meta(): ProfileMeta {
    return metaOf(this.kind);
  }

  aboutToAppear(): void {
    const session = new ProfileSession(profileFactoryOf(), this.logSource);
    this.session = session;
    this.applyView(session.getSnapshot());
    this.readState();
    Logger.info(this.logSource, 'page', 'opened');
  }

  /**
   * 把会话快照同步到页面状态。
   * 渲染用的字段都是原始类型/数组，逐个赋值即可；页面里显示的 StatusChip、KeyValueRow、
   * ActionButton 的入参都是 @Prop，这里的赋值会同步到这些子组件。
   */
  private applyView(snapshot: ProfileSnapshot): void {
    const previous = new ProfileViewState();
    previous.selectedDevice = this.selectedDevice;
    const view = ProfileViewState.fromSnapshot(snapshot, previous);
    this.probeStatus = view.status;
    this.statusText = view.statusText;
    this.statusCode = view.code;
    this.statusMessage = view.message;
    this.hintText = view.hintText;
    this.deviceSummary = view.deviceSummary;
    this.connectionText = view.connectionText;
    this.subscribed = view.subscribed;
    this.updatedAt = view.updatedAt;
    this.devices = view.devices;
    this.selectedDevice = view.selectedDevice;
  }

  aboutToDisappear(): void {
    const session = this.session;
    if (session !== null) {
      session.release();
    }
    Logger.info(this.logSource, 'page', 'closed');
  }

  private readState(): void {
    const result: BluetoothStateResult = readBluetoothState();
    this.bluetoothText = result.describe();
  }

  private ensureProfile(): void {
    const session = this.session;
    if (session === null) {
      return;
    }
    const snapshot = session.ensureProfile();
    this.applyView(snapshot);
    Logger.info(this.logSource, 'ensureProfile', `status=${snapshot.status}, code=${snapshot.code}`);
  }

  private refreshDevices(): void {
    const session = this.session;
    if (session === null) {
      return;
    }
    const snapshot = session.refreshDevices();
    this.applyView(snapshot);
    Logger.info(this.logSource, 'refreshDevices', `count=${snapshot.deviceCount()}, code=${snapshot.code}`);
  }

  private refreshConnection(): void {
    const session = this.session;
    if (session === null) {
      return;
    }
    if (this.selectedDevice.length === 0) {
      Logger.warn(this.logSource, 'refreshState', 'no device selected');
      return;
    }
    const snapshot = session.refreshState(this.selectedDevice);
    this.applyView(snapshot);
    Logger.info(this.logSource, 'refreshState', `code=${snapshot.code}`);
  }

  private toggleSubscription(): void {
    const session = this.session;
    if (session === null) {
      return;
    }
    const snapshot = this.subscribed ? session.unsubscribe() : session.subscribe();
    this.applyView(snapshot);
    Logger.info(this.logSource, 'subscription', `subscribed=${snapshot.subscribed}, code=${snapshot.code}`);
  }

  private releaseProfile(): void {
    const session = this.session;
    if (session === null) {
      return;
    }
    session.release();
    this.applyView(session.getSnapshot());
  }

  private readPairedDevices(): void {
    const result: PairedDeviceResult = listPairedDevices();
    this.pairedText = result.devices.length > 0 ?
      text('demo_paired_list', result.message,
        result.devices.map((device: string) => this.describePairedDevice(device))
          .join(text('common_list_separator'))) :
      result.message;
    Logger.info(this.logSource, 'pairedDevices', `count=${result.devices.length}, code=${result.code}`);
  }

  /** 已配对设备带上名称，否则只有掩码地址用户无法确认是哪台设备 */
  private describePairedDevice(deviceId: string): string {
    const name = readRemoteDeviceName(deviceId);
    return text('common_device_with_address',
      name.length > 0 ? name : text('common_unknown_device'), maskDeviceId(deviceId));
  }

  /**
   * 「查询连接状态」按钮的解释：getConnectionState 必须传入一个 deviceId，
   * 这个 deviceId 只可能来自 getConnectedDevices()，所以设备列表为空时按钮只能置灰。
   * 顺带提醒：系统蓝牙里的「已配对」不等于该 Profile 已「已连接」。
   */
  private connectionHint(): string {
    if (this.devices.length > 0) {
      return text('demo_connection_hint_devices', this.devices.length);
    }
    return text('demo_connection_hint_empty');
  }

  private async requestPermission(): Promise<void> {
    const host = this.getUIContext().getHostContext();
    if (host === undefined) {
      this.permissionText = text('demo_permission_no_context');
      Logger.warn(this.logSource, 'permission', 'host context is undefined');
      return;
    }
    const outcome: PermissionOutcome = await requestBluetoothPermission(host as common.UIAbilityContext);
    this.permissionText = outcome.describe();
    Logger.info(this.logSource, 'permission', `granted=${outcome.granted}, code=${outcome.code}`);
  }

  /** AG 能力探测：一次创建 + 一次 getConnectedDevices()，页面只展示结论与成因 */
  private queryAgFeature(): void {
    const result: HfpAgResult = probeHfpAg();
    const reason: string = result.reason();
    this.featureText = reason.length > 0 ? `${result.describe()}\n${reason}` : result.describe();
    Logger.record(result.code === 0 ? LogLevel.INFO : LogLevel.ERROR, this.logSource, 'agFeature',
      `created=${result.created}, deviceCount=${result.deviceCount}, code=${result.code}`);
  }

  /** 这组按钮调用的都是 HFP 模块的入口，设备形态或蓝牙状态不满足时直接返回错误码 */
  private featureHint(): string {
    return text('demo_feature_hint');
  }

  private statusTone(): WidgetTone {
    if (isReadyStatus(this.probeStatus)) {
      return WidgetTone.SUCCESS;
    }
    if (this.probeStatus === ProbeStatus.IDLE) {
      return WidgetTone.NEUTRAL;
    }
    return WidgetTone.DANGER;
  }

  private deviceOptions(): SelectOption[] {
    return this.devices.map((device: string) => {
      const option: SelectOption = { value: device };
      return option;
    });
  }

  private deviceIndex(): number {
    return this.devices.indexOf(this.selectedDevice);
  }

  private goBack(): void {
    if (this.navPathStack.size() === 0) {
      return;
    }
    this.navPathStack.pop();
  }

  @Builder
  header() {
    Column({ space: AppSpacing.XS }) {
      Row({ space: AppSpacing.MD }) {
        Button(text('common_back'))
          .fontSize(AppText.BODY)
          .height(AppSize.BUTTON_SM)
          .backgroundColor(AppColors.PRIMARY_SOFT)
          .fontColor(AppColors.PRIMARY)
          .onClick(() => {
            this.goBack();
          })
        Text(this.title)
          .fontSize(AppText.DISPLAY)
          .fontWeight(FontWeight.Bold)
          .fontColor(AppColors.TEXT_PRIMARY)
          .layoutWeight(1)
        StatusChip({ text: this.statusText, tone: this.statusTone() })
      }
      .width('100%')
      .alignItems(VerticalAlign.Center)

      Text(`${this.meta().apiName} · ${this.meta().interfaceName} · ${this.meta().createFunction}`)
        .fontSize(AppText.SMALL)
        .fontColor(AppColors.TEXT_TERTIARY)
        .width('100%')
    }
    .width('100%')
    .padding({ left: AppSpacing.PAGE, right: AppSpacing.PAGE, top: AppSpacing.XL, bottom: AppSpacing.MD })
    .backgroundColor(AppColors.CARD_BG)
  }

  @Builder
  statusCard() {
    SectionCard({ title: text('demo_status_title'), subtitle: this.updatedAt }) {
      Column({ space: AppSpacing.SM }) {
        KeyValueRow({
          label: text('demo_label_status'),
          value: text('common_status_with_code', this.statusText, this.statusCode)
        })
        KeyValueRow({ label: text('demo_label_message'), value: this.statusMessage })
        KeyValueRow({ label: text('demo_label_hint'), value: this.hintText, valueColor: AppColors.TEXT_SECONDARY })
        KeyValueRow({ label: text('demo_label_devices'), value: this.deviceSummary })
        KeyValueRow({ label: text('demo_label_connection'), value: this.connectionText })
        KeyValueRow({
          label: text('demo_label_subscription'),
          value: this.subscribed ? text('common_subscribed') : text('common_unsubscribed')
        })
        KeyValueRow({ label: text('demo_label_role'), value: this.meta().role })
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)
    }
  }

  @Builder
  actionCard() {
    SectionCard({ title: text('demo_action_title'), subtitle: text('demo_action_subtitle') }) {
      Column({ space: AppSpacing.LG }) {
        Row({ space: AppSpacing.MD }) {
          ActionButton({
            label: text('demo_action_create'),
            onAction: () => {
              this.ensureProfile();
            }
          })
          ActionButton({
            label: text('demo_action_query_devices'),
            tone: WidgetTone.SUCCESS,
            onAction: () => {
              this.refreshDevices();
            }
          })
        }
        .width('100%')

        Row({ space: AppSpacing.MD }) {
          ActionButton({
            label: nextSubscriptionAction(this.subscribed),
            tone: WidgetTone.WARNING,
            onAction: () => {
              this.toggleSubscription();
            }
          })
          ActionButton({
            label: text('demo_action_release'),
            tone: WidgetTone.DANGER,
            onAction: () => {
              this.releaseProfile();
            }
          })
        }
        .width('100%')

        Row({ space: AppSpacing.MD }) {
          ActionButton({
            label: text('demo_action_read_state'),
            tone: WidgetTone.NEUTRAL,
            onAction: () => {
              this.readState();
            }
          })
          ActionButton({
            label: text('demo_action_paired'),
            tone: WidgetTone.NEUTRAL,
            onAction: () => {
              this.readPairedDevices();
            }
          })
        }
        .width('100%')

        Row({ space: AppSpacing.MD }) {
          ActionButton({
            label: text('demo_action_ag_probe'),
            onAction: () => {
              this.queryAgFeature();
            }
          })
        }
        .width('100%')

        Text(this.featureText)
          .fontSize(AppText.SMALL)
          .fontColor(AppColors.TEXT_SECONDARY)
          .width('100%')
        Text(this.featureHint())
          .fontSize(AppText.CAPTION)
          .fontColor(AppColors.TEXT_MUTED)
          .width('100%')

        Text(this.bluetoothText)
          .fontSize(AppText.SMALL)
          .fontColor(AppColors.TEXT_SECONDARY)
          .width('100%')
        Text(this.pairedText)
          .fontSize(AppText.SMALL)
          .fontColor(AppColors.TEXT_SECONDARY)
          .width('100%')
        Text(text('demo_paired_note'))
          .fontSize(AppText.CAPTION)
          .fontColor(AppColors.TEXT_MUTED)
          .width('100%')
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)
    }
  }

  @Builder
  deviceCard() {
    SectionCard({ title: text('demo_device_title'), subtitle: text('demo_device_count', this.devices.length) }) {
      Column({ space: AppSpacing.MD }) {
        if (this.devices.length === 0) {
          Text(text('demo_device_empty'))
            .fontSize(AppText.BODY)
            .fontColor(AppColors.TEXT_MUTED)
            .width('100%')
        } else {
          Select(this.deviceOptions())
            .selected(this.deviceIndex())
            .value(this.selectedDevice.length > 0 ? maskDeviceId(this.selectedDevice) : text('demo_select_device'))
            .width('100%')
            .onSelect((index: number, value: string) => {
              this.selectedDevice = value;
              Logger.info(this.logSource, 'device', 'selection changed');
            })
        }

        Row({ space: AppSpacing.MD }) {
          ActionButton({
            label: text('demo_action_query_connection'),
            actionEnabled: this.devices.length > 0,
            onAction: () => {
              this.refreshConnection();
            }
          })
          ActionButton({
            label: text('demo_action_request_permission'),
            tone: WidgetTone.WARNING,
            onAction: () => {
              this.requestPermission();
            }
          })
        }
        .width('100%')

        Text(this.connectionHint())
          .fontSize(AppText.SMALL)
          .fontColor(AppColors.TEXT_TERTIARY)
          .width('100%')

        Text(this.permissionText)
          .fontSize(AppText.SMALL)
          .fontColor(AppColors.TEXT_SECONDARY)
          .width('100%')
        Text(this.meta().summary)
          .fontSize(AppText.SMALL)
          .fontColor(AppColors.TEXT_TERTIARY)
          .width('100%')
        Text(this.meta().note)
          .fontSize(AppText.SMALL)
          .fontColor(AppColors.TEXT_TERTIARY)
          .width('100%')
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)
    }
  }

  build() {
    Column() {
      this.header()
      Scroll() {
        Column({ space: AppSpacing.XL }) {
          this.statusCard()
          this.actionCard()
          this.deviceCard()
          LogPanel({
            title: text('demo_log_title', this.title),
            filterSource: this.logSource,
            maxItems: PAGE_LOG_LIMIT
          })
        }
        .width('100%')
        .padding({ left: AppSpacing.PAGE, right: AppSpacing.PAGE, bottom: AppSpacing.PAGE })
      }
      .layoutWeight(1)
      .align(Alignment.TopStart)
      .scrollBar(BarState.Auto)
      .backgroundColor(AppColors.PAGE_BG)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(AppColors.PAGE_BG)
    .borderRadius(AppRadius.CARD)
  }
}
