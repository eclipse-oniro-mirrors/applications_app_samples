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
 * 链路增强（linkEnhance）演示页。
 * 服务端与连接端是两条独立的对象链，页面各持一份 LinkSession 状态：
 * 服务端 EMPTY → SERVER_CREATED → SERVER_STARTED → SERVER_STOPPED → CLOSED，
 * 连接端 EMPTY → CONNECTION_CREATED → CONNECTING → CONNECTED，断连后退回 CONNECTION_CREATED。
 * connectResult / disconnected / dataReceived 三个真回调会反向推进状态，避免页面显示的阶段与系统不一致。
 */

import {
  DEFAULT_CONNECTION_NAME, DEFAULT_SERVER_NAME, LINK_PAYLOAD_LIMIT, PAGE_LOG_LIMIT
} from '../../common/AppConstants';
import { AppColors, AppSpacing, AppText } from '../../common/Theme';
import { text, text1, text2 } from '../../common/StringResource';
import { ActionButton, KeyValueRow, SectionCard, StatusChip, WidgetTone } from '../../components/CommonWidgets';
import { LogPanel } from '../../components/LogPanel';
import { FeatureKind, FeatureMeta, metaOf, noteText, permissionText, summaryText, titleText } from '../../model/DistributedCatalog';
import {
  LinkAction, LinkStage, canConnect, canSend, canStart, canStop, nextStage, stageHint, stageName
} from '../../model/LinkSession';
import { LogLevel } from '../../model/LogStore';
import { utf8Length } from '../../model/TextCodec';
import { BleAdvertiser, BlePeer, BlePeerScanner } from '../../utils/BlePeerScanner';
import { LinkRunner, ProbeOutcome } from '../../utils/DistributedProbe';
import { Logger } from '../../utils/Logger';

const SOURCE: string = 'LinkEnhanceDemo';

/** 扫描结果只用于挑选对端，限制条数避免列表与回调频次失控 */
const PEER_SCAN_LIMIT: number = 20;

@Component
export struct LinkEnhanceDemo {
  navPathStack: NavPathStack = new NavPathStack();
  @State serverStage: LinkStage = LinkStage.EMPTY;
  @State connStage: LinkStage = LinkStage.EMPTY;
  @State serverName: string = DEFAULT_SERVER_NAME;
  @State connectionName: string = DEFAULT_CONNECTION_NAME;
  @State deviceId: string = '';
  @State payload: string = 'hello linkEnhance';
  @State outcomeText: string = text('demo_no_call');
  @State outcomeOk: boolean = true;
  @State eventText: string = text('demo_no_event');
  @State receivedText: string = text('demo_no_received');
  @State peerText: string = text('demo_dash');
  /** 服务端收到 connectionAccepted：此时 LinkRunner 里的 Connection 已经可用，可以回发数据 */
  @State accepted: boolean = false;
  @State blePeers: BlePeer[] = [];
  @State scanning: boolean = false;
  @State scanText: string = text('link_scan_idle');
  @State advertising: boolean = false;
  @State advText: string = text('link_adv_idle');
  private meta: FeatureMeta = metaOf(FeatureKind.LINK);
  private runner: LinkRunner | null = null;
  private scanner: BlePeerScanner | null = null;
  private advertiser: BleAdvertiser | null = null;

  aboutToAppear(): void {
    const runner = new LinkRunner(SOURCE);
    runner.onEvent = (event: string) => {
      this.eventText = event;
      this.syncRunnerView();
    };
    runner.onConnectResult = (success: boolean) => {
      this.connStage = success ? LinkStage.CONNECTED : LinkStage.CONNECTION_CREATED;
      Logger.info(SOURCE, 'StateMachine', `connectResult advanced to ${this.connStage}`);
    };
    runner.onDisconnected = () => {
      this.connStage = nextStage(this.connStage, LinkAction.DISCONNECT);
      this.accepted = false;
      Logger.warn(SOURCE, 'StateMachine', `disconnected, back to ${this.connStage}`);
    };
    runner.onAccepted = () => {
      // 服务端不推进「连接端」阶段（那是另一条对象链），单独用一个标记放开发送
      this.accepted = true;
      Logger.info(SOURCE, 'StateMachine', 'peer accepted, server side can send now');
    };
    this.runner = runner;
    const scanner = new BlePeerScanner(SOURCE);
    scanner.onUpdate = (peers: BlePeer[]) => {
      this.blePeers = peers.slice();
      this.scanText = text1('link_scan_found', `${this.blePeers.length}`);
    };
    scanner.onError = (code: number, message: string) => {
      this.scanning = false;
      this.scanText = text2('link_scan_failed', `${code}`, message);
    };
    this.scanner = scanner;
    const advertiser = new BleAdvertiser(SOURCE);
    advertiser.onStateChange = (advertising: boolean, code: number, message: string) => {
      this.advertising = advertising;
      if (code === 0) {
        this.advText = advertising ? text('link_adv_on') : text('link_adv_off');
      } else {
        this.advText = text2('link_adv_failed', `${code}`, message);
      }
    };
    this.advertiser = advertiser;
    Logger.info(SOURCE, 'Page', 'link enhance demo opened');
  }

