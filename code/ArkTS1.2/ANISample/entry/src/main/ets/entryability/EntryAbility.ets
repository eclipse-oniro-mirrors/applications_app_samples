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
import UIAbility from '@ohos.app.ability.UIAbility';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import hilog from '@ohos.hilog'

class Calc {
  native UpdateFields(): void;

  native UpdateFields2(): void;

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

  static intStaticField: int;
  static shortStaticField: short;
  static longStaticField: long;
  static charStaticField: char;
  static doubleStaticField: double;
  static floatStaticField: float;
  static boolStaticField: boolean;
  static byteStaticField: byte;

  constructor(a: int, b: double, c: boolean, f: long) {
    this.getIntField = a;
    this.getDoubleField = b;
    this.getBoolField = c;
    this.getLongField = f;
  }

  getDoubleField: double;
  getIntField: int;
  getBoolField: boolean;
  getShortField: short = 15;
  getLongField: long;
  getCharField: char = 'D';
  getFloatField: float = 10.23;
  getByteField: byte = 0x1;

  native UpdateIntFields(): int;

  native UpdateDoubleFields(): double;

  native UpdateBoolFields(): boolean;

  native UpdateShortFields(): short;

  native UpdateLongFields(): long;

  native UpdateCharFields(): char;

  native UpdateFloatFields(): float;

  native UpdateByteFields(): byte;
  
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
    hilog.error(0x0000, 'testTag', "Print in ManagedVoidFunc");
  }

  native NativeIntFunc(): int;

  ManagedIntFunc(): int {
    hilog.error(0x0000, 'testTag', "Print in ManagedIntFunc");
    return 10;
  }

  native NativeBoolFunc(): boolean;

  ManagedBoolFunc(): boolean {
    hilog.error(0x0000, 'testTag', "Print in ManagedBoolFunc");
    return true;
  }

  native NativeShortFunc(): short;

  ManagedShortFunc(): short {
    hilog.error(0x0000, 'testTag', "Print in ManagedShortFunc");
    return 22;
  }

  native NativeLongFunc(): long;

  ManagedLongFunc(): long {
    hilog.error(0x0000, 'testTag', "Print in ManagedLongFunc");
    return 12365478965;
  }

  native NativeDoubleFunc(): double;

  ManagedDoubleFunc(): double {
    hilog.error(0x0000, 'testTag', "Print in ManagedDoubleFunc");
    return 12.35;
  }

  native NativeCharFunc(): char;

  ManagedCharFunc(): char {
    hilog.error(0x0000, 'testTag', "Print in ManagedCharFunc");
    return 'I';
  }
  
  native NativeFloatFunc(): float;

  ManagedFloatFunc(): float {
    hilog.error(0x0000, 'testTag', "Print in ManagedFloatFunc");
    return 45.32;
  }

  native NativeByteFunc(): byte;

  ManagedByteFunc(): byte {
    hilog.error(0x0000, 'testTag', "Print in ManagedByteFunc");
    return 0x1;
  }

  native NativeStaticFunc(): void;

  static ManagedStaticFunc(): void {
    hilog.error(0x0000, 'testTag', "Print in ManagedStaticFunc");
  }

  native NativeByNameFunc(): void;

  ManagedByNameVoidFunc(): void {
    hilog.error(0x0000, 'testTag', "Print in ManagedByNameVoidFunc");
  }

  native NativeByNameDoubleFunc(): double;

  ManagedByNameDoubleFunc(): double {
    hilog.error(0x0000, 'testTag', "Print in ManagedByNameDoubleFunc");
    return 3.33;
  }

  native NativeByNameBoolFunc(): boolean;

  ManagedByNameBoolFunc(): boolean {
    hilog.error(0x0000, 'testTag', "Print in ManagedByNameBoolFunc");
    return true;
  }

  native NativeByNameIntFunc(): int;

  ManagedByNameIntFunc(): int {
    hilog.error(0x0000, 'testTag', "Print in ManagedByNameIntFunc");
    return 10;
  }

  native NativeByNameShortFunc(): short;

  ManagedByNameShortFunc(): short {
    hilog.error(0x0000, 'testTag', "Print in ManagedByNameShortFunc");
    return 1456;
  }

  native NativeByNameLongFunc(): long;

  ManagedByNameLongFunc(): long {
    hilog.error(0x0000, 'testTag', "Print in ManagedByNameLongFunc");
    return 12345679852;
  }

  native NativeByNameCharFunc(): char;

  ManagedByNameCharFunc(): char {
    hilog.error(0x0000, 'testTag', "Print in ManagedByNameCharFunc");
    return 'K';
  }
  
  native NativeByNameFloatFunc(): float;

  ManagedByNameFloatFunc(): float {
    hilog.error(0x0000, 'testTag', "Print in ManagedByNameFloatFunc");
    return 15.655;
  }

  native NativeByNameByteFunc(): byte;

  ManagedByNameByteFunc(): byte {
    hilog.error(0x0000, 'testTag', "Print in ManagedByNameByteFunc");
    return 0x3;
  }

  native Global_Local_References(): void;

  native Weak_Global_References(): void;

  native VMInterface(): void;

  native String_Operations(): string;

  native HandleDoubleData(val1: double): double

  native ProcessArray(a: double[]): void;

  native ProcessArray2(a: double[]): void;
}

