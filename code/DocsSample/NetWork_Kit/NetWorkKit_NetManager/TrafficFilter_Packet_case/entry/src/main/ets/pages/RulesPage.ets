import { packetFilterApi } from '../api/PacketFilterApi';
import {
  RuleFormModel, HOOK_POINT_OPTIONS, PROTOCOL_OPTIONS,
  SelectOptionItem, FLAG_MASK_OPTIONS, STATE_MASK_OPTIONS
} from '../model/RuleFormModel';
import { IpMatchEditor } from '../components/IpMatchEditor';
import { PortMatchEditor } from '../components/PortMatchEditor';
import { InterfaceMatchEditor } from '../components/InterfaceMatchEditor';
import { HookPoint } from '../types/packetFilter';

@ComponentV2
struct RulesPage {
  @Local form: RuleFormModel = new RuleFormModel();
  @Param controllerIds: number[] = [];
  @Local selectedIdIdx: number = 0;
  @Local resultText: string = '';
  @Local resultOk: boolean = false;
  @Local ruleCount: number = 0;

  aboutToAppear(): void {
    this.refreshIds();
  }
  @Monitor('controllerIds') idsChange(){
    this.refreshIds();
  }

  build() {
    Scroll() {
      Column({ space: 12 }) {
        Text('addRule / clearRule')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor($r('app.color.text_primary'))

        Column({ space: 8 }) {
          Row({ space: 8 }) {
            Text('目标 Controller id').fontSize(14).width(120)
            if (this.controllerIds.length === 0) {
              Text('（请先在创建页建立包过滤器）')
                .fontSize(13).fontColor($r('app.color.err_red'))
                .layoutWeight(1)
            } else {
              Select(this.controllerIds.map((i: number): SelectOption => ({ value: String(i) })))
                .selected(this.selectedIdIdx)
                .value(String(this.controllerIds[this.selectedIdIdx] ?? '-'))
                .onSelect((idx: number) => {
                  this.selectedIdIdx = idx;
                  this.refreshCount();
                })
                .layoutWeight(1)
            }
          }.width('100%')
          Row({ space: 8 }) {
            Text('当前规则数').fontSize(13).fontColor($r('app.color.text_secondary'))
            Text(String(this.ruleCount)).fontSize(13).fontColor($r('app.color.text_primary'))
            Blank()
            Button('刷新列表')
              .fontSize(12).height(28).padding({ left: 8, right: 8 })
              .onClick(() => this.refreshIds())
          }.width('100%')
        }
        .width('100%')
        .padding(12)
        .backgroundColor($r('app.color.card_bg'))
        .borderRadius(8)

        this.BasicBlock()

        IpMatchEditor({ form: this.form.srcIp, label: 'srcIp' })
        PortMatchEditor({ form: this.form.srcPort, label: 'srcPort' })
        IpMatchEditor({ form: this.form.dstIp, label: 'dstIp' })
        PortMatchEditor({ form: this.form.dstPort, label: 'dstPort' })

        InterfaceMatchEditor({ form: this.form.inInterface, label: 'inInterface' })
        InterfaceMatchEditor({ form: this.form.outInterface, label: 'outInterface' })

        this.UidProxyBlock()

        this.MacMatchBlock()

        this.TcpFlagsBlock()

        this.ConntrackBlock()

        Row({ space: 10 }) {
          Button('addRule')
            .type(ButtonType.Capsule)
            .backgroundColor($r('app.color.app_primary'))
            .layoutWeight(1)
            .onClick(() => this.addRule())
          Button('clearRule')
            .type(ButtonType.Capsule)
            .backgroundColor($r('app.color.err_red'))
            .layoutWeight(1)
            .onClick(() => this.clearRule())
        }.width('100%')

        Button('重置表单')
          .type(ButtonType.Capsule)
          .width('100%')
          .backgroundColor($r('app.color.divider'))
          .fontColor($r('app.color.text_primary'))
          .onClick(() => {
            this.form = new RuleFormModel();
            this.resultText = '表单已重置';
            this.resultOk = true;
          })

        if (this.resultText.length > 0) {
          Text(this.resultText)
            .fontSize(14)
            .fontColor(this.resultOk ? $r('app.color.ok_green') : $r('app.color.err_red'))
            .width('100%')
            .padding(10)
            .backgroundColor($r('app.color.card_bg'))
            .borderRadius(8)
        }
      }
      .width('100%')
      .padding(16)
      .alignItems(HorizontalAlign.Start)
    }
    .width('100%')
    .height('100%')
    .align(Alignment.Top)
    .scrollBar(BarState.Auto)
  }