  aboutToDisappear(): void {
    const advertiser = this.advertiser;
    if (advertiser !== null) {
      advertiser.stop();
      this.advertiser = null;
    }
    const scanner = this.scanner;
    if (scanner !== null) {
      scanner.stop();
      this.scanner = null;
    }
    const runner = this.runner;
    if (runner !== null) {
      runner.releaseAll();
      this.runner = null;
    }
    Logger.info(SOURCE, 'Page', 'link enhance demo closed');
  }

  private syncRunnerView(): void {
    const runner = this.runner;
    if (runner === null) {
      return;
    }
    const peer = runner.peerDeviceId();
    this.peerText = peer.length > 0 ? peer : text('demo_dash');
    this.receivedText = runner.lastReceived();
  }

  private report(outcome: ProbeOutcome): void {
    this.outcomeOk = outcome.succeeded();
    this.outcomeText = text2('probe_hint_pair', outcome.describe(), outcome.hint());
    Logger.record(outcome.succeeded() ? LogLevel.INFO : LogLevel.ERROR, SOURCE, outcome.action, outcome.describe());
    this.syncRunnerView();
  }

  private createServer(): void {
    const runner = this.runner;
    if (runner === null) {
      return;
    }
    const outcome = runner.createServer(this.serverName);
    this.report(outcome);
    if (outcome.succeeded()) {
      this.serverStage = nextStage(this.serverStage, LinkAction.CREATE_SERVER);
    }
  }

  private startServer(): void {
    const runner = this.runner;
    if (runner === null) {
      return;
    }
    const outcome = runner.startServer();
    this.report(outcome);
    if (outcome.succeeded()) {
      this.serverStage = nextStage(this.serverStage, LinkAction.START);
    }
  }

  private stopServer(): void {
    const runner = this.runner;
    if (runner === null) {
      return;
    }
    const outcome = runner.stopServer();
    this.report(outcome);
    if (outcome.succeeded()) {
      this.serverStage = nextStage(this.serverStage, LinkAction.STOP);
      this.accepted = false;
    }
  }

  private closeServer(): void {
    const runner = this.runner;
    if (runner === null) {
      return;
    }
    const outcome = runner.closeServer();
    this.report(outcome);
    if (outcome.succeeded()) {
      this.serverStage = nextStage(this.serverStage, LinkAction.CLOSE);
      this.accepted = false;
    }
  }

  private createConnection(): void {
    const runner = this.runner;
    if (runner === null) {
      return;
    }
    const outcome = runner.createConnection(this.deviceId.trim(), this.connectionName.trim());
    this.report(outcome);
    if (outcome.succeeded()) {
      this.connStage = nextStage(this.connStage, LinkAction.CREATE_CONNECTION);
    }
  }

  private connect(): void {
    const runner = this.runner;
    if (runner === null) {
      return;
    }
    const outcome = runner.connect();
    this.report(outcome);
    if (outcome.succeeded()) {
      this.connStage = nextStage(this.connStage, LinkAction.CONNECT);
    }
  }

  private disconnect(): void {
    const runner = this.runner;
    if (runner === null) {
      return;
    }
    const outcome = runner.disconnect();
    this.report(outcome);
    if (outcome.succeeded()) {
      this.connStage = nextStage(this.connStage, LinkAction.DISCONNECT);
    }
  }

  private closeConnection(): void {
    const runner = this.runner;
    if (runner === null) {
      return;
    }
    const outcome = runner.closeConnection();
    this.report(outcome);
    if (outcome.succeeded()) {
      this.connStage = nextStage(this.connStage, LinkAction.CLOSE);
    }
  }

  private sendData(): void {
    const runner = this.runner;
    if (runner === null) {
      return;
    }
    this.report(runner.sendData(this.payload));
  }

  private canForceSend(): boolean {
    return this.connStage === LinkStage.CONNECTION_CREATED || this.connStage === LinkStage.CONNECTING;
  }

  /** 连接端「已连接」或服务端「已接入对端」两种情况下，Connection 对象都可发数据 */
  private sendReady(): boolean {
    return canSend(this.connStage) || this.accepted;
  }

