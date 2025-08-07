/**
 *
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 *
 * All rights reserved.
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice,this
 * list of conditions and the following disclaimer.
 *
 * Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 *
 * THIS IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 'AS IS' AND ANY EXPRESS OR IMPLIED WARRANTIES,
 * INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS,
 *
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
import {
  __memo_context_type,
  __memo_id_type,
  memo,
  MutableState,
  observableProxy,
  State,
  StateDecoratedVariable,
  stateOf
} from '@ohos.arkui.stateManagement';
import {
  Button,
  ButtonAttribute,
  ClickEvent,
  Column,
  Component,
  Entry,
  FlexAlign,
  List,
  Margin,
  Text,
  TextAttribute
} from '@ohos.arkui.component';
import hilog from '@ohos.hilog';

export class Want {
  public value: int;

  public constructor(v: int) {
    this.value = v;
  }
}

interface Person {
  name: string;
  age: int;
}

let intNum: int = 15;
let floatNum: float = Double.toFloat(10.02);
let doubleNum: double = 12.333;
let shortNum: short = 199;
let longNum: long = 12345678910;
let charNum: char = 65;
let byteNum: byte = 0x3;

class Calc implements Person {
  name: string = '';
  age: int = 2;
  thisIsField: int = 3;
  _thisIsProperty: int = 10;

  native static createPerson(): Calc;

  native thisIsPropertyGetter(): int;

  native thisIsPropertySetter(i: int): void;

  get thisIsProperty(): int {
    return this.thisIsPropertyGetter();
  }

  set thisIsProperty(i: int) {
    this.thisIsPropertySetter(i);
    return;
  }

  native UpdateFields(): void;

  native UpdateFields2(): void;

  native execute(want: Want): int;

  native gettid(): int;

  promiseNum: int = 10;

  startAbility(want: Want): Promise<int> {
    hilog.info(0x0000, 'testTag', 'Start Ability in thread ' + this.gettid() + '.');
    let p = new Promise<int>((resolve: (v: int) => void, reject: (error: Error) => void) => {
      let cb = (): Int => {
        this.execute(want);
        return this.promiseNum;
      }
      let p1 = taskpool.execute(cb);
      p1.then((e: NullishType) => {
        hilog.info(0x0000, 'testTag', 'P1 then in thread ' + this.gettid() + '.');
        hilog.info(0x0000, 'testTag', 'P1 then e = ' + e + '.');
        let r: Int = e as Int;
        resolve(r.unboxed());
      });
      hilog.info(0x0000, 'testTag', 'Promise execute in thread ' + this.gettid() + '.');
    });
    return p;
  }

  byteField: byte;
  charField: char;
  boolField: boolean;
  floatField: float;
  doubleField: double;
  shortField: short;
  intField: int;
  longField: long;

  native UpdateStaticFields(): void;

  native UpdateStaticFields2(): void;

  native GetStaticFields(): boolean;

  native GetStaticFields2(): boolean;

  static intStaticField: int;
  static shortStaticField: short;
  static longStaticField: long;
  static charStaticField: char;
  static doubleStaticField: double;
  static floatStaticField: float;
  static boolStaticField: boolean;
  static byteStaticField: byte;
  fieldByName_Byte: byte;
  fieldByName_Double: double;
  fieldByName_Short: short;
  fieldByName_Float: float;
  fieldByName_Int: int;
  fieldByName_Long: long;
  fieldByName_Char: char;
  fieldByName_Bool: boolean;

  native UpdateByNameFields(): void;

  native UpdateByNameFields2(): void;

  native GetVersionInfo(): int;

  native NativeVoidFunc(): void;

  ManagedVoidFunc(): void {
  }

  native NativeIntFunc(): int;

  ManagedIntFunc(): int {
    return ++intNum;
  }

  native NativeBoolFunc(): boolean;

  ManagedBoolFunc(): boolean {
    return true;
  }

  native NativeShortFunc(): short;

  ManagedShortFunc(): short {
    return ++shortNum;
  }

  native NativeLongFunc(): long;

  ManagedLongFunc(): long {
    return ++longNum;
  }

  native NativeDoubleFunc(): double;

  ManagedDoubleFunc(): double {
    return ++doubleNum;
  }

  native NativeCharFunc(): char;

  ManagedCharFunc(): char {
    return ++charNum;
  }

  native NativeFloatFunc(): float;

  ManagedFloatFunc(): float {
    return ++floatNum;
  }

  native NativeByteFunc(): byte;

  ManagedByteFunc(): byte {
    return ++byteNum;
  }

  native NativeStaticFunc(): void;

  static ManagedStaticFunc(): void {
  }

  native NativeStaticFuncDouble(): double;

  static ManagedStaticFuncDouble(): double {
    return ++doubleNum;
  }

  native NativeStaticFuncFloat(): float;

  static ManagedStaticFuncFloat(): float {
    return ++floatNum;
  }

  native NativeStaticFuncByte(): byte;

  static ManagedStaticFuncByte(): byte {
    return ++byteNum;
  }

  native NativeStaticFuncChar(): char;

  static ManagedStaticFuncChar(): char {
    return ++charNum;
  }

  native NativeStaticFuncBoolean(): boolean;

  static ManagedStaticFuncBoolean(): boolean {
    return true;
  }

  native NativeStaticFuncInt(): int;

  static ManagedStaticFuncInt(): int {
    return ++intNum;
  }

  native NativeStaticFuncShort(): short;

  static ManagedStaticFuncShort(): short {
    return ++shortNum;
  }

  native NativeStaticFuncLong(): long;

  static ManagedStaticFuncLong(): long {
    return ++longNum;
  }

  native NativeByNameFunc(): void;

  ManagedByNameVoidFunc(): void {
  }

  native NativeByNameDoubleFunc(): double;

  ManagedByNameDoubleFunc(): double {
    return ++doubleNum;
  }

  native NativeByNameBoolFunc(): boolean;

  ManagedByNameBoolFunc(): boolean {
    return true;
  }

  native NativeByNameIntFunc(): int;

  ManagedByNameIntFunc(): int {
    return ++intNum;
  }

  native NativeByNameShortFunc(): short;

  ManagedByNameShortFunc(): short {
    return ++shortNum;
  }

  native NativeByNameLongFunc(): long;

  ManagedByNameLongFunc(): long {
    return ++longNum;
  }

  native NativeByNameCharFunc(): char;

  ManagedByNameCharFunc(): char {
    return ++charNum;
  }

  native NativeByNameFloatFunc(): float;

  ManagedByNameFloatFunc(): float {
    return ++floatNum;
  }

  native NativeByNameByteFunc(): byte;

  ManagedByNameByteFunc(): byte {
    return ++byteNum;
  }

  native Global_Local_References(): boolean;

  native Weak_Global_References(): boolean;

  native VMInterface(): boolean;

  native String_Operations(): string;

  native HandleDoubleData(val1: double): double;

  native ProcessArray(a: double[]): boolean;

  native ProcessArray2(a: double[]): boolean;

  native ThrowError(error: Error): boolean;
}

class CustomError extends Error {
  constructor(message: string) {
    super(message);
    this.name = 'CustomError'; // 设置错误名称
  }
}

@Entry
@Component
struct MyStateSample {
  @State stateVar: string = 'state var';
  message: string = 'var';

  changeValue(): void {
    this.stateVar += '~'
  }

  @State versionInfo: int = 0;
  @State globalLocalReferences: boolean = false;
  @State weakGlobalReferences: boolean = false;
  @State vmInterface: boolean = false;
  @State stringOperation: string = '';
  @State stringExceptions: string = '';
  @State processArray: boolean = false;
  @State processArray2: boolean = false;
  @State objectOperation: double = 0;
  @State intStaticField: int = 0;
  @State shortStaticField: short = 0;
  @State longStaticField: long = 0;
  @State charStaticField: char = 0x0;
  @State doubleStaticField: double = 0.0;
  @State floatStaticField: float = Double.toFloat(0.0);
  @State boolStaticField: boolean = false;
  @State byteStaticField: byte = 0x0;
  @State byteField: byte = 0x0;
  @State charField: char = 0x0;
  @State boolField: boolean = false;
  @State floatField: float = Double.toFloat(0.0);
  @State doubleField: double = 0.0;
  @State shortField: short = 0;
  @State intField: int = 0;
  @State longField: long = 0;
  @State fieldByName_Byte: byte = 0x0;
  @State fieldByName_Double: double = 0.0;
  @State fieldByName_Short: short = 0;
  @State fieldByName_Float: float = Double.toFloat(0.0);
  @State fieldByName_Int: int = 0;
  @State fieldByName_Long: long = 0;
  @State fieldByName_Char: char = 0x0;
  @State fieldByName_Bool: boolean = false;
  @State getStaticFields: boolean = false;
  @State getStaticFields2: boolean = false;
  @State callingsByteValue: byte = 0x0;
  @State callingsDoubleValue: double = 0.0;
  @State callingsShortValue: short = 0;
  @State callingsFloatValue: float = Double.toFloat(0.0);
  @State callingsIntValue: int = 0;
  @State callingsLongValue: long = 0;
  @State callingsCharValue: char = 0x0;
  @State callingsBoolValue: boolean = false;
  @State callingsStaticByteValue: byte = 0x0;
  @State callingsStaticDoubleValue: double = 0.0;
  @State callingsStaticShortValue: short = 0;
  @State callingsStaticFloatValue: float = Double.toFloat(0.0);
  @State callingsStaticIntValue: int = 0;
  @State callingsStaticLongValue: long = 0;
  @State callingsStaticCharValue: char = 0x0;
  @State callingsStaticBoolValue: boolean = false;
  @State classByteValue: byte = 0x0;
  @State classDoubleValue: double = 0.0;
  @State classShortValue: short = 0;
  @State classFloatValue: float = Double.toFloat(0.0);
  @State classIntValue: int = 0;
  @State classLongValue: long = 0;
  @State classCharValue: char = 0x0;
  @State classBoolValue: boolean = false;
  @State reflectionAge: int = 0;
  @State reflectionIsField: int = 0;
  @State reflectionIsProperty: int = 0;
  @State reflectionName: string = '';
  @State loadFlag: boolean = false;
  @State promiseFlag: boolean = false;

  build() {
    Column(undefined) {
      List() {
        Button('load AniTest').onClick((e: ClickEvent) => {
          try {
            loadLibrary('aniTest');
            this.loadFlag = true;
          } catch (e: Error) {
            hilog.error(0x0000, 'testTag', e.message)
            this.loadFlag = false;
          }
        }).width('80%')
        Text('load AniTest : ' + (this.loadFlag ? 'success' : 'fail'))
          .fontSize(18)
          .margin({ top: 10, bottom: 10 } as Margin)
        Button('Version Info').backgroundColor('#ff00e1ff').width('80%')
          .onClick((e: ClickEvent) => {
            if (!this.loadFlag) {
              return;
            }
            const cls = new Calc();
            this.versionInfo = cls.GetVersionInfo();
          })
        Text('Version Info: ' + this.versionInfo).fontSize(18).margin({ bottom: 10 } as Margin)
        Button('Global and Local References').backgroundColor('#ff00e1ff').width('80%')
          .onClick((e: ClickEvent) => {
            if (!this.loadFlag) {
              return;
            }
            const cls = new Calc();
            this.globalLocalReferences = cls.Global_Local_References();
          })
        Text('Global and Local References create : ' + this.globalLocalReferences)
          .fontSize(18)
          .margin({ bottom: 10 } as Margin)
        Button('Weak Global References').backgroundColor('#ff00e1ff').width('80%')
          .onClick((e: ClickEvent) => {
            if (!this.loadFlag) {
              return;
            }
            const cls = new Calc();
            this.weakGlobalReferences = cls.Weak_Global_References();
          })
        Text('Weak Global References create : ' + this.weakGlobalReferences)
          .fontSize(18)
          .margin({ bottom: 10 } as Margin)
        Button('String Operations').backgroundColor('#ff00e1ff').width('80%')
          .onClick((e: ClickEvent) => {
            if (!this.loadFlag) {
              return;
            }
            const cls = new Calc();
            this.stringOperation = cls.String_Operations();
          })
        Text('String Operations : ' + this.stringOperation).fontSize(18).margin({ bottom: 10 } as Margin)
        Button('Promise ').backgroundColor('#ff00e1ff').width('80%')
          .onClick((e: ClickEvent) => {
            if (!this.loadFlag) {
              return;
            }
            const cls = new Calc();
            let want = new Want(42);
            let p = cls.startAbility(want);
            p.then<void, void>((value: int): void => {
              if (value != 10) {
                hilog.info(0x0000, 'testTag',
                  'Test failed. The promise shoule be fulfilled by 10 but got ' + value + '.');
                this.promiseFlag = false;
                return;
              }
              this.promiseFlag = true;
              hilog.info(0x0000, 'testTag', 'Test passed.');
            }, (err: Object): void => {
              hilog.info(0x0000, 'testTag', 'Test failed. The promise shouldn`t be rejected.');
            });
          })
        Text('Promise : ' + (this.promiseFlag ? 'Test passed.' : 'Test failed. The promise shouldn`t be rejected.'))
          .fontSize(18).margin({ bottom: 10 } as Margin)
        Button('Array Operations : ').backgroundColor('#ff00e1ff').width('80%')
          .onClick((e: ClickEvent) => {
            if (!this.loadFlag) {
              return;
            }
            const cls = new Calc();
            let s: double[] = [5, 15, 18];
            this.processArray = cls.ProcessArray(s);
            let s2: double[] = [5, 15, 20, 25, 30];
            this.processArray2 = cls.ProcessArray2(s2);
          })
        Text('Array_New_XX create: ' + this.processArray).fontSize(18)
        Text('Array_New_XX create2: ' + this.processArray2).fontSize(18).margin({ bottom: 10 } as Margin)
        Button('Object Operations : ').backgroundColor('#ff00e1ff').width('80%')
          .onClick((e: ClickEvent) => {
            if (!this.loadFlag) {
              return;
            }
            const cls = new Calc();
            this.objectOperation = cls.HandleDoubleData(15);
          })
        Text('Object_Operations double value: ' + this.objectOperation).fontSize(18).margin({ bottom: 10 } as Margin)
        Button('VM_Interface : ').backgroundColor('#ff00e1ff').width('80%')
          .onClick((e: ClickEvent) => {
            if (!this.loadFlag) {
              return;
            }
            const cls = new Calc();
            this.vmInterface = cls.VMInterface();
          })
        Text('VM_Interface GetVm : ' + this.vmInterface).fontSize(18).margin({ bottom: 10 } as Margin)
        Button('Reflection : ').backgroundColor('#ff00e1ff').width('80%')
          .onClick((e: ClickEvent) => {
            if (!this.loadFlag) {
              return;
            }
            let cls = Calc.createPerson();
            this.reflectionAge = cls.age;
            this.reflectionIsField = cls.thisIsField;
            this.reflectionName = cls.name;
            cls.thisIsProperty = 1234567;
            this.reflectionIsProperty = cls.thisIsProperty;
          })
        Text('Reflection age: ' + this.reflectionAge).fontSize(18)
        Text('Reflection name: ' + this.reflectionName).fontSize(18)
        Text('Reflection Field: ' + this.reflectionIsField).fontSize(18)
        Text('Reflection Property: ' + this.reflectionIsProperty).fontSize(18).margin({ bottom: 10 } as Margin)
        Button('Exceptions : ').backgroundColor('#ff00e1ff').width('80%')
          .onClick((e: ClickEvent) => {
            if (!this.loadFlag) {
              return;
            }
            try {
              const cls = new Calc();
              const standardError = new CustomError('A standard error message');
              let rs = cls.ThrowError(standardError);
            } catch (e: Error) {
              hilog.info(0x0000, 'testTag', JSON.stringify(e.message));
              this.stringExceptions = JSON.stringify(e.message);
            }
          })
        Text('Exceptions message : ' + this.stringExceptions).fontSize(18).margin({ bottom: 10 } as Margin)
        Button('Accessing Static Fields : ').backgroundColor('#ff00e1ff').width('80%')
          .onClick((e: ClickEvent) => {
            if (!this.loadFlag) {
              return;
            }
            const cls = new Calc();
            cls.UpdateStaticFields();
            cls.UpdateStaticFields2();
            this.intStaticField = Calc.intStaticField;
            this.shortStaticField = Calc.shortStaticField;
            this.longStaticField = Calc.longStaticField;
            this.charStaticField = Calc.charStaticField;
            this.doubleStaticField = Calc.doubleStaticField;
            this.floatStaticField = Calc.floatStaticField;
            this.boolStaticField = Calc.boolStaticField;
            this.byteStaticField = Calc.byteStaticField;
            this.getStaticFields = cls.GetStaticFields();
            this.getStaticFields2 = cls.GetStaticFields2();
          })
        Text('Static intStaticField : ' + this.intStaticField).fontSize(18)
        Text('Static shortStaticField : ' + this.shortStaticField).fontSize(18)
        Text('Static longStaticField : ' + this.longStaticField).fontSize(18)
        Text('Static charStaticField : ' + this.charStaticField).fontSize(18)
        Text('Static doubleStaticField : ' + this.doubleStaticField).fontSize(18)
        Text('Static floatStaticField : ' + this.floatStaticField).fontSize(18)
        Text('Static boolStaticField : ' + this.boolStaticField).fontSize(18)
        Text('Static byteStaticField : ' + this.byteStaticField).fontSize(18)
        Text('GetStaticFields : ' + this.getStaticFields).fontSize(18)
        Text('GetStaticFields2 : ' + this.getStaticFields2).fontSize(18).margin({ bottom: 10 } as Margin)
        Button('Accessing Fields Of Objects: ').backgroundColor('#ff00e1ff').width('80%')
          .onClick((e: ClickEvent) => {
            if (!this.loadFlag) {
              return;
            }
            const cls = new Calc();
            cls.UpdateFields();
            cls.UpdateFields2();
            this.byteField = cls.byteField;
            this.charField = cls.charField;
            this.doubleField = cls.doubleField;
            this.boolField = cls.boolField;
            this.floatField = cls.floatField;
            this.shortField = cls.shortField;
            this.intField = cls.intField;
            this.longField = cls.longField;
            cls.UpdateByNameFields();
            cls.UpdateByNameFields2();
            this.fieldByName_Byte = cls.fieldByName_Byte;
            this.fieldByName_Double = cls.fieldByName_Double;
            this.fieldByName_Short = cls.fieldByName_Short;
            this.fieldByName_Float = cls.fieldByName_Float;
            this.fieldByName_Int = cls.fieldByName_Int;
            this.fieldByName_Long = cls.fieldByName_Long;
            this.fieldByName_Char = cls.fieldByName_Char;
            this.fieldByName_Bool = cls.fieldByName_Bool;
          })
        Text('Fields byteField: ' + this.byteField).fontSize(18)
        Text('Fields charField: ' + this.charField).fontSize(18)
        Text('Fields doubleField: ' + this.doubleField).fontSize(18)
        Text('Fields boolField: ' + this.boolField).fontSize(18)
        Text('Fields floatField: ' + this.floatField).fontSize(18)
        Text('Fields shortField: ' + this.shortField).fontSize(18)
        Text('Fields intField: ' + this.intField).fontSize(18)
        Text('Fields longField: ' + this.longField).fontSize(18)
        Text('Fields fieldByName_Byte: ' + this.fieldByName_Byte).fontSize(18)
        Text('Fields fieldByName_Double: ' + this.fieldByName_Double).fontSize(18)
        Text('Fields fieldByName_Short: ' + this.fieldByName_Short).fontSize(18)
        Text('Fields fieldByName_Float: ' + this.fieldByName_Float).fontSize(18)
        Text('Fields fieldByName_Int: ' + this.fieldByName_Int).fontSize(18)
        Text('Fields fieldByName_Long: ' + this.fieldByName_Long).fontSize(18)
        Text('Fields fieldByName_Char: ' + this.fieldByName_Char).fontSize(18)
        Text('Fields fieldByName_Bool: ' + this.fieldByName_Bool).fontSize(18).margin({ bottom: 10 } as Margin)
        Button('Class Operations : ').backgroundColor('#ff00e1ff').width('80%')
          .onClick((e: ClickEvent) => {
            if (!this.loadFlag) {
              return;
            }
            const cls = new Calc();
            this.classByteValue = cls.NativeByteFunc();
            this.classFloatValue = cls.NativeFloatFunc();
            this.classDoubleValue = cls.NativeDoubleFunc();
            this.classCharValue = cls.NativeCharFunc();
            this.classIntValue = cls.NativeIntFunc();
            this.classShortValue = cls.NativeShortFunc();
            this.classLongValue = cls.NativeLongFunc();
            this.classBoolValue = cls.NativeBoolFunc();
          })
        Text('classByteValue : ' + this.classByteValue).fontSize(18)
        Text('classFloatValue : ' + this.classFloatValue).fontSize(18)
        Text('classDoubleValue : ' + this.classDoubleValue).fontSize(18)
        Text('classCharValue : ' + this.classCharValue).fontSize(18)
        Text('classIntValue : ' + this.classIntValue).fontSize(18)
        Text('classShortValue : ' + this.classShortValue).fontSize(18)
        Text('classLongValue : ' + this.classLongValue).fontSize(18)
        Text('classBoolValue : ' + this.classBoolValue).fontSize(18).margin({ bottom: 10 } as Margin)
        Button('Calling Instance Methods : ').backgroundColor('#ff00e1ff').width('80%')
          .onClick((e: ClickEvent) => {
            if (!this.loadFlag) {
              return;
            }
            const cls = new Calc();
            cls.NativeByNameFunc();
            this.callingsByteValue = cls.NativeByNameByteFunc();
            this.callingsDoubleValue = cls.NativeByNameDoubleFunc();
            this.callingsShortValue = cls.NativeByNameShortFunc();
            this.callingsFloatValue = cls.NativeByNameFloatFunc();
            this.callingsIntValue = cls.NativeByNameIntFunc();
            this.callingsLongValue = cls.NativeByNameLongFunc();
            this.callingsCharValue = cls.NativeByNameCharFunc();
            this.callingsBoolValue = cls.NativeByNameBoolFunc();
          })
        Text('callingsByteValue : ' + this.callingsByteValue).fontSize(18)
        Text('callingsDoubleValue : ' + this.callingsDoubleValue).fontSize(18)
        Text('callingsShortValue : ' + this.callingsShortValue).fontSize(18)
        Text('callingsFloatValue : ' + this.callingsFloatValue).fontSize(18)
        Text('callingsIntValue : ' + this.callingsIntValue).fontSize(18)
        Text('callingsLongValue : ' + this.callingsLongValue).fontSize(18)
        Text('callingsCharValue : ' + this.callingsCharValue).fontSize(18)
        Text('callingsBoolValue : ' + this.callingsBoolValue).fontSize(18).margin({ bottom: 10 } as Margin)
        Button('Calling Static Methods : ').backgroundColor('#ff00e1ff').width('80%')
          .onClick((e: ClickEvent) => {
            if (!this.loadFlag) {
              return;
            }
            const cls = new Calc();
            this.callingsStaticDoubleValue = cls.NativeStaticFuncDouble();
            this.callingsStaticFloatValue = cls.NativeStaticFuncFloat();
            this.callingsStaticByteValue = cls.NativeStaticFuncByte();
            this.callingsStaticCharValue = cls.NativeStaticFuncChar();
            this.callingsStaticBoolValue = cls.NativeStaticFuncBoolean();
            this.callingsStaticIntValue = cls.NativeStaticFuncInt();
            this.callingsStaticShortValue = cls.NativeStaticFuncShort();
            this.callingsStaticLongValue = cls.NativeStaticFuncLong();
          })
        Text('callingsStaticDoubleValue : ' + this.callingsStaticDoubleValue).fontSize(18)
        Text('callingsStaticFloatValue : ' + this.callingsStaticFloatValue).fontSize(18)
        Text('callingsStaticByteValue : ' + this.callingsStaticByteValue).fontSize(18)
        Text('callingsStaticCharValue : ' + this.callingsStaticCharValue).fontSize(18)
        Text('callingsStaticBoolValue : ' + this.callingsStaticBoolValue).fontSize(18)
        Text('callingsStaticIntValue : ' + this.callingsStaticIntValue).fontSize(18)
        Text('callingsStaticShortValue : ' + this.callingsStaticShortValue).fontSize(18)
        Text('callingsStaticLongValue : ' + this.callingsStaticLongValue).fontSize(18).margin({ bottom: 10 } as Margin)
      }.margin({ left: '20%' } as Margin)
    }.width('100%')
  }
}