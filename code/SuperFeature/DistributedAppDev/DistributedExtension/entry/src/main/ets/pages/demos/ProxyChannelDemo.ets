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

/**
 * 代理通道（proxyChannelManager）演示页。
 * 两条互不干扰的状态线：
 * - ChannelStage：openProxyChannel 的 Promise 成功与否（CLOSED/OPENING/OPEN/FAILED）
 * - ChannelState：channelStateChange 回调里的通道可用性（0 等待恢复 / 1 已恢复 / 2 软件异常 / 3 配对被删）
 * 对端参数在发请求前先做本地格式校验，避免把明显无效的 MAC/UUID 发出去再等一个 32390006。
 */

import {
  BT_PEER_LIMIT, CHANNEL_PAYLOAD_LIMIT, DEFAULT_PEER_ADDRESS, DEFAULT_PEER_UUID, PAGE_LOG_LIMIT
} from '../../common/AppConstants';
import { AppColors, AppSpacing, AppText } from '../../common/Theme';
import { text, text1, text2 } from '../../common/StringResource';
import { ActionButton, KeyValueRow, SectionCard, StatusChip, WidgetTone } from '../../components/CommonWidgets';
import { LogPanel } from '../../components/LogPanel';
import {
  ChannelAction, ChannelStage, canSendData, channelStageHint, channelStageName, isMacAddress, isServiceUuid,
  nextChannelStage
} from '../../model/ChannelSession';
import {
  FeatureKind, FeatureMeta, metaOf, noteText, permissionText, summaryText, titleText
} from '../../model/DistributedCatalog';
import { LogLevel } from '../../model/LogStore';
import { utf8Length } from '../../model/TextCodec';
import { BtPeer, BtPeerScanner } from '../../utils/BtPeerScanner';
import { ChannelRunner, ProbeOutcome } from '../../utils/DistributedProbe';
import { Logger } from '../../utils/Logger';

const SOURCE: string = 'ProxyChannelDemo';

@Component
export struct ProxyChannelDemo {
  navPathStack: NavPathStack = new NavPathStack();
  @State channelStage: ChannelStage = ChannelStage.CLOSED;
  @State channelId: number = -1;
  @State peerAddr: string = DEFAULT_PEER_ADDRESS;
  @State peerUuid: string = DEFAULT_PEER_UUID;
  @State payload: string = 'hello proxyChannel';
  @State stateText: string = text('chan_no_state');
  @State eventText: string = text('chan_no_callback');
  @State receivedText: string = text('demo_no_received');
  @State outcomeText: string = text('demo_no_call');
  @State outcomeOk: boolean = true;
  @State busy: boolean = false;
  /** 经典蓝牙候选对端：来自已配对列表或一次主动发现 */
  @State btPeers: BtPeer[] = [];
  @State btFinding: boolean = false;
  @State btNote: string = text('chan_note_initial');
  private meta: FeatureMeta = metaOf(FeatureKind.CHANNEL);
  private runner: ChannelRunner | null = null;
  private scanner: BtPeerScanner | null = null;

  aboutToAppear(): void {
    const runner = new ChannelRunner(SOURCE);
    runner.onEvent = (event: string) => {
      this.eventText = event;
      this.syncRunnerView();
    };
    this.runner = runner;

    const scanner = new BtPeerScanner(SOURCE);
    scanner.onUpdate = (peers: BtPeer[]) => {
      // 用副本刷新：scanner 内部是同一个数组，直接赋值不改引用，ArkUI 不会重绘
      this.btPeers = peers.slice();
      this.btFinding = scanner.isFinding();
      this.btNote = peers.length > 0
        ? text1('chan_note_candidates', `${peers.length}`)
        : text('chan_note_empty');
    };
    // hilog 已在工具层记过一条，这里只把同一个失败转成页面提示，避免重复写日志
    scanner.onError = (code: number, message: string) => {
      this.btNote = text2('chan_note_error', `${code}`, message);
    };
    this.scanner = scanner;

    Logger.info(SOURCE, 'Page', 'proxy channel demo opened');
  }

  aboutToDisappear(): void {
    const runner = this.runner;
    if (runner !== null) {
      runner.release();
      this.runner = null;
    }
    const scanner = this.scanner;
    if (scanner !== null) {
      scanner.release();
      this.scanner = null;
    }
    Logger.info(SOURCE, 'Page', 'proxy channel demo closed');
  }