  /** 扫描与创建连接是两件事：扫描只负责把对端 BLE MAC 拿回来，不碰 linkEnhance */
  private toggleScan(): void {
    const scanner = this.scanner;
    if (scanner === null) {
      return;
    }
    if (scanner.isScanning()) {
      scanner.stop();
      this.scanning = false;
      this.scanText = text1('link_scan_stopped', `${this.blePeers.length}`);
      return;
    }
    scanner.start(PEER_SCAN_LIMIT);
    this.scanning = scanner.isScanning();
    if (this.scanning) {
      this.scanText = text('link_scan_running');
    }
  }

  private applyPeer(peer: BlePeer): void {
    this.deviceId = peer.deviceId;
    this.scanText = text1('link_peer_applied', peer.deviceId);
    // 日志不写设备地址，地址只留在页面上供填入
    Logger.info(SOURCE, 'deviceId', 'peer address filled from scan');
  }

  /** 服务端用它：不开广播，对端扫不到本机，也就拿不到要填的 deviceId */
  private toggleAdvertise(): void {
    const advertiser = this.advertiser;
    if (advertiser === null) {
      return;
    }
    if (advertiser.isAdvertising()) {
      advertiser.stop();
      return;
    }
    advertiser.start();
    this.advertising = advertiser.isAdvertising();
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
        StatusChip({
          text: stageName(this.connStage),
          tone: this.connStage === LinkStage.CONNECTED ? WidgetTone.SUCCESS : WidgetTone.NEUTRAL
        })
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
    SectionCard({ title: text('link_card_status'), subtitle: text('link_card_status_sub') }) {
      Column({ space: AppSpacing.SM }) {
        KeyValueRow({
          label: text('link_label_server'),
          value: text2('link_state_text', stageName(this.serverStage), stageHint(this.serverStage))
        })
        KeyValueRow({
          label: text('link_label_conn'),
          value: text2('link_state_text', stageName(this.connStage), stageHint(this.connStage))
        })
        KeyValueRow({ label: text('link_label_peer'), value: this.peerText, mono: true })
        KeyValueRow({
          label: text('link_label_last_call'),
          value: this.outcomeText,
          valueColor: this.outcomeOk ? AppColors.TEXT_STRONG : AppColors.DANGER
        })
        KeyValueRow({ label: text('link_label_last_event'), value: this.eventText })
        KeyValueRow({ label: text('link_label_received'), value: this.receivedText })
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)
    }
  }

  @Builder
  peerCard() {
    SectionCard({ title: text('link_card_peer'), subtitle: text('link_card_peer_sub') }) {
      Column({ space: AppSpacing.SM }) {
        Row({ space: AppSpacing.MD }) {
          ActionButton({
            label: this.scanning ? text('link_btn_stop_scan') : text('link_btn_scan'),
            tone: this.scanning ? WidgetTone.WARNING : WidgetTone.NEUTRAL,
            onAction: () => {
              this.toggleScan();
            }
          })
        }
        .width('100%')

        Text(this.scanText)
          .fontSize(AppText.SMALL)
          .fontColor(AppColors.TEXT_SECONDARY)
          .width('100%')

        ForEach(this.blePeers, (peer: BlePeer) => {
          Row({ space: AppSpacing.SM }) {
            Text(text('link_btn_fill'))
              .fontSize(AppText.SMALL)
              .fontColor(AppColors.PRIMARY)
            Text(peer.label())
              .fontSize(AppText.SMALL)
              .fontColor(AppColors.TEXT_PRIMARY)
              .layoutWeight(1)
          }
          .width('100%')
          .padding({ top: AppSpacing.XS, bottom: AppSpacing.XS })
          .onClick(() => {
            this.applyPeer(peer);
          })
        }, (peer: BlePeer) => peer.deviceId)

        Row({ space: AppSpacing.MD }) {
          ActionButton({
            label: this.advertising ? text('link_btn_stop_adv') : text('link_btn_adv'),
            tone: this.advertising ? WidgetTone.WARNING : WidgetTone.SUCCESS,
            onAction: () => {
              this.toggleAdvertise();
            }
          })
        }
        .width('100%')

        Text(this.advText)
          .fontSize(AppText.SMALL)
          .fontColor(AppColors.TEXT_SECONDARY)
          .width('100%')

        Text(text('link_peer_note'))
          .fontSize(AppText.CAPTION)
          .fontColor(AppColors.TEXT_MUTED)
          .width('100%')
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)
    }
  }

