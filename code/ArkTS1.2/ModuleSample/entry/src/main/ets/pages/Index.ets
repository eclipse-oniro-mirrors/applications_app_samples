import { memo, __memo_context_type, __memo_id_type } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import { Text, TextAttribute, Column, Component, Button, ButtonAttribute, ClickEvent, UserView } from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { State, StateDecoratedVariable, MutableState, stateOf, observableProxy } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import hilog from '@ohos.hilog'
import { Mod1 } from './mod/mod1'
import { Mod2 } from './mod/mod2';
import { A, E } from './mod/mod3';
import { ExportSmallClassTest } from './mod/mod4'
import { ExportSmallClass } from './mod/mod5'
import { Har } from 'importhar'


@Component
struct MyStateSample {
  aboutToAppear() {
    hilog.info(0x0000, 'testTag', 'executeModule modTest start');
    let mod1 = new Mod1;
    let mod2 = new Mod2;
    let modA = new A();
    let modE = new E();
    hilog.info(0x0000, 'testTag', 'executeModule E.count:' + E.count);
    let mod5 = new ExportSmallClass();
    hilog.info(0x0000, 'testTag', 'executeModule ExportSmallClass.isExportOtherClass:' + ExportSmallClass.isExportOtherClass);
    let har: Har = new Har();
  }
  @State stateVar: string = 'state var';
  message: string = 'var';
  build() {
    Column(undefined) {
      Button(this.message).backgroundColor('#FFFF00FF')
        .onClick((e: ClickEvent) => {
          hilog.info(0x0000, 'testTag', 'On Click');
        })
      Text(this.stateVar).fontSize(20)
    }
  }
}

export class ComExampleTrivialApplication extends UserView {
  getBuilder() {
    hilog.info(0x0000, 'testTag', 'getBuilder');
    let wrapper = @memo () => {
      hilog.info(0x0000, 'testTag', 'MyStateSample');
      MyStateSample(undefined)
    }
    return wrapper
  }
}