  private syncRunnerView(): void {
    const runner = this.runner;
    if (runner === null) {
      return;
    }
    this.stateText = runner.stateTextValue();
    this.receivedText = runner.lastReceived();
    this.channelId = runner.channelIdValue();
  }

  private report(outcome: ProbeOutcome): void {
    this.outcomeOk = outcome.succeeded();
    this.outcomeText = text2('probe_hint_pair', outcome.describe(), outcome.hint());
    Logger.record(outcome.succeeded() ? LogLevel.INFO : LogLevel.ERROR, SOURCE, outcome.action, outcome.describe());
    this.syncRunnerView();
  }

  /** 本地格式校验：MAC 与 UUID 都要先在页面上拦住，否则只会拿到一个 32390006 */
  private validateParams(): boolean {
    const addr = this.peerAddr.trim();
    const uuid = this.peerUuid.trim();
    if (!isMacAddress(addr)) {
      this.outcomeOk = false;
      this.outcomeText = text('chan_validate_mac');
      Logger.warn(SOURCE, 'Validate', 'invalid MAC address, request skipped');
      return false;
    }
    if (!isServiceUuid(uuid)) {
      this.outcomeOk = false;
      this.outcomeText = text('chan_validate_uuid');
      Logger.warn(SOURCE, 'Validate', 'invalid service UUID, request skipped');
      return false;
    }
    return true;
  }

  /** 读系统里的已配对设备：只查记录不触发扫描，是取对端经典蓝牙地址最稳的一条路 */
  private loadPairedPeers(): void {
    const scanner = this.scanner;
    if (scanner === null) {
      return;
    }
    scanner.loadPaired();
    this.btFinding = scanner.isFinding();
  }

  /** 主动发现只看得见处于可被发现状态的对端，所以和「读取已配对」并列而不是二选一 */
  private toggleDiscovery(): void {
    const scanner = this.scanner;
    if (scanner === null) {
      return;
    }
    if (scanner.isFinding()) {
      scanner.stopDiscovery();
    } else {
      scanner.startDiscovery(BT_PEER_LIMIT);
    }
    this.btFinding = scanner.isFinding();
  }

  /** 候选行右侧的「填入」只改输入框，不替使用者发起 openProxyChannel */
  private fillPeerAddress(peer: BtPeer): void {
    this.peerAddr = peer.addr;
    const sourceName = peer.name.length > 0
      ? `${peer.sourceName()}${text('chan_name_sep')}${peer.name}`
      : peer.sourceName();
    this.btNote = text2('chan_note_filled', peer.addr, sourceName);
    // 日志不写设备地址，地址只留在页面上供填入
    Logger.info(SOURCE, 'FillAddress', `peer address filled, source ${sourceName}`);
  }

  private async openChannel(): Promise<void> {
    const runner = this.runner;
    if (runner === null || this.busy) {
      return;
    }
    if (!this.validateParams()) {
      return;
    }
    this.busy = true;
    this.channelStage = nextChannelStage(this.channelStage, ChannelAction.OPEN);
    Logger.info(SOURCE, 'StateMachine', `advanced to ${channelStageName(this.channelStage)} before openProxyChannel`);
    const outcome = await runner.open(this.peerAddr.trim(), this.peerUuid.trim());
    this.busy = false;
    this.report(outcome);
    const action = outcome.succeeded() ? ChannelAction.OPEN_OK : ChannelAction.OPEN_FAIL;
    this.channelStage = nextChannelStage(this.channelStage, action);
  }

  private async sendData(): Promise<void> {
    const runner = this.runner;
    if (runner === null || this.busy) {
      return;
    }
    this.busy = true;
    const outcome = await runner.send(this.payload);
    this.busy = false;
    this.report(outcome);
  }

  private closeChannel(): void {
    const runner = this.runner;
    if (runner === null || this.busy) {
      return;
    }
    const outcome = runner.close();
    this.report(outcome);
    if (outcome.succeeded()) {
      this.channelStage = nextChannelStage(this.channelStage, ChannelAction.CLOSE);
    }
  }