  @Builder BasicBlock() {
    Column({ space: 8 }) {
      Text('RuleConfig 基本字段').fontSize(14).fontColor($r('app.color.text_secondary'))
      Row({ space: 8 }) {
        Text('priority').fontSize(13).width(90)
        TextInput({ text: String(this.form.priority) })
          .type(InputType.Number)
          .onChange((v: string) => { this.form.priority = parseInt(v || '0', 10); })
          .layoutWeight(1)
      }.width('100%')
      Row({ space: 8 }) {
        Text('hookPoint').fontSize(13).width(90)
        Select(HOOK_POINT_OPTIONS.map((o: SelectOptionItem<HookPoint>): SelectOption => ({ value: o.label })))
          .selected(this.form.hookPoint)
          .value(
            HOOK_POINT_OPTIONS.find(o => o.value === this.form.hookPoint)?.label ?? String(this.form.hookPoint)
          )
          .onSelect((idx: number) => { this.form.hookPoint = HOOK_POINT_OPTIONS[idx].value; })
          .layoutWeight(1)
      }.width('100%')
      Row({ space: 8 }) {
        Text('protocol').fontSize(13).width(90)
        Select(PROTOCOL_OPTIONS.map((o: SelectOptionItem<number>): SelectOption => ({ value: o.label })))
          .selected(PROTOCOL_OPTIONS.findIndex(o => o.value === this.form.protocol))
          .value(PROTOCOL_OPTIONS.find(o => o.value === this.form.protocol)?.label ?? String(this.form.protocol))
          .onSelect((idx: number) => { this.form.protocol = PROTOCOL_OPTIONS[idx].value; })
          .layoutWeight(1)
      }.width('100%')
    }
    .width('100%')
    .padding(10)
    .backgroundColor($r('app.color.card_bg'))
    .borderRadius(8)
  }

  @Builder MacMatchBlock() {
    Column({ space: 8 }) {
      Row({ space: 8 }) {
        Text('macMatch').fontSize(14).fontColor($r('app.color.text_secondary')).layoutWeight(1)
        Checkbox()
          .select(this.form.macMatch.enable)
          .onChange((v: boolean) => { this.form.macMatch.enable = v; })
        Text('enable').fontSize(13).fontColor($r('app.color.text_secondary'))
      }.width('100%')
      Row({ space: 8 }) {
        Text('invert').fontSize(13).width(90)
        Checkbox()
          .select(this.form.macMatch.invert)
          .enabled(this.form.macMatch.enable)
          .onChange((v: boolean) => { this.form.macMatch.invert = v; })
      }.width('100%')
      Row({ space: 8 }) {
        Text('srcMac').fontSize(13).width(90)
        TextInput({ text: this.form.macMatch.macText })
          .enabled(this.form.macMatch.enable)
          .onChange((v: string) => { this.form.macMatch.macText = v; })
          .layoutWeight(1)
      }.width('100%')
    }
    .width('100%')
    .padding(10)
    .backgroundColor($r('app.color.card_bg'))
    .borderRadius(8)
  }

  @Builder UidProxyBlock() {
    Column({ space: 8 }) {
      Text('uid / proxy').fontSize(14).fontColor($r('app.color.text_secondary'))
      Row({ space: 8 }) {
        Text('uidStart').fontSize(13).width(90)
        TextInput({ text: String(this.form.uidStart) })
          .type(InputType.Number)
          .onChange((v: string) => { this.form.uidStart = parseInt(v || '0', 10); })
          .layoutWeight(1)
      }.width('100%')
      Row({ space: 8 }) {
        Text('uidEnd').fontSize(13).width(90)
        TextInput({ text: String(this.form.uidEnd) })
          .type(InputType.Number)
          .onChange((v: string) => { this.form.uidEnd = parseInt(v || '0', 10); })
          .layoutWeight(1)
      }.width('100%')
    }
    .width('100%')
    .padding(10)
    .backgroundColor($r('app.color.card_bg'))
    .borderRadius(8)
  }

