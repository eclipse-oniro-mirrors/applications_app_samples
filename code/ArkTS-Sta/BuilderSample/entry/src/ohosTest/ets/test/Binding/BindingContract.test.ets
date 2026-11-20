'use static';

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
import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { GetterBinding, GetterSetterBinding, CountingBinding } from '../Shared/BindingContract';
import { logSuite } from '../Shared/Copy';

export default function BindingContractTest(): void {
  describe('BindingContractTest', () => {
    beforeAll(() => {
      logSuite('BindingContractTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout((): void => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('BindingContractTest', 'end');
    });

    /**
     * @tc.name BindingContractTest_case_0001
     * @tc.desc binding-contract: one-way getter binding for empty, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0001', 0, () => {
      let source: string = '';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('');
      source = 'NEXT';
      expect(binding.read()).assertEqual('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual(binding.read());
    });

    /**
     * @tc.name BindingContractTest_case_0002
     * @tc.desc binding-contract: one-way getter binding for empty, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0002', 0, () => {
      let source: string = '';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('');
      expect(binding.read()).assertEqual(source);
      expect(binding.read().length).assertEqual(source.length);
      const second: GetterBinding = new GetterBinding(() => source);
      expect(second.read()).assertEqual(binding.read());
      expect(second === binding).assertFalse();
    });

    /**
     * @tc.name BindingContractTest_case_0003
     * @tc.desc binding-contract: mutable binding write for empty, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0003', 0, () => {
      let source: string = '';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('');
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(seen).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect(seen.length).assertEqual(4);
    });

    /**
     * @tc.name BindingContractTest_case_0004
     * @tc.desc binding-contract: mutable binding write for empty, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0004', 0, () => {
      let source: string = '';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('');
      binding.write('');
      expect(source).assertEqual('');
      expect(seen).assertEqual('');
      expect(binding.read().length).assertEqual(0);
      expect(binding.read() === source).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0005
     * @tc.desc binding-contract: one-way getter binding for space, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0005', 0, () => {
      let source: string = ' ';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual(' ');
      source = 'NEXT';
      expect(binding.read()).assertEqual('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual(binding.read());
    });

    /**
     * @tc.name BindingContractTest_case_0006
     * @tc.desc binding-contract: one-way getter binding for space, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0006', 0, () => {
      let source: string = ' ';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual(' ');
      expect(binding.read()).assertEqual(source);
      expect(binding.read().length).assertEqual(source.length);
      const second: GetterBinding = new GetterBinding(() => source);
      expect(second.read()).assertEqual(binding.read());
      expect(second === binding).assertFalse();
    });

    /**
     * @tc.name BindingContractTest_case_0007
     * @tc.desc binding-contract: mutable binding write for space, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0007', 0, () => {
      let source: string = ' ';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual(' ');
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(seen).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect(seen.length).assertEqual(4);
    });

    /**
     * @tc.name BindingContractTest_case_0008
     * @tc.desc binding-contract: mutable binding write for space, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0008', 0, () => {
      let source: string = ' ';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual(' ');
      binding.write(' ');
      expect(source).assertEqual(' ');
      expect(seen).assertEqual(' ');
      expect(binding.read().length).assertEqual(1);
      expect(binding.read() === source).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0009
     * @tc.desc binding-contract: one-way getter binding for ascii, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0009', 0, () => {
      let source: string = 'A';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('A');
      source = 'NEXT';
      expect(binding.read()).assertEqual('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual(binding.read());
    });

    /**
     * @tc.name BindingContractTest_case_0010
     * @tc.desc binding-contract: one-way getter binding for ascii, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0010', 0, () => {
      let source: string = 'A';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('A');
      expect(binding.read()).assertEqual(source);
      expect(binding.read().length).assertEqual(source.length);
      const second: GetterBinding = new GetterBinding(() => source);
      expect(second.read()).assertEqual(binding.read());
      expect(second === binding).assertFalse();
    });

    /**
     * @tc.name BindingContractTest_case_0011
     * @tc.desc binding-contract: mutable binding write for ascii, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0011', 0, () => {
      let source: string = 'A';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('A');
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(seen).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect(seen.length).assertEqual(4);
    });

    /**
     * @tc.name BindingContractTest_case_0012
     * @tc.desc binding-contract: mutable binding write for ascii, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0012', 0, () => {
      let source: string = 'A';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('A');
      binding.write('A');
      expect(source).assertEqual('A');
      expect(seen).assertEqual('A');
      expect(binding.read().length).assertEqual(1);
      expect(binding.read() === source).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0013
     * @tc.desc binding-contract: one-way getter binding for word, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0013', 0, () => {
      let source: string = 'abc';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('abc');
      source = 'NEXT';
      expect(binding.read()).assertEqual('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual(binding.read());
    });

    /**
     * @tc.name BindingContractTest_case_0014
     * @tc.desc binding-contract: one-way getter binding for word, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0014', 0, () => {
      let source: string = 'abc';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('abc');
      expect(binding.read()).assertEqual(source);
      expect(binding.read().length).assertEqual(source.length);
      const second: GetterBinding = new GetterBinding(() => source);
      expect(second.read()).assertEqual(binding.read());
      expect(second === binding).assertFalse();
    });

    /**
     * @tc.name BindingContractTest_case_0015
     * @tc.desc binding-contract: mutable binding write for word, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0015', 0, () => {
      let source: string = 'abc';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('abc');
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(seen).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect(seen.length).assertEqual(4);
    });

    /**
     * @tc.name BindingContractTest_case_0016
     * @tc.desc binding-contract: mutable binding write for word, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0016', 0, () => {
      let source: string = 'abc';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('abc');
      binding.write('abc');
      expect(source).assertEqual('abc');
      expect(seen).assertEqual('abc');
      expect(binding.read().length).assertEqual(3);
      expect(binding.read() === source).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0017
     * @tc.desc binding-contract: one-way getter binding for han, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0017', 0, () => {
      let source: string = '\u65b0';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('\u65b0');
      source = 'NEXT';
      expect(binding.read()).assertEqual('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual(binding.read());
    });

    /**
     * @tc.name BindingContractTest_case_0018
     * @tc.desc binding-contract: one-way getter binding for han, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0018', 0, () => {
      let source: string = '\u65b0';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('\u65b0');
      expect(binding.read()).assertEqual(source);
      expect(binding.read().length).assertEqual(source.length);
      const second: GetterBinding = new GetterBinding(() => source);
      expect(second.read()).assertEqual(binding.read());
      expect(second === binding).assertFalse();
    });

    /**
     * @tc.name BindingContractTest_case_0019
     * @tc.desc binding-contract: mutable binding write for han, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0019', 0, () => {
      let source: string = '\u65b0';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('\u65b0');
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(seen).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect(seen.length).assertEqual(4);
    });

    /**
     * @tc.name BindingContractTest_case_0020
     * @tc.desc binding-contract: mutable binding write for han, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0020', 0, () => {
      let source: string = '\u65b0';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('\u65b0');
      binding.write('\u65b0');
      expect(source).assertEqual('\u65b0');
      expect(seen).assertEqual('\u65b0');
      expect(binding.read().length).assertEqual(1);
      expect(binding.read() === source).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0021
     * @tc.desc binding-contract: one-way getter binding for han2, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0021', 0, () => {
      let source: string = '\u65b0\u5e74';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('\u65b0\u5e74');
      source = 'NEXT';
      expect(binding.read()).assertEqual('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual(binding.read());
    });

    /**
     * @tc.name BindingContractTest_case_0022
     * @tc.desc binding-contract: one-way getter binding for han2, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0022', 0, () => {
      let source: string = '\u65b0\u5e74';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('\u65b0\u5e74');
      expect(binding.read()).assertEqual(source);
      expect(binding.read().length).assertEqual(source.length);
      const second: GetterBinding = new GetterBinding(() => source);
      expect(second.read()).assertEqual(binding.read());
      expect(second === binding).assertFalse();
    });

    /**
     * @tc.name BindingContractTest_case_0023
     * @tc.desc binding-contract: mutable binding write for han2, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0023', 0, () => {
      let source: string = '\u65b0\u5e74';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('\u65b0\u5e74');
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(seen).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect(seen.length).assertEqual(4);
    });

    /**
     * @tc.name BindingContractTest_case_0024
     * @tc.desc binding-contract: mutable binding write for han2, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0024', 0, () => {
      let source: string = '\u65b0\u5e74';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('\u65b0\u5e74');
      binding.write('\u65b0\u5e74');
      expect(source).assertEqual('\u65b0\u5e74');
      expect(seen).assertEqual('\u65b0\u5e74');
      expect(binding.read().length).assertEqual(2);
      expect(binding.read() === source).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0025
     * @tc.desc binding-contract: one-way getter binding for wish, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0025', 0, () => {
      let source: string = '\u65b0\u5e74\u5feb\u4e50!';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      source = 'NEXT';
      expect(binding.read()).assertEqual('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual(binding.read());
    });

    /**
     * @tc.name BindingContractTest_case_0026
     * @tc.desc binding-contract: one-way getter binding for wish, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0026', 0, () => {
      let source: string = '\u65b0\u5e74\u5feb\u4e50!';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(binding.read()).assertEqual(source);
      expect(binding.read().length).assertEqual(source.length);
      const second: GetterBinding = new GetterBinding(() => source);
      expect(second.read()).assertEqual(binding.read());
      expect(second === binding).assertFalse();
    });

    /**
     * @tc.name BindingContractTest_case_0027
     * @tc.desc binding-contract: mutable binding write for wish, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0027', 0, () => {
      let source: string = '\u65b0\u5e74\u5feb\u4e50!';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(seen).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect(seen.length).assertEqual(4);
    });

    /**
     * @tc.name BindingContractTest_case_0028
     * @tc.desc binding-contract: mutable binding write for wish, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0028', 0, () => {
      let source: string = '\u65b0\u5e74\u5feb\u4e50!';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      binding.write('\u65b0\u5e74\u5feb\u4e50!');
      expect(source).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(seen).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(binding.read().length).assertEqual(5);
      expect(binding.read() === source).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0029
     * @tc.desc binding-contract: one-way getter binding for placeholder, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0029', 0, () => {
      let source: string = '\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      source = 'NEXT';
      expect(binding.read()).assertEqual('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual(binding.read());
    });

    /**
     * @tc.name BindingContractTest_case_0030
     * @tc.desc binding-contract: one-way getter binding for placeholder, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0030', 0, () => {
      let source: string = '\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(binding.read()).assertEqual(source);
      expect(binding.read().length).assertEqual(source.length);
      const second: GetterBinding = new GetterBinding(() => source);
      expect(second.read()).assertEqual(binding.read());
      expect(second === binding).assertFalse();
    });

    /**
     * @tc.name BindingContractTest_case_0031
     * @tc.desc binding-contract: mutable binding write for placeholder, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0031', 0, () => {
      let source: string = '\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(seen).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect(seen.length).assertEqual(4);
    });

    /**
     * @tc.name BindingContractTest_case_0032
     * @tc.desc binding-contract: mutable binding write for placeholder, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0032', 0, () => {
      let source: string = '\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      binding.write('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(source).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(seen).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(binding.read().length).assertEqual(12);
      expect(binding.read() === source).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0033
     * @tc.desc binding-contract: one-way getter binding for emoji, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0033', 0, () => {
      let source: string = '\ud83c\udf88';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('\ud83c\udf88');
      source = 'NEXT';
      expect(binding.read()).assertEqual('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual(binding.read());
    });

    /**
     * @tc.name BindingContractTest_case_0034
     * @tc.desc binding-contract: one-way getter binding for emoji, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0034', 0, () => {
      let source: string = '\ud83c\udf88';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('\ud83c\udf88');
      expect(binding.read()).assertEqual(source);
      expect(binding.read().length).assertEqual(source.length);
      const second: GetterBinding = new GetterBinding(() => source);
      expect(second.read()).assertEqual(binding.read());
      expect(second === binding).assertFalse();
    });

    /**
     * @tc.name BindingContractTest_case_0035
     * @tc.desc binding-contract: mutable binding write for emoji, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0035', 0, () => {
      let source: string = '\ud83c\udf88';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('\ud83c\udf88');
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(seen).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect(seen.length).assertEqual(4);
    });

    /**
     * @tc.name BindingContractTest_case_0036
     * @tc.desc binding-contract: mutable binding write for emoji, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0036', 0, () => {
      let source: string = '\ud83c\udf88';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('\ud83c\udf88');
      binding.write('\ud83c\udf88');
      expect(source).assertEqual('\ud83c\udf88');
      expect(seen).assertEqual('\ud83c\udf88');
      expect(binding.read().length).assertEqual(2);
      expect(binding.read() === source).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0037
     * @tc.desc binding-contract: one-way getter binding for emoji-han, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0037', 0, () => {
      let source: string = '\ud83c\udf88 \u65b0\u5e74';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('\ud83c\udf88 \u65b0\u5e74');
      source = 'NEXT';
      expect(binding.read()).assertEqual('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual(binding.read());
    });

    /**
     * @tc.name BindingContractTest_case_0038
     * @tc.desc binding-contract: one-way getter binding for emoji-han, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0038', 0, () => {
      let source: string = '\ud83c\udf88 \u65b0\u5e74';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('\ud83c\udf88 \u65b0\u5e74');
      expect(binding.read()).assertEqual(source);
      expect(binding.read().length).assertEqual(source.length);
      const second: GetterBinding = new GetterBinding(() => source);
      expect(second.read()).assertEqual(binding.read());
      expect(second === binding).assertFalse();
    });

    /**
     * @tc.name BindingContractTest_case_0039
     * @tc.desc binding-contract: mutable binding write for emoji-han, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0039', 0, () => {
      let source: string = '\ud83c\udf88 \u65b0\u5e74';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('\ud83c\udf88 \u65b0\u5e74');
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(seen).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect(seen.length).assertEqual(4);
    });

    /**
     * @tc.name BindingContractTest_case_0040
     * @tc.desc binding-contract: mutable binding write for emoji-han, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0040', 0, () => {
      let source: string = '\ud83c\udf88 \u65b0\u5e74';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('\ud83c\udf88 \u65b0\u5e74');
      binding.write('\ud83c\udf88 \u65b0\u5e74');
      expect(source).assertEqual('\ud83c\udf88 \u65b0\u5e74');
      expect(seen).assertEqual('\ud83c\udf88 \u65b0\u5e74');
      expect(binding.read().length).assertEqual(5);
      expect(binding.read() === source).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0041
     * @tc.desc binding-contract: one-way getter binding for sparkle, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0041', 0, () => {
      let source: string = '\ud83d\udcab';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('\ud83d\udcab');
      source = 'NEXT';
      expect(binding.read()).assertEqual('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual(binding.read());
    });

    /**
     * @tc.name BindingContractTest_case_0042
     * @tc.desc binding-contract: one-way getter binding for sparkle, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0042', 0, () => {
      let source: string = '\ud83d\udcab';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('\ud83d\udcab');
      expect(binding.read()).assertEqual(source);
      expect(binding.read().length).assertEqual(source.length);
      const second: GetterBinding = new GetterBinding(() => source);
      expect(second.read()).assertEqual(binding.read());
      expect(second === binding).assertFalse();
    });

    /**
     * @tc.name BindingContractTest_case_0043
     * @tc.desc binding-contract: mutable binding write for sparkle, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0043', 0, () => {
      let source: string = '\ud83d\udcab';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('\ud83d\udcab');
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(seen).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect(seen.length).assertEqual(4);
    });

    /**
     * @tc.name BindingContractTest_case_0044
     * @tc.desc binding-contract: mutable binding write for sparkle, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0044', 0, () => {
      let source: string = '\ud83d\udcab';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('\ud83d\udcab');
      binding.write('\ud83d\udcab');
      expect(source).assertEqual('\ud83d\udcab');
      expect(seen).assertEqual('\ud83d\udcab');
      expect(binding.read().length).assertEqual(2);
      expect(binding.read() === source).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0045
     * @tc.desc binding-contract: one-way getter binding for writing, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0045', 0, () => {
      let source: string = '\u270d\ufe0f';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('\u270d\ufe0f');
      source = 'NEXT';
      expect(binding.read()).assertEqual('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual(binding.read());
    });

    /**
     * @tc.name BindingContractTest_case_0046
     * @tc.desc binding-contract: one-way getter binding for writing, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0046', 0, () => {
      let source: string = '\u270d\ufe0f';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('\u270d\ufe0f');
      expect(binding.read()).assertEqual(source);
      expect(binding.read().length).assertEqual(source.length);
      const second: GetterBinding = new GetterBinding(() => source);
      expect(second.read()).assertEqual(binding.read());
      expect(second === binding).assertFalse();
    });

    /**
     * @tc.name BindingContractTest_case_0047
     * @tc.desc binding-contract: mutable binding write for writing, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0047', 0, () => {
      let source: string = '\u270d\ufe0f';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('\u270d\ufe0f');
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(seen).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect(seen.length).assertEqual(4);
    });

    /**
     * @tc.name BindingContractTest_case_0048
     * @tc.desc binding-contract: mutable binding write for writing, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0048', 0, () => {
      let source: string = '\u270d\ufe0f';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('\u270d\ufe0f');
      binding.write('\u270d\ufe0f');
      expect(source).assertEqual('\u270d\ufe0f');
      expect(seen).assertEqual('\u270d\ufe0f');
      expect(binding.read().length).assertEqual(2);
      expect(binding.read() === source).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0049
     * @tc.desc binding-contract: one-way getter binding for padded, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0049', 0, () => {
      let source: string = '  padded  ';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('  padded  ');
      source = 'NEXT';
      expect(binding.read()).assertEqual('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual(binding.read());
    });

    /**
     * @tc.name BindingContractTest_case_0050
     * @tc.desc binding-contract: one-way getter binding for padded, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0050', 0, () => {
      let source: string = '  padded  ';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('  padded  ');
      expect(binding.read()).assertEqual(source);
      expect(binding.read().length).assertEqual(source.length);
      const second: GetterBinding = new GetterBinding(() => source);
      expect(second.read()).assertEqual(binding.read());
      expect(second === binding).assertFalse();
    });

    /**
     * @tc.name BindingContractTest_case_0051
     * @tc.desc binding-contract: mutable binding write for padded, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0051', 0, () => {
      let source: string = '  padded  ';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('  padded  ');
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(seen).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect(seen.length).assertEqual(4);
    });

    /**
     * @tc.name BindingContractTest_case_0052
     * @tc.desc binding-contract: mutable binding write for padded, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0052', 0, () => {
      let source: string = '  padded  ';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('  padded  ');
      binding.write('  padded  ');
      expect(source).assertEqual('  padded  ');
      expect(seen).assertEqual('  padded  ');
      expect(binding.read().length).assertEqual(10);
      expect(binding.read() === source).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0053
     * @tc.desc binding-contract: one-way getter binding for newline, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0053', 0, () => {
      let source: string = 'line\nbreak';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('line\nbreak');
      source = 'NEXT';
      expect(binding.read()).assertEqual('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual(binding.read());
    });

    /**
     * @tc.name BindingContractTest_case_0054
     * @tc.desc binding-contract: one-way getter binding for newline, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0054', 0, () => {
      let source: string = 'line\nbreak';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('line\nbreak');
      expect(binding.read()).assertEqual(source);
      expect(binding.read().length).assertEqual(source.length);
      const second: GetterBinding = new GetterBinding(() => source);
      expect(second.read()).assertEqual(binding.read());
      expect(second === binding).assertFalse();
    });

    /**
     * @tc.name BindingContractTest_case_0055
     * @tc.desc binding-contract: mutable binding write for newline, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0055', 0, () => {
      let source: string = 'line\nbreak';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('line\nbreak');
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(seen).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect(seen.length).assertEqual(4);
    });

    /**
     * @tc.name BindingContractTest_case_0056
     * @tc.desc binding-contract: mutable binding write for newline, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0056', 0, () => {
      let source: string = 'line\nbreak';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('line\nbreak');
      binding.write('line\nbreak');
      expect(source).assertEqual('line\nbreak');
      expect(seen).assertEqual('line\nbreak');
      expect(binding.read().length).assertEqual(10);
      expect(binding.read() === source).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0057
     * @tc.desc binding-contract: one-way getter binding for tab, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0057', 0, () => {
      let source: string = 'tab\tvalue';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('tab\tvalue');
      source = 'NEXT';
      expect(binding.read()).assertEqual('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual(binding.read());
    });

    /**
     * @tc.name BindingContractTest_case_0058
     * @tc.desc binding-contract: one-way getter binding for tab, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0058', 0, () => {
      let source: string = 'tab\tvalue';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('tab\tvalue');
      expect(binding.read()).assertEqual(source);
      expect(binding.read().length).assertEqual(source.length);
      const second: GetterBinding = new GetterBinding(() => source);
      expect(second.read()).assertEqual(binding.read());
      expect(second === binding).assertFalse();
    });

    /**
     * @tc.name BindingContractTest_case_0059
     * @tc.desc binding-contract: mutable binding write for tab, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0059', 0, () => {
      let source: string = 'tab\tvalue';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('tab\tvalue');
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(seen).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect(seen.length).assertEqual(4);
    });

    /**
     * @tc.name BindingContractTest_case_0060
     * @tc.desc binding-contract: mutable binding write for tab, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0060', 0, () => {
      let source: string = 'tab\tvalue';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('tab\tvalue');
      binding.write('tab\tvalue');
      expect(source).assertEqual('tab\tvalue');
      expect(seen).assertEqual('tab\tvalue');
      expect(binding.read().length).assertEqual(9);
      expect(binding.read() === source).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0061
     * @tc.desc binding-contract: one-way getter binding for quotes, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0061', 0, () => {
      let source: string = 'quote"slash\\';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('quote"slash\\');
      source = 'NEXT';
      expect(binding.read()).assertEqual('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual(binding.read());
    });

    /**
     * @tc.name BindingContractTest_case_0062
     * @tc.desc binding-contract: one-way getter binding for quotes, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0062', 0, () => {
      let source: string = 'quote"slash\\';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('quote"slash\\');
      expect(binding.read()).assertEqual(source);
      expect(binding.read().length).assertEqual(source.length);
      const second: GetterBinding = new GetterBinding(() => source);
      expect(second.read()).assertEqual(binding.read());
      expect(second === binding).assertFalse();
    });

    /**
     * @tc.name BindingContractTest_case_0063
     * @tc.desc binding-contract: mutable binding write for quotes, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0063', 0, () => {
      let source: string = 'quote"slash\\';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('quote"slash\\');
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(seen).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect(seen.length).assertEqual(4);
    });

    /**
     * @tc.name BindingContractTest_case_0064
     * @tc.desc binding-contract: mutable binding write for quotes, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0064', 0, () => {
      let source: string = 'quote"slash\\';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('quote"slash\\');
      binding.write('quote"slash\\');
      expect(source).assertEqual('quote"slash\\');
      expect(seen).assertEqual('quote"slash\\');
      expect(binding.read().length).assertEqual(12);
      expect(binding.read() === source).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0065
     * @tc.desc binding-contract: one-way getter binding for template, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0065', 0, () => {
      let source: string = '${notExecuted}';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('${notExecuted}');
      source = 'NEXT';
      expect(binding.read()).assertEqual('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual(binding.read());
    });

    /**
     * @tc.name BindingContractTest_case_0066
     * @tc.desc binding-contract: one-way getter binding for template, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0066', 0, () => {
      let source: string = '${notExecuted}';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('${notExecuted}');
      expect(binding.read()).assertEqual(source);
      expect(binding.read().length).assertEqual(source.length);
      const second: GetterBinding = new GetterBinding(() => source);
      expect(second.read()).assertEqual(binding.read());
      expect(second === binding).assertFalse();
    });

    /**
     * @tc.name BindingContractTest_case_0067
     * @tc.desc binding-contract: mutable binding write for template, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0067', 0, () => {
      let source: string = '${notExecuted}';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('${notExecuted}');
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(seen).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect(seen.length).assertEqual(4);
    });

    /**
     * @tc.name BindingContractTest_case_0068
     * @tc.desc binding-contract: mutable binding write for template, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0068', 0, () => {
      let source: string = '${notExecuted}';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('${notExecuted}');
      binding.write('${notExecuted}');
      expect(source).assertEqual('${notExecuted}');
      expect(seen).assertEqual('${notExecuted}');
      expect(binding.read().length).assertEqual(14);
      expect(binding.read() === source).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0069
     * @tc.desc binding-contract: one-way getter binding for markup, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0069', 0, () => {
      let source: string = '<b>wish</b>';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('<b>wish</b>');
      source = 'NEXT';
      expect(binding.read()).assertEqual('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual(binding.read());
    });

    /**
     * @tc.name BindingContractTest_case_0070
     * @tc.desc binding-contract: one-way getter binding for markup, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0070', 0, () => {
      let source: string = '<b>wish</b>';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('<b>wish</b>');
      expect(binding.read()).assertEqual(source);
      expect(binding.read().length).assertEqual(source.length);
      const second: GetterBinding = new GetterBinding(() => source);
      expect(second.read()).assertEqual(binding.read());
      expect(second === binding).assertFalse();
    });

    /**
     * @tc.name BindingContractTest_case_0071
     * @tc.desc binding-contract: mutable binding write for markup, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0071', 0, () => {
      let source: string = '<b>wish</b>';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('<b>wish</b>');
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(seen).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect(seen.length).assertEqual(4);
    });

    /**
     * @tc.name BindingContractTest_case_0072
     * @tc.desc binding-contract: mutable binding write for markup, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0072', 0, () => {
      let source: string = '<b>wish</b>';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('<b>wish</b>');
      binding.write('<b>wish</b>');
      expect(source).assertEqual('<b>wish</b>');
      expect(seen).assertEqual('<b>wish</b>');
      expect(binding.read().length).assertEqual(11);
      expect(binding.read() === source).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0073
     * @tc.desc binding-contract: one-way getter binding for zero, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0073', 0, () => {
      let source: string = '0';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('0');
      source = 'NEXT';
      expect(binding.read()).assertEqual('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual(binding.read());
    });

    /**
     * @tc.name BindingContractTest_case_0074
     * @tc.desc binding-contract: one-way getter binding for zero, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0074', 0, () => {
      let source: string = '0';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('0');
      expect(binding.read()).assertEqual(source);
      expect(binding.read().length).assertEqual(source.length);
      const second: GetterBinding = new GetterBinding(() => source);
      expect(second.read()).assertEqual(binding.read());
      expect(second === binding).assertFalse();
    });

    /**
     * @tc.name BindingContractTest_case_0075
     * @tc.desc binding-contract: mutable binding write for zero, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0075', 0, () => {
      let source: string = '0';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('0');
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(seen).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect(seen.length).assertEqual(4);
    });

    /**
     * @tc.name BindingContractTest_case_0076
     * @tc.desc binding-contract: mutable binding write for zero, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0076', 0, () => {
      let source: string = '0';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('0');
      binding.write('0');
      expect(source).assertEqual('0');
      expect(seen).assertEqual('0');
      expect(binding.read().length).assertEqual(1);
      expect(binding.read() === source).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0077
     * @tc.desc binding-contract: one-way getter binding for falseword, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0077', 0, () => {
      let source: string = 'false';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('false');
      source = 'NEXT';
      expect(binding.read()).assertEqual('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual(binding.read());
    });

    /**
     * @tc.name BindingContractTest_case_0078
     * @tc.desc binding-contract: one-way getter binding for falseword, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0078', 0, () => {
      let source: string = 'false';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('false');
      expect(binding.read()).assertEqual(source);
      expect(binding.read().length).assertEqual(source.length);
      const second: GetterBinding = new GetterBinding(() => source);
      expect(second.read()).assertEqual(binding.read());
      expect(second === binding).assertFalse();
    });

    /**
     * @tc.name BindingContractTest_case_0079
     * @tc.desc binding-contract: mutable binding write for falseword, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0079', 0, () => {
      let source: string = 'false';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('false');
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(seen).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect(seen.length).assertEqual(4);
    });

    /**
     * @tc.name BindingContractTest_case_0080
     * @tc.desc binding-contract: mutable binding write for falseword, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0080', 0, () => {
      let source: string = 'false';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('false');
      binding.write('false');
      expect(source).assertEqual('false');
      expect(seen).assertEqual('false');
      expect(binding.read().length).assertEqual(5);
      expect(binding.read() === source).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0081
     * @tc.desc binding-contract: one-way getter binding for defaulttext, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0081', 0, () => {
      let source: string = '\"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:\"';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('\"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:\"');
      source = 'NEXT';
      expect(binding.read()).assertEqual('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual(binding.read());
    });

    /**
     * @tc.name BindingContractTest_case_0082
     * @tc.desc binding-contract: one-way getter binding for defaulttext, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0082', 0, () => {
      let source: string = '\"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:\"';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('\"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:\"');
      expect(binding.read()).assertEqual(source);
      expect(binding.read().length).assertEqual(source.length);
      const second: GetterBinding = new GetterBinding(() => source);
      expect(second.read()).assertEqual(binding.read());
      expect(second === binding).assertFalse();
    });

    /**
     * @tc.name BindingContractTest_case_0083
     * @tc.desc binding-contract: mutable binding write for defaulttext, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0083', 0, () => {
      let source: string = '\"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:\"';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('\"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:\"');
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(seen).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect(seen.length).assertEqual(4);
    });

    /**
     * @tc.name BindingContractTest_case_0084
     * @tc.desc binding-contract: mutable binding write for defaulttext, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0084', 0, () => {
      let source: string = '\"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:\"';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('\"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:\"');
      binding.write('\"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:\"');
      expect(source).assertEqual('\"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:\"');
      expect(seen).assertEqual('\"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:\"');
      expect(binding.read().length).assertEqual(12);
      expect(binding.read() === source).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0085
     * @tc.desc binding-contract: one-way getter binding for arabic, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0085', 0, () => {
      let source: string = '\u0645\u0631\u062d\u0628\u0627';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('\u0645\u0631\u062d\u0628\u0627');
      source = 'NEXT';
      expect(binding.read()).assertEqual('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual(binding.read());
    });

    /**
     * @tc.name BindingContractTest_case_0086
     * @tc.desc binding-contract: one-way getter binding for arabic, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0086', 0, () => {
      let source: string = '\u0645\u0631\u062d\u0628\u0627';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('\u0645\u0631\u062d\u0628\u0627');
      expect(binding.read()).assertEqual(source);
      expect(binding.read().length).assertEqual(source.length);
      const second: GetterBinding = new GetterBinding(() => source);
      expect(second.read()).assertEqual(binding.read());
      expect(second === binding).assertFalse();
    });

    /**
     * @tc.name BindingContractTest_case_0087
     * @tc.desc binding-contract: mutable binding write for arabic, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0087', 0, () => {
      let source: string = '\u0645\u0631\u062d\u0628\u0627';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('\u0645\u0631\u062d\u0628\u0627');
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(seen).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect(seen.length).assertEqual(4);
    });

    /**
     * @tc.name BindingContractTest_case_0088
     * @tc.desc binding-contract: mutable binding write for arabic, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0088', 0, () => {
      let source: string = '\u0645\u0631\u062d\u0628\u0627';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('\u0645\u0631\u062d\u0628\u0627');
      binding.write('\u0645\u0631\u062d\u0628\u0627');
      expect(source).assertEqual('\u0645\u0631\u062d\u0628\u0627');
      expect(seen).assertEqual('\u0645\u0631\u062d\u0628\u0627');
      expect(binding.read().length).assertEqual(5);
      expect(binding.read() === source).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0089
     * @tc.desc binding-contract: one-way getter binding for accent, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0089', 0, () => {
      let source: string = '\u00e9';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('\u00e9');
      source = 'NEXT';
      expect(binding.read()).assertEqual('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual(binding.read());
    });

    /**
     * @tc.name BindingContractTest_case_0090
     * @tc.desc binding-contract: one-way getter binding for accent, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0090', 0, () => {
      let source: string = '\u00e9';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('\u00e9');
      expect(binding.read()).assertEqual(source);
      expect(binding.read().length).assertEqual(source.length);
      const second: GetterBinding = new GetterBinding(() => source);
      expect(second.read()).assertEqual(binding.read());
      expect(second === binding).assertFalse();
    });

    /**
     * @tc.name BindingContractTest_case_0091
     * @tc.desc binding-contract: mutable binding write for accent, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0091', 0, () => {
      let source: string = '\u00e9';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('\u00e9');
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(seen).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect(seen.length).assertEqual(4);
    });

    /**
     * @tc.name BindingContractTest_case_0092
     * @tc.desc binding-contract: mutable binding write for accent, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0092', 0, () => {
      let source: string = '\u00e9';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('\u00e9');
      binding.write('\u00e9');
      expect(source).assertEqual('\u00e9');
      expect(seen).assertEqual('\u00e9');
      expect(binding.read().length).assertEqual(1);
      expect(binding.read() === source).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0093
     * @tc.desc binding-contract: one-way getter binding for combining, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0093', 0, () => {
      let source: string = 'e\u0301';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('e\u0301');
      source = 'NEXT';
      expect(binding.read()).assertEqual('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual(binding.read());
    });

    /**
     * @tc.name BindingContractTest_case_0094
     * @tc.desc binding-contract: one-way getter binding for combining, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0094', 0, () => {
      let source: string = 'e\u0301';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('e\u0301');
      expect(binding.read()).assertEqual(source);
      expect(binding.read().length).assertEqual(source.length);
      const second: GetterBinding = new GetterBinding(() => source);
      expect(second.read()).assertEqual(binding.read());
      expect(second === binding).assertFalse();
    });

    /**
     * @tc.name BindingContractTest_case_0095
     * @tc.desc binding-contract: mutable binding write for combining, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0095', 0, () => {
      let source: string = 'e\u0301';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('e\u0301');
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(seen).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect(seen.length).assertEqual(4);
    });

    /**
     * @tc.name BindingContractTest_case_0096
     * @tc.desc binding-contract: mutable binding write for combining, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0096', 0, () => {
      let source: string = 'e\u0301';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('e\u0301');
      binding.write('e\u0301');
      expect(source).assertEqual('e\u0301');
      expect(seen).assertEqual('e\u0301');
      expect(binding.read().length).assertEqual(2);
      expect(binding.read() === source).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0097
     * @tc.desc binding-contract: one-way getter binding for zwj, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0097', 0, () => {
      let source: string = '\ud83d\udc69\u200d\ud83d\udcbb';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('\ud83d\udc69\u200d\ud83d\udcbb');
      source = 'NEXT';
      expect(binding.read()).assertEqual('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual(binding.read());
    });

    /**
     * @tc.name BindingContractTest_case_0098
     * @tc.desc binding-contract: one-way getter binding for zwj, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0098', 0, () => {
      let source: string = '\ud83d\udc69\u200d\ud83d\udcbb';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('\ud83d\udc69\u200d\ud83d\udcbb');
      expect(binding.read()).assertEqual(source);
      expect(binding.read().length).assertEqual(source.length);
      const second: GetterBinding = new GetterBinding(() => source);
      expect(second.read()).assertEqual(binding.read());
      expect(second === binding).assertFalse();
    });

    /**
     * @tc.name BindingContractTest_case_0099
     * @tc.desc binding-contract: mutable binding write for zwj, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0099', 0, () => {
      let source: string = '\ud83d\udc69\u200d\ud83d\udcbb';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('\ud83d\udc69\u200d\ud83d\udcbb');
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(seen).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect(seen.length).assertEqual(4);
    });

  });
}
