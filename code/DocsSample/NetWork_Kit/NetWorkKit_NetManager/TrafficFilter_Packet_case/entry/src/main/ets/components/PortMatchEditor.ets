import { PortMatchType } from '../types/packetFilter';
import { PortMatchForm, PORT_MATCH_TYPE_OPTIONS, SelectOptionItem } from '../model/RuleFormModel';

@ComponentV2
export struct PortMatchEditor {
  @Param form: PortMatchForm = new PortMatchForm();
  @Param label: string = 'PortMatch';

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

      Select(PORT_MATCH_TYPE_OPTIONS.map((o: SelectOptionItem<PortMatchType>): SelectOption => ({ value: o.label })))
        .selected(this.form.type)
        .value(this.typeLabel(this.form.type))
        .onSelect((idx: number) => {
          this.form.type = PORT_MATCH_TYPE_OPTIONS[idx].value;
          console.log(this.form.type.toString())
        })
        .width('100%')

      if (this.form.type === PortMatchType.PORT_MATCH_SINGLE) {
        this.SingleBlock()
      } else if (this.form.type === PortMatchType.PORT_MATCH_RANGE) {
        this.RangeBlock()
      } else if (this.form.type === PortMatchType.PORT_MATCH_MULTI) {
        this.MultiBlock()
      }
    }
    .width('100%')
    .padding(10)
    .backgroundColor($r('app.color.card_bg'))
    .borderRadius(8)
  }

  @Builder SingleBlock() {
    Row({ space: 8 }) {
      Text('port').fontSize(13).width(90)
      TextInput({ text: String(this.form.single) })
        .type(InputType.Number)
        .onChange((v: string) => { this.form.single = parseInt(v || '0', 10); })
        .layoutWeight(1)
    }.width('100%')
  }

  @Builder RangeBlock() {
    Column({ space: 6 }) {
      Row({ space: 8 }) {
        Text('startPort').fontSize(13).width(90)
        TextInput({ text: String(this.form.rangeStart) })
          .type(InputType.Number)
          .onChange((v: string) => { this.form.rangeStart = parseInt(v || '0', 10); })
          .layoutWeight(1)
      }.width('100%')
      Row({ space: 8 }) {
        Text('endPort').fontSize(13).width(90)
        TextInput({ text: String(this.form.rangeEnd) })
          .type(InputType.Number)
          .onChange((v: string) => { this.form.rangeEnd = parseInt(v || '0', 10); })
          .layoutWeight(1)
      }.width('100%')
    }.width('100%')
  }

  @Builder MultiBlock() {
    Column({ space: 6 }) {
      Text('ports (逗号分隔)').fontSize(12).fontColor($r('app.color.text_secondary'))
      TextArea({ text: this.form.multiText })
        .onChange((v: string) => { this.form.multiText = v; })
        .height(60)
        .width('100%')
    }.width('100%')
  }

  private typeLabel(t: PortMatchType): string {
    return PORT_MATCH_TYPE_OPTIONS.find(o => o.value === t)?.label ?? String(t);
  }
}