  private channelTone(): WidgetTone {
    if (this.channelStage === ChannelStage.OPEN) {
      return WidgetTone.SUCCESS;
    }
    if (this.channelStage === ChannelStage.FAILED) {
      return WidgetTone.DANGER;
    }
    return WidgetTone.NEUTRAL;
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
        Button($r('app.string.demo_back'))
          .fontSize(AppText.BODY)
          .height(30)
          .backgroundColor(AppColors.PRIMARY_SOFT)
          .fontColor(AppColors.PRIMARY)
          .onClick(() => {
            this.goBack();
          })
        Text(titleText(this.meta))
          .fontSize(AppText.DISPLAY)
          .fontWeight(FontWeight.Bold)
          .fontColor(AppColors.TEXT_PRIMARY)
          .layoutWeight(1)
        StatusChip({ text: channelStageName(this.channelStage), tone: this.channelTone() })
      }
      .width('100%')
      .alignItems(VerticalAlign.Center)

      Text(`${this.meta.apiName} · ${permissionText(this.meta)}`)
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
    SectionCard({ title: text('chan_card_status'), subtitle: text('chan_card_status_sub') }) {
      Column({ space: AppSpacing.SM }) {
        KeyValueRow({
          label: text('chan_label_open_flow'),
          value: text2('chan_flow_text', channelStageName(this.channelStage), channelStageHint(this.channelStage))
        })
        KeyValueRow({
          label: text('chan_label_channel_id'),
          value: this.channelId >= 0 ? `${this.channelId}` : text('demo_dash'),
          mono: true
        })
        KeyValueRow({ label: text('chan_label_usability'), value: this.stateText })
        KeyValueRow({
          label: text('chan_label_last_call'),
          value: this.outcomeText,
          valueColor: this.outcomeOk ? AppColors.TEXT_STRONG : AppColors.DANGER
        })
        KeyValueRow({ label: text('chan_label_last_event'), value: this.eventText })
        KeyValueRow({ label: text('chan_label_received'), value: this.receivedText })
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)
    }
  }

  @Builder
  peerPickCard() {
    SectionCard({ title: text('chan_card_peer'), subtitle: text('chan_card_peer_sub') }) {
      Column({ space: AppSpacing.SM }) {
        Row({ space: AppSpacing.MD }) {
          ActionButton({
            label: text('chan_btn_load_paired'),
            tone: WidgetTone.NEUTRAL,
            actionEnabled: !this.busy,
            onAction: () => {
              this.loadPairedPeers();
            }
          })
          ActionButton({
            label: this.btFinding ? text('chan_btn_stop_find') : text('chan_btn_find'),
            tone: this.btFinding ? WidgetTone.WARNING : WidgetTone.PRIMARY,
            actionEnabled: !this.busy,
            onAction: () => {
              this.toggleDiscovery();
            }
          })
        }
        .width('100%')

        Text(this.btNote)
          .fontSize(AppText.SMALL)
          .fontColor(AppColors.TEXT_SECONDARY)
          .width('100%')

        ForEach(this.btPeers, (peer: BtPeer) => {
          Row({ space: AppSpacing.MD }) {
            Column({ space: 2 }) {
              Text(peer.label())
                .fontSize(AppText.SMALL)
                .fontFamily('monospace')
                .fontColor(AppColors.TEXT_STRONG)
                .width('100%')
              Text(peer.sourceName())
                .fontSize(AppText.CAPTION)
                .fontColor(peer.paired ? AppColors.SUCCESS : AppColors.TEXT_MUTED)
                .width('100%')
            }
            .layoutWeight(1)
            .alignItems(HorizontalAlign.Start)

            ActionButton({
              label: text('chan_btn_fill'),
              tone: WidgetTone.SUCCESS,
              actionEnabled: !this.busy,
              onAction: () => {
                this.fillPeerAddress(peer);
              }
            })
          }
          .width('100%')
          .alignItems(VerticalAlign.Center)
        }, (peer: BtPeer) => peer.addr)

        Text(text('chan_peer_note'))
          .fontSize(AppText.CAPTION)
          .fontColor(AppColors.TEXT_MUTED)
          .width('100%')
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)
    }
  }

  @Builder
  paramCard() {
    SectionCard({ title: text('chan_card_param'), subtitle: text('chan_card_param_sub') }) {
      Column({ space: AppSpacing.MD }) {
        TextInput({ placeholder: $r('app.string.chan_input_addr'), text: this.peerAddr })
          .fontSize(AppText.BODY)
          .height(34)
          .backgroundColor(AppColors.SUBTLE_BG)
          .onChange((value: string) => {
            this.peerAddr = value;
          })
        Text(text1('chan_mac_fmt', isMacAddress(this.peerAddr.trim()) ? text('chan_format_ok') : text('chan_format_bad')))
          .fontSize(AppText.SMALL)
          .fontColor(isMacAddress(this.peerAddr.trim()) ? AppColors.TEXT_TERTIARY : AppColors.DANGER)
          .width('100%')
        Text(text('chan_mac_note'))
          .fontSize(AppText.CAPTION)
          .fontColor(AppColors.TEXT_MUTED)
          .width('100%')

        TextInput({ placeholder: $r('app.string.chan_input_uuid'), text: this.peerUuid })
          .fontSize(AppText.BODY)
          .height(34)
          .backgroundColor(AppColors.SUBTLE_BG)
          .onChange((value: string) => {
            this.peerUuid = value;
          })
        Text(text1('chan_uuid_fmt', isServiceUuid(this.peerUuid.trim()) ? text('chan_format_ok') : text('chan_format_bad')))
          .fontSize(AppText.SMALL)
          .fontColor(isServiceUuid(this.peerUuid.trim()) ? AppColors.TEXT_TERTIARY : AppColors.DANGER)
          .width('100%')

        Row({ space: AppSpacing.MD }) {
          ActionButton({
            label: this.busy ? text('chan_btn_open_busy') : 'openProxyChannel',
            actionEnabled: !this.busy,
            onAction: () => {
              this.openChannel();
            }
          })
          ActionButton({
            label: 'closeProxyChannel',
            tone: WidgetTone.DANGER,
            actionEnabled: !this.busy && this.channelId >= 0,
            onAction: () => {
              this.closeChannel();
            }
          })
        }
        .width('100%')

        Text(text('chan_param_note'))
          .fontSize(AppText.CAPTION)
          .fontColor(AppColors.TEXT_MUTED)
          .width('100%')
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)
    }
  }

  @Builder
  sendCard() {
    SectionCard({ title: text('chan_card_send'), subtitle: text1('chan_send_sub', `${CHANNEL_PAYLOAD_LIMIT}`) }) {
      Column({ space: AppSpacing.MD }) {
        TextInput({ placeholder: $r('app.string.chan_input_payload'), text: this.payload })
          .fontSize(AppText.BODY)
          .height(34)
          .backgroundColor(AppColors.SUBTLE_BG)
          .onChange((value: string) => {
            this.payload = value;
          })
        Text(text2('chan_len_text', `${utf8Length(this.payload)}`, `${CHANNEL_PAYLOAD_LIMIT}`))
          .fontSize(AppText.SMALL)
          .fontColor(utf8Length(this.payload) > CHANNEL_PAYLOAD_LIMIT ? AppColors.DANGER : AppColors.TEXT_TERTIARY)
          .width('100%')

        ActionButton({
          label: 'sendData',
          actionEnabled: canSendData(this.channelStage) && !this.busy,
          onAction: () => {
            this.sendData();
          }
        })

        Text(text('chan_send_note'))
          .fontSize(AppText.CAPTION)
          .fontColor(AppColors.TEXT_MUTED)
          .width('100%')
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)
    }
  }

  @Builder
  noteCard() {
    SectionCard({ title: text('chan_card_note'), subtitle: text('chan_card_note_sub') }) {
      Column({ space: AppSpacing.SM }) {
        Text(summaryText(this.meta))
          .fontSize(AppText.SMALL)
          .fontColor(AppColors.TEXT_SECONDARY)
          .width('100%')
        Text(noteText(this.meta))
          .fontSize(AppText.SMALL)
          .fontColor(AppColors.TEXT_TERTIARY)
          .width('100%')
        Text(text('chan_note_body'))
          .fontSize(AppText.CAPTION)
          .fontColor(AppColors.TEXT_MUTED)
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
          this.peerPickCard()
          this.paramCard()
          this.sendCard()
          this.noteCard()
          LogPanel({ title: $r('app.string.log_title_channel'), filterSource: SOURCE, maxItems: PAGE_LOG_LIMIT })
        }
        .width('100%')
        .padding({ left: AppSpacing.PAGE, right: AppSpacing.PAGE, bottom: AppSpacing.PAGE })
      }
      .layoutWeight(1)
      .align(Alignment.TopStart)
      .scrollBar(BarState.Auto)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(AppColors.PAGE_BG)
  }
}