  @Builder TcpFlagsBlock() {
    Column({ space: 8 }) {
      Row({ space: 8 }) {
        Text('tcpFlagsMatch').fontSize(14).fontColor($r('app.color.text_secondary')).layoutWeight(1)
        Checkbox()
          .select(this.form.tcpFlagsMatch.enable)
          .onChange((v: boolean) => { this.form.tcpFlagsMatch.enable = v; })
        Text('enable').fontSize(13).fontColor($r('app.color.text_secondary'))
      }.width('100%')
      Row({ space: 8 }) {
        Text('flagMask').fontSize(13).width(90)
        Select(FLAG_MASK_OPTIONS.map((o: SelectOptionItem<number>): SelectOption => ({ value: o.label })))
          .selected(FLAG_MASK_OPTIONS.findIndex(o => o.value === this.form.tcpFlagsMatch.flagMask))
          .value(
            FLAG_MASK_OPTIONS.find(o => o.value === this.form.tcpFlagsMatch.flagMask)?.label ??
              String(this.form.tcpFlagsMatch.flagMask)
          )
          .enabled(this.form.tcpFlagsMatch.enable)
          .onSelect((idx: number) => { this.form.tcpFlagsMatch.flagMask = FLAG_MASK_OPTIONS[idx].value; })
          .layoutWeight(1)
      }.width('100%')
      Row({ space: 8 }) {
        Text('flagComp').fontSize(13).width(90)
        TextInput({ text: String(this.form.tcpFlagsMatch.flagComp) })
          .type(InputType.Number)
          .enabled(this.form.tcpFlagsMatch.enable)
          .onChange((v: string) => { this.form.tcpFlagsMatch.flagComp = parseInt(v || '0', 10); })
          .layoutWeight(1)
      }.width('100%')
    }
    .width('100%')
    .padding(10)
    .backgroundColor($r('app.color.card_bg'))
    .borderRadius(8)
  }

  @Builder ConntrackBlock() {
    Column({ space: 8 }) {
      Row({ space: 8 }) {
        Text('conntrackMatch').fontSize(14).fontColor($r('app.color.text_secondary')).layoutWeight(1)
        Checkbox()
          .select(this.form.conntrackMatch.enable)
          .onChange((v: boolean) => { this.form.conntrackMatch.enable = v; })
        Text('enable').fontSize(13).fontColor($r('app.color.text_secondary'))
      }.width('100%')
      Row({ space: 8 }) {
        Text('stateMask').fontSize(13).width(90)
        Select(STATE_MASK_OPTIONS.map((o: SelectOptionItem<number>): SelectOption => ({ value: o.label })))
          .selected(STATE_MASK_OPTIONS.findIndex(o => o.value === this.form.conntrackMatch.stateMask))
          .value(
            STATE_MASK_OPTIONS.find(o => o.value === this.form.conntrackMatch.stateMask)?.label ??
              String(this.form.conntrackMatch.stateMask)
          )
          .enabled(this.form.conntrackMatch.enable)
          .onSelect((idx: number) => { this.form.conntrackMatch.stateMask = STATE_MASK_OPTIONS[idx].value; })
          .layoutWeight(1)
      }.width('100%')
    }
    .width('100%')
    .padding(10)
    .backgroundColor($r('app.color.card_bg'))
    .borderRadius(8)
  }

  private currentId(): number {
    return this.controllerIds[this.selectedIdIdx] ?? -1;
  }

  private addRule(): void {
    const id = this.currentId();
    try {
      const rule = this.form.toRuleConfig();
      console.log(`addPacketRule data:${JSON.stringify(rule)}`)
      const ret = packetFilterApi.addPacketRule(id, rule);
      this.resultOk = ret === 0;
      this.resultText =this.resultOk? '✓ addRule ok': `x addRule fail:${ret}`;
    } catch (e) {
      this.resultOk = false;
      this.resultText = `✗ 异常: ${(e as Error).message}`;
    }
    this.refreshCount();
  }

  private clearRule(): void {
    const id = this.currentId();
    if (id < 0) {
      this.resultOk = false;
      this.resultText = '✗ 请先选择目标 Controller';
      return;
    }
    const ret = packetFilterApi.clearPacketRule(id);
    this.resultOk = ret === 0;
    this.resultText =this.resultOk? '✓ clearRule ok': `x clearRule fail:${ret}`;
    this.refreshCount();
  }

  private refreshIds(): void {
    if (this.selectedIdIdx >= this.controllerIds.length) {
      this.selectedIdIdx = 0;
    }
    this.refreshCount();
  }

  private refreshCount(): void {
    this.ruleCount = packetFilterApi.ruleCount(this.currentId());
  }
}

export default RulesPage;
