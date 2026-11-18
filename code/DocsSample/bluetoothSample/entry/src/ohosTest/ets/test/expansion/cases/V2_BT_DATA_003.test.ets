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
import { expect } from '@ohos/hypium';
import { ScanData } from '../../../../../main/ets/common/ScanData';
/**
 * @tc.number V2_BT_DATA_003
 * @tc.name EXP_V2_BT_DATA_003
 * @tc.desc Constructor, ordered independent setters, sibling defaults, caller ownership, detached replacement and inverse replay. Scenario: {"bytes":[],"rssi":-1,"reverseSetterOrder":false,"connectable":false,"nameClass":"ASCII 123"}
 * @tc.size MediumTest
 * @tc.type Function
 * @tc.level Level1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const input = new Uint8Array([]);
    const value = new ScanData('AA:BB:03', 'ASCII 123', -1, false, input);
    const sibling = new ScanData();
    expect(value.getDeviceId()).assertEqual('AA:BB:03');
    expect(value.getDeviceName()).assertEqual('ASCII 123');
    expect(value.getRssi()).assertEqual(-1);
    expect(value.getConnectable()).assertEqual(false);
    expect(value.getData().length).assertEqual(0);
    expect(value.getData().join(',')).assertEqual('');
    expect(sibling.getDeviceId()).assertEqual('');
    expect(sibling.getDeviceName()).assertEqual('null');
    expect(sibling.getRssi()).assertEqual(0);
    expect(sibling.getConnectable()).assertEqual(false);
    expect(sibling.getData().length).assertEqual(4);
    expect(sibling.getData().join(',')).assertEqual('255,255,255,255');
    expect(value.getData() === input).assertTrue();
    expect(sibling.getData() !== input).assertTrue();
    const siblingBytes = sibling.getData();
    const secondDefault = new ScanData();
    expect(secondDefault.getData() !== siblingBytes).assertTrue();
    siblingBytes[0] = 17;
    expect(secondDefault.getData()[0]).assertEqual(255);
    value.setDeviceId('AA:BB:03-new');
    expect(value.getDeviceId()).assertEqual('AA:BB:03-new');
    expect(value.getDeviceName()).assertEqual('ASCII 123');
    expect(value.getRssi()).assertEqual(-1);
    expect(value.getConnectable()).assertEqual(false);
    expect(value.getData().length).assertEqual(0);
    expect(value.getData().join(',')).assertEqual('');
    value.setDeviceName('renamed-3');
    expect(value.getDeviceId()).assertEqual('AA:BB:03-new');
    expect(value.getDeviceName()).assertEqual('renamed-3');
    expect(value.getRssi()).assertEqual(-1);
    expect(value.getConnectable()).assertEqual(false);
    expect(value.getData().length).assertEqual(0);
    expect(value.getData().join(',')).assertEqual('');
    value.setRssi(127);
    expect(value.getDeviceId()).assertEqual('AA:BB:03-new');
    expect(value.getDeviceName()).assertEqual('renamed-3');
    expect(value.getRssi()).assertEqual(127);
    expect(value.getConnectable()).assertEqual(false);
    expect(value.getData().length).assertEqual(0);
    expect(value.getData().join(',')).assertEqual('');
    value.setConnectable(true);
    expect(value.getDeviceId()).assertEqual('AA:BB:03-new');
    expect(value.getDeviceName()).assertEqual('renamed-3');
    expect(value.getRssi()).assertEqual(127);
    expect(value.getConnectable()).assertEqual(true);
    expect(value.getData().length).assertEqual(0);
    expect(value.getData().join(',')).assertEqual('');
    const replacement = new Uint8Array([9, 0, 128, 255]);
    value.setData(replacement);
    expect(value.getData() === replacement).assertTrue();
    expect(value.getData() !== input).assertTrue();
    expect(value.getDeviceId()).assertEqual('AA:BB:03-new');
    expect(value.getDeviceName()).assertEqual('renamed-3');
    expect(value.getRssi()).assertEqual(127);
    expect(value.getConnectable()).assertEqual(true);
    expect(value.getData().length).assertEqual(4);
    expect(value.getData().join(',')).assertEqual('9,0,128,255');
    replacement[2] = 64;
    expect(value.getData()[2]).assertEqual(64);
    expect(input.join(',')).assertEqual('');
    expect(sibling.getData()[0]).assertEqual(17);
    value.setDeviceId('AA:BB:03');
    value.setDeviceName('ASCII 123');
    value.setRssi(-1);
    value.setConnectable(false);
    value.setData(input);
    expect(value.getDeviceId()).assertEqual('AA:BB:03');
    expect(value.getDeviceName()).assertEqual('ASCII 123');
    expect(value.getRssi()).assertEqual(-1);
    expect(value.getConnectable()).assertEqual(false);
    expect(value.getData().length).assertEqual(0);
    expect(value.getData().join(',')).assertEqual('');
    expect(value.getData() === input).assertTrue();
    expect(replacement.join(',')).assertEqual('9,0,64,255');
  };

export default runExpansionCase;