  @Builder
  serverCard() {
    SectionCard({ title: text('link_card_server'), subtitle: text('link_card_server_sub') }) {
      Column({ space: AppSpacing.MD }) {
        TextInput({ placeholder: $r('app.string.link_input_server_name'), text: this.serverName })
          .fontSize(AppText.BODY)
          .height(34)
          .backgroundColor(AppColors.SUBTLE_BG)
          .onChange((value: string) => {
            this.serverName = value;
          })

        Row({ space: AppSpacing.MD }) {
          ActionButton({
            label: 'createServer',
            onAction: () => {
              this.createServer();
            }
          })
          ActionButton({
            label: 'start',
            tone: WidgetTone.SUCCESS,
            actionEnabled: canStart(this.serverStage),
            onAction: () => {
              this.startServer();
            }
          })
        }
        .width('100%')

        Row({ space: AppSpacing.MD }) {
          ActionButton({
            label: 'stop',
            tone: WidgetTone.WARNING,
            actionEnabled: canStop(this.serverStage),
            onAction: () => {
              this.stopServer();
            }
          })
          ActionButton({
            label: 'close',
            tone: WidgetTone.DANGER,
            actionEnabled: this.serverStage !== LinkStage.EMPTY && this.serverStage !== LinkStage.CLOSED,
            onAction: () => {
              this.closeServer();
            }
          })
        }
        .width('100%')

        Text(text('link_server_note'))
          .fontSize(AppText.CAPTION)
          .fontColor(AppColors.TEXT_MUTED)
          .width('100%')
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)
    }
  }

  @Builder
  clientCard() {
    SectionCard({ title: text('link_card_client'), subtitle: text('link_card_client_sub') }) {
      Column({ space: AppSpacing.MD }) {
        TextInput({ placeholder: $r('app.string.link_input_device'), text: this.deviceId })
          .fontSize(AppText.BODY)
          .height(34)
          .backgroundColor(AppColors.SUBTLE_BG)
          .onChange((value: string) => {
            this.deviceId = value;
          })
        TextInput({ placeholder: $r('app.string.link_input_conn_name'), text: this.connectionName })
          .fontSize(AppText.BODY)
          .height(34)
          .backgroundColor(AppColors.SUBTLE_BG)
          .onChange((value: string) => {
            this.connectionName = value;
          })

        Row({ space: AppSpacing.MD }) {
          ActionButton({
            label: 'createConnection',
            onAction: () => {
              this.createConnection();
            }
          })
          ActionButton({
            label: 'connect',
            tone: WidgetTone.SUCCESS,
            actionEnabled: canConnect(this.connStage),
            onAction: () => {
              this.connect();
            }
          })
        }
        .width('100%')

        Row({ space: AppSpacing.MD }) {
          ActionButton({
            label: 'disconnect',
            tone: WidgetTone.WARNING,
            actionEnabled: this.connStage === LinkStage.CONNECTED || this.connStage === LinkStage.CONNECTING,
            onAction: () => {
              this.disconnect();
            }
          })
          ActionButton({
            label: 'close',
            tone: WidgetTone.DANGER,
            actionEnabled: this.connStage !== LinkStage.EMPTY && this.connStage !== LinkStage.CLOSED,
            onAction: () => {
              this.closeConnection();
            }
          })
        }
        .width('100%')

        Text(text('link_client_note'))
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
    SectionCard({ title: text('link_card_send'), subtitle: text1('link_send_sub', `${LINK_PAYLOAD_LIMIT}`) }) {
      Column({ space: AppSpacing.MD }) {
        TextInput({ placeholder: $r('app.string.link_input_payload'), text: this.payload })
          .fontSize(AppText.BODY)
          .height(34)
          .backgroundColor(AppColors.SUBTLE_BG)
          .onChange((value: string) => {
            this.payload = value;
          })
        Text(text2('link_len_text', `${utf8Length(this.payload)}`, `${LINK_PAYLOAD_LIMIT}`))
          .fontSize(AppText.SMALL)
          .fontColor(utf8Length(this.payload) > LINK_PAYLOAD_LIMIT ? AppColors.DANGER : AppColors.TEXT_TERTIARY)
          .width('100%')

        Row({ space: AppSpacing.MD }) {
          ActionButton({
            label: 'sendData',
            actionEnabled: this.sendReady(),
            onAction: () => {
              this.sendData();
            }
          })
          ActionButton({
            label: text('link_btn_force_send'),
            tone: WidgetTone.WARNING,
            actionEnabled: this.canForceSend(),
            onAction: () => {
              this.sendData();
            }
          })
        }
        .width('100%')

        Text(text('link_send_note'))
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
    SectionCard({ title: text('link_card_note'), subtitle: text('link_card_note_sub') }) {
      Column({ space: AppSpacing.SM }) {
        Text(summaryText(this.meta))
          .fontSize(AppText.SMALL)
          .fontColor(AppColors.TEXT_SECONDARY)
          .width('100%')
        Text(noteText(this.meta))
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
          this.peerCard()
          this.serverCard()
          this.clientCard()
          this.sendCard()
          this.noteCard()
          LogPanel({ title: $r('app.string.log_title_link'), filterSource: SOURCE, maxItems: PAGE_LOG_LIMIT })
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
