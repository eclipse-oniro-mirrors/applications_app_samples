import { IPFamily, IPMatchType } from '../types/packetFilter';
import { IPMatchForm, IP_MATCH_TYPE_OPTIONS, IP_FAMILY_OPTIONS, SelectOptionItem } from '../model/RuleFormModel';

@ComponentV2
export struct IpMatchEditor {
  @Param form: IPMatchForm = new IPMatchForm();
  @Param label: string = 'IPMatch';

  build() {
    Column({ space: 8 }) {

      Row({ space: 8 }) {
        Text(this.label)
          .fontSize(14)
          .fontColor($r('app.color.text_secondary'))
          .layoutWeight(1)
        Checkbox()
          .select(this.form.invert)
          .onChange((v: boolean) => { this.form.invert = v; })
        Text('invert')
          .fontSize(13)
          .fontColor($r('app.color.text_secondary'))
      }
      .width('100%')

      Select(IP_MATCH_TYPE_OPTIONS.map((o: SelectOptionItem<IPMatchType>): SelectOption => ({ value: o.label })))
        .selected(this.form.type)
        .value(this.typeLabel(this.form.type))
        .onSelect((idx: number) => {
          this.form.type = IP_MATCH_TYPE_OPTIONS[idx].value;
        })
        .width('100%')

      if (this.form.type === IPMatchType.IP_MATCH_SINGLE) {
        this.SingleBlock()
      } else if (this.form.type === IPMatchType.IP_MATCH_CIDR) {
        this.CidrBlock()
      } else if (this.form.type === IPMatchType.IP_MATCH_RANGE) {
        this.RangeBlock()
      } else if (this.form.type === IPMatchType.IP_MATCH_MULTI) {
        this.MultiBlock()
      }
    }
    .width('100%')
    .padding(10)
    .backgroundColor($r('app.color.card_bg'))
    .borderRadius(8)
  }

  @Builder SingleBlock() {
    Column({ space: 6 }) {
      Text('IPAddress').fontSize(12).fontColor($r('app.color.text_secondary'))
      Row({ space: 8 }) {
        Select(IP_FAMILY_OPTIONS.map((o: SelectOptionItem<IPFamily>): SelectOption => ({ value: o.label })))
          .selected(this.form.single.family)
          .value(this.familyLabel(this.form.single.family))
          .onSelect((idx: number) => { this.form.single.family = IP_FAMILY_OPTIONS[idx].value; })
          .width('35%')
        TextInput({ text: this.form.single.text })
          .onChange((v: string) => { this.form.single.text = v; })
          .layoutWeight(1)
      }.width('100%')
    }.width('100%')
  }

  @Builder CidrBlock() {
    Column({ space: 6 }) {
      Text('CIDR (base + prefixLen)').fontSize(12).fontColor($r('app.color.text_secondary'))
      Row({ space: 8 }) {
        Select(IP_FAMILY_OPTIONS.map((o: SelectOptionItem<IPFamily>): SelectOption => ({ value: o.label })))
          .selected(this.form.cidrBase.family)
          .value(this.familyLabel(this.form.cidrBase.family))
          .onSelect((idx: number) => { this.form.cidrBase.family = IP_FAMILY_OPTIONS[idx].value; })
          .width('30%')
        TextInput({ text: this.form.cidrBase.text })
          .onChange((v: string) => { this.form.cidrBase.text = v; })
          .layoutWeight(1)
      }.width('100%')
      Row({ space: 8 }) {
        Text('prefixLen').fontSize(13).width(90)
        TextInput({ text: String(this.form.cidrPrefix) })
          .type(InputType.Number)
          .onChange((v: string) => { this.form.cidrPrefix = parseInt(v || '0', 10); })
          .layoutWeight(1)
      }.width('100%')
    }.width('100%')
  }

  @Builder RangeBlock() {
    Column({ space: 6 }) {
      Text('Range (start - end)').fontSize(12).fontColor($r('app.color.text_secondary'))
      Text('start').fontSize(12).fontColor($r('app.color.text_secondary'))
      Row({ space: 8 }) {
        Select(IP_FAMILY_OPTIONS.map((o: SelectOptionItem<IPFamily>): SelectOption => ({ value: o.label })))
          .selected(this.form.rangeStart.family)
          .value(this.familyLabel(this.form.rangeStart.family))
          .onSelect((idx: number) => { this.form.rangeStart.family = IP_FAMILY_OPTIONS[idx].value; })
          .width('30%')
        TextInput({ text: this.form.rangeStart.text })
          .onChange((v: string) => { this.form.rangeStart.text = v; })
          .layoutWeight(1)
      }.width('100%')
      Text('end').fontSize(12).fontColor($r('app.color.text_secondary'))
      Row({ space: 8 }) {
        Select(IP_FAMILY_OPTIONS.map((o: SelectOptionItem<IPFamily>): SelectOption => ({ value: o.label })))
          .selected(this.form.rangeEnd.family)
          .value(this.familyLabel(this.form.rangeEnd.family))
          .onSelect((idx: number) => { this.form.rangeEnd.family = IP_FAMILY_OPTIONS[idx].value; })
          .width('30%')
        TextInput({ text: this.form.rangeEnd.text })
          .onChange((v: string) => { this.form.rangeEnd.text = v; })
          .layoutWeight(1)
      }.width('100%')
    }.width('100%')
  }

  @Builder MultiBlock() {
    Column({ space: 6 }) {
      Text('Multi (每行一�?IP)').fontSize(12).fontColor($r('app.color.text_secondary'))
      TextArea({ text: this.form.multiText })
        .onChange((v: string) => { this.form.multiText = v; })
        .height(70)
        .width('100%')
    }.width('100%')
  }

  private typeLabel(t: IPMatchType): string {
    return IP_MATCH_TYPE_OPTIONS.find(o => o.value === t)?.label ?? String(t);
  }

  private familyLabel(f: number): string {
    return IP_FAMILY_OPTIONS.find(o => o.value === f)?.label ?? String(f);
  }
}