class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', 'EntryAbility onCreate');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTag', 'EntryAbility onWindowStageCreate');
    try {
      loadLibrary("entry")
    } catch (e: Error) {
      hilog.error(0x0000, 'testTag', 'loadFailed', e.message);
    }
    hilog.error(0x0000, 'testTag', 'AfterLoading the library');
    let cls = new Calc(20, 1.23, true, 14785236951);
    cls.UpdateFields();
    cls.UpdateFields2();
    hilog.error(0x0000, 'testTag', 'UpdateField  result byteField ' + cls.byteField);
    hilog.error(0x0000, 'testTag', 'UpdateField  result charField ' + cls.charField);
    hilog.error(0x0000, 'testTag', 'UpdateField  result doubleField ' + cls.doubleField);
    hilog.error(0x0000, 'testTag', 'UpdateField  result boolField ' + cls.boolField);
    hilog.error(0x0000, 'testTag', 'UpdateField  result floatField ' + cls.floatField);
    hilog.error(0x0000, 'testTag', 'UpdateField  result shortField ' + cls.shortField);
    hilog.error(0x0000, 'testTag', 'UpdateField  result intField : ' + cls.intField);
    hilog.error(0x0000, 'testTag', 'UpdateField  result longField ' + cls.longField);
    cls.UpdateStaticFields();
    cls.UpdateStaticFields2();
    hilog.error(0x0000, 'testTag', 'UpdateStaticFields intStaticField : ' + Calc.intStaticField);
    hilog.error(0x0000, 'testTag', 'UpdateStaticFields shortStaticField  : ' + Calc.shortStaticField);
    hilog.error(0x0000, 'testTag', 'UpdateStaticFields longStaticField   : ' + Calc.longStaticField);
    hilog.error(0x0000, 'testTag', 'UpdateStaticFields charStaticField   : ' + Calc.charStaticField);
    hilog.error(0x0000, 'testTag', 'UpdateStaticFields intStaticField    : ' + Calc.doubleStaticField);
    hilog.error(0x0000, 'testTag', 'UpdateStaticFields shortStaticField  : ' + Calc.floatStaticField);
    hilog.error(0x0000, 'testTag', 'UpdateStaticFields longStaticField   : ' + Calc.boolStaticField);
    hilog.error(0x0000, 'testTag', 'UpdateStaticFields charStaticField   : ' + Calc.byteStaticField);
    hilog.error(0x0000, 'testTag', 'Get Ets UpdateIntFields result : ' + cls.UpdateIntFields());
    hilog.error(0x0000, 'testTag', 'Get Ets UpdateDoubleFields result : ' + cls.UpdateDoubleFields());
    hilog.error(0x0000, 'testTag', 'Get Ets UpdateBoolFields result : ' + cls.UpdateBoolFields());
    hilog.error(0x0000, 'testTag', 'Get Ets UpdateShortFields result : ' + cls.UpdateShortFields());
    hilog.error(0x0000, 'testTag', 'Get Ets UpdateLongFields result : ' + cls.UpdateLongFields());
    hilog.error(0x0000, 'testTag', 'Get Ets UpdateCharFields result : ' + cls.UpdateCharFields());
    hilog.error(0x0000, 'testTag', 'Get Ets UpdateFloatFields result : ' + cls.UpdateFloatFields());
    hilog.error(0x0000, 'testTag', 'Get Ets UpdateByteFields result : ' + cls.UpdateByteFields());
    cls.NativeVoidFunc();
    cls.NativeBoolFunc();
    cls.NativeIntFunc();
    cls.NativeLongFunc();
    cls.NativeDoubleFunc();
    cls.NativeFloatFunc();
    cls.NativeCharFunc();
    cls.NativeByteFunc();
    cls.NativeStaticFunc();
    cls.UpdateByNameFields();
    cls.UpdateByNameFields2();
    hilog.error(0x0000, 'testTag', 'UpdateByNameFields  result fieldByName_Bytes ' + cls.fieldByName_Byte);
    hilog.error(0x0000, 'testTag', 'UpdateByNameFields  result fieldByName_Double ' + cls.fieldByName_Double);
    hilog.error(0x0000, 'testTag', 'UpdateByNameFields  result fieldByName_Short ' + cls.fieldByName_Short);
    hilog.error(0x0000, 'testTag', 'UpdateByNameFields  result fieldByName_Bool ' + cls.fieldByName_Bool);
    hilog.error(0x0000, 'testTag', 'UpdateByNameFields  result fieldByName_Float ' + cls.fieldByName_Float);
    hilog.error(0x0000, 'testTag', 'UpdateByNameFields  result fieldByName_Int ' + cls.fieldByName_Int);
    hilog.error(0x0000, 'testTag', 'UpdateByNameFields  result fieldByName_Long ' + cls.fieldByName_Long);
    hilog.error(0x0000, 'testTag', 'UpdateByNameFields  result fieldByName_Char ' + cls.fieldByName_Char);
    hilog.error(0x0000, 'testTag', 'GetVersionInfo  result : ' + cls.GetVersionInfo());
    cls.Global_Local_References();
    cls.Weak_Global_References();
    cls.NativeByNameFunc();
    hilog.error(0x0000, 'testTag', 'NativeByNameDoubleFunc()  result  ' + cls.NativeByNameDoubleFunc());
    hilog.error(0x0000, 'testTag', 'NativeByNameBoolFunc()  result  ' + cls.NativeByNameBoolFunc());
    hilog.error(0x0000, 'testTag', 'NativeByNameIntFunc()  result  ' + cls.NativeByNameIntFunc());
    hilog.error(0x0000, 'testTag', 'NativeByNameShortFunc()  result  ' + cls.NativeByNameShortFunc());
    hilog.error(0x0000, 'testTag', 'NativeByNameLongFunc()  result  ' + cls.NativeByNameLongFunc());
    hilog.error(0x0000, 'testTag', 'NativeByNameCharFunc()  result  ' + cls.NativeByNameCharFunc());
    hilog.error(0x0000, 'testTag', 'NativeByNameFloatFunc()  result  ' + cls.NativeByNameFloatFunc());
    hilog.error(0x0000, 'testTag', 'NativeByNameByteFunc()  result  ' + cls.NativeByNameByteFunc());
    hilog.error(0x0000, 'testTag', 'HandleDoubleData() result ' + cls.HandleDoubleData(15));
    hilog.error(0x0000, 'testTag', 'String_Operations result : ' + cls.String_Operations())
    let s: double[] = [5, 15, 20];
    cls.ProcessArray(s);
    cls.ProcessArray2(s);
    
    try {
      windowStage.loadContent('pages/Index', (err: Error): void => {
        hilog.info(0x0000, 'testTag', 'loadContent entering');
      });
    } catch (e: Error) {
      hilog.info(0x0000, 'testTag', 'loadContent catch error：-----------' + e.message);
    }
  }
}