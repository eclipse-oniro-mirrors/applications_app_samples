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

    /**
     * @tc.name BindingContractTest_case_0100
     * @tc.desc binding-contract: mutable binding write for zwj, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0100', 0, () => {
      let source: string = '\ud83d\udc69\u200d\ud83d\udcbb';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('\ud83d\udc69\u200d\ud83d\udcbb');
      binding.write('\ud83d\udc69\u200d\ud83d\udcbb');
      expect(source).assertEqual('\ud83d\udc69\u200d\ud83d\udcbb');
      expect(seen).assertEqual('\ud83d\udc69\u200d\ud83d\udcbb');
      expect(binding.read().length).assertEqual(5);
      expect(binding.read() === source).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0101
     * @tc.desc binding-contract: one-way getter binding for long, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0101', 0, () => {
      let source: string = 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      source = 'NEXT';
      expect(binding.read()).assertEqual('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual(binding.read());
    });

    /**
     * @tc.name BindingContractTest_case_0102
     * @tc.desc binding-contract: one-way getter binding for long, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0102', 0, () => {
      let source: string = 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      expect(binding.read()).assertEqual(source);
      expect(binding.read().length).assertEqual(source.length);
      const second: GetterBinding = new GetterBinding(() => source);
      expect(second.read()).assertEqual(binding.read());
      expect(second === binding).assertFalse();
    });

    /**
     * @tc.name BindingContractTest_case_0103
     * @tc.desc binding-contract: mutable binding write for long, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0103', 0, () => {
      let source: string = 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(seen).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect(seen.length).assertEqual(4);
    });

    /**
     * @tc.name BindingContractTest_case_0104
     * @tc.desc binding-contract: mutable binding write for long, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0104', 0, () => {
      let source: string = 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      binding.write('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      expect(source).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      expect(seen).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      expect(binding.read().length).assertEqual(64);
      expect(binding.read() === source).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0105
     * @tc.desc binding-contract: one-way getter binding for minus, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0105', 0, () => {
      let source: string = '-1';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('-1');
      source = 'NEXT';
      expect(binding.read()).assertEqual('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual(binding.read());
    });

    /**
     * @tc.name BindingContractTest_case_0106
     * @tc.desc binding-contract: one-way getter binding for minus, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0106', 0, () => {
      let source: string = '-1';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('-1');
      expect(binding.read()).assertEqual(source);
      expect(binding.read().length).assertEqual(source.length);
      const second: GetterBinding = new GetterBinding(() => source);
      expect(second.read()).assertEqual(binding.read());
      expect(second === binding).assertFalse();
    });

    /**
     * @tc.name BindingContractTest_case_0107
     * @tc.desc binding-contract: mutable binding write for minus, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0107', 0, () => {
      let source: string = '-1';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('-1');
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(seen).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect(seen.length).assertEqual(4);
    });

    /**
     * @tc.name BindingContractTest_case_0108
     * @tc.desc binding-contract: mutable binding write for minus, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0108', 0, () => {
      let source: string = '-1';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('-1');
      binding.write('-1');
      expect(source).assertEqual('-1');
      expect(seen).assertEqual('-1');
      expect(binding.read().length).assertEqual(2);
      expect(binding.read() === source).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0109
     * @tc.desc binding-contract: one-way getter binding for float, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0109', 0, () => {
      let source: string = '3.14';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('3.14');
      source = 'NEXT';
      expect(binding.read()).assertEqual('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual(binding.read());
    });

    /**
     * @tc.name BindingContractTest_case_0110
     * @tc.desc binding-contract: one-way getter binding for float, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0110', 0, () => {
      let source: string = '3.14';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('3.14');
      expect(binding.read()).assertEqual(source);
      expect(binding.read().length).assertEqual(source.length);
      const second: GetterBinding = new GetterBinding(() => source);
      expect(second.read()).assertEqual(binding.read());
      expect(second === binding).assertFalse();
    });

    /**
     * @tc.name BindingContractTest_case_0111
     * @tc.desc binding-contract: mutable binding write for float, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0111', 0, () => {
      let source: string = '3.14';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('3.14');
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(seen).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect(seen.length).assertEqual(4);
    });

    /**
     * @tc.name BindingContractTest_case_0112
     * @tc.desc binding-contract: mutable binding write for float, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0112', 0, () => {
      let source: string = '3.14';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('3.14');
      binding.write('3.14');
      expect(source).assertEqual('3.14');
      expect(seen).assertEqual('3.14');
      expect(binding.read().length).assertEqual(4);
      expect(binding.read() === source).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0113
     * @tc.desc binding-contract: one-way getter binding for nullword, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0113', 0, () => {
      let source: string = 'null';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('null');
      source = 'NEXT';
      expect(binding.read()).assertEqual('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual(binding.read());
    });

    /**
     * @tc.name BindingContractTest_case_0114
     * @tc.desc binding-contract: one-way getter binding for nullword, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0114', 0, () => {
      let source: string = 'null';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('null');
      expect(binding.read()).assertEqual(source);
      expect(binding.read().length).assertEqual(source.length);
      const second: GetterBinding = new GetterBinding(() => source);
      expect(second.read()).assertEqual(binding.read());
      expect(second === binding).assertFalse();
    });

    /**
     * @tc.name BindingContractTest_case_0115
     * @tc.desc binding-contract: mutable binding write for nullword, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0115', 0, () => {
      let source: string = 'null';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('null');
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(seen).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect(seen.length).assertEqual(4);
    });

    /**
     * @tc.name BindingContractTest_case_0116
     * @tc.desc binding-contract: mutable binding write for nullword, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0116', 0, () => {
      let source: string = 'null';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('null');
      binding.write('null');
      expect(source).assertEqual('null');
      expect(seen).assertEqual('null');
      expect(binding.read().length).assertEqual(4);
      expect(binding.read() === source).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0117
     * @tc.desc binding-contract: one-way getter binding for proto, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0117', 0, () => {
      let source: string = '__proto__';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('__proto__');
      source = 'NEXT';
      expect(binding.read()).assertEqual('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual(binding.read());
    });

    /**
     * @tc.name BindingContractTest_case_0118
     * @tc.desc binding-contract: one-way getter binding for proto, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0118', 0, () => {
      let source: string = '__proto__';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('__proto__');
      expect(binding.read()).assertEqual(source);
      expect(binding.read().length).assertEqual(source.length);
      const second: GetterBinding = new GetterBinding(() => source);
      expect(second.read()).assertEqual(binding.read());
      expect(second === binding).assertFalse();
    });

    /**
     * @tc.name BindingContractTest_case_0119
     * @tc.desc binding-contract: mutable binding write for proto, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0119', 0, () => {
      let source: string = '__proto__';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('__proto__');
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(seen).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect(seen.length).assertEqual(4);
    });

    /**
     * @tc.name BindingContractTest_case_0120
     * @tc.desc binding-contract: mutable binding write for proto, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0120', 0, () => {
      let source: string = '__proto__';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('__proto__');
      binding.write('__proto__');
      expect(source).assertEqual('__proto__');
      expect(seen).assertEqual('__proto__');
      expect(binding.read().length).assertEqual(9);
      expect(binding.read() === source).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0121
     * @tc.desc binding-contract: one-way getter binding for ctor, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0121', 0, () => {
      let source: string = 'constructor';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('constructor');
      source = 'NEXT';
      expect(binding.read()).assertEqual('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual(binding.read());
    });

    /**
     * @tc.name BindingContractTest_case_0122
     * @tc.desc binding-contract: one-way getter binding for ctor, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0122', 0, () => {
      let source: string = 'constructor';
      const binding: GetterBinding = new GetterBinding(() => source);
      expect(binding.read()).assertEqual('constructor');
      expect(binding.read()).assertEqual(source);
      expect(binding.read().length).assertEqual(source.length);
      const second: GetterBinding = new GetterBinding(() => source);
      expect(second.read()).assertEqual(binding.read());
      expect(second === binding).assertFalse();
    });

    /**
     * @tc.name BindingContractTest_case_0123
     * @tc.desc binding-contract: mutable binding write for ctor, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0123', 0, () => {
      let source: string = 'constructor';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('constructor');
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(seen).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect(seen.length).assertEqual(4);
    });

    /**
     * @tc.name BindingContractTest_case_0124
     * @tc.desc binding-contract: mutable binding write for ctor, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0124', 0, () => {
      let source: string = 'constructor';
      let seen: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(
        () => source,
        (value: string) => { source = value; seen = value; }
      );
      expect(binding.read()).assertEqual('constructor');
      binding.write('constructor');
      expect(source).assertEqual('constructor');
      expect(seen).assertEqual('constructor');
      expect(binding.read().length).assertEqual(11);
      expect(binding.read() === source).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0125
     * @tc.desc binding-contract: operation sequence RWR over a mutable binding seeded with empty.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0125', 0, () => {
      let source: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      expect(binding.read() === source).assertTrue();
      binding.write('NEXT');
      expect(binding.read() === source).assertTrue();
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0126
     * @tc.desc binding-contract: operation sequence WRW over a mutable binding seeded with empty.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0126', 0, () => {
      let source: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      binding.write('NEXT');
      expect(binding.read() === source).assertTrue();
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0127
     * @tc.desc binding-contract: operation sequence RRW over a mutable binding seeded with empty.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0127', 0, () => {
      let source: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      expect(binding.read() === source).assertTrue();
      expect(binding.read() === source).assertTrue();
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0128
     * @tc.desc binding-contract: operation sequence WWR over a mutable binding seeded with empty.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0128', 0, () => {
      let source: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      binding.write('NEXT');
      binding.write('NEXT');
      expect(binding.read() === source).assertTrue();
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0129
     * @tc.desc binding-contract: operation sequence WWW over a mutable binding seeded with empty.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0129', 0, () => {
      let source: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      binding.write('NEXT');
      binding.write('NEXT');
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0130
     * @tc.desc binding-contract: operation sequence RRR over a mutable binding seeded with empty.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0130', 0, () => {
      let source: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      expect(binding.read() === source).assertTrue();
      expect(binding.read() === source).assertTrue();
      expect(binding.read() === source).assertTrue();
      expect(source).assertEqual('');
      expect(binding.read()).assertEqual('');
      expect((source === '')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0131
     * @tc.desc binding-contract: operation sequence WRR over a mutable binding seeded with empty.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0131', 0, () => {
      let source: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      binding.write('NEXT');
      expect(binding.read() === source).assertTrue();
      expect(binding.read() === source).assertTrue();
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0132
     * @tc.desc binding-contract: operation sequence RWW over a mutable binding seeded with empty.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0132', 0, () => {
      let source: string = '';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      expect(binding.read() === source).assertTrue();
      binding.write('NEXT');
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0133
     * @tc.desc binding-contract: operation sequence RWR over a mutable binding seeded with space.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0133', 0, () => {
      let source: string = ' ';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      expect(binding.read() === source).assertTrue();
      binding.write('NEXT');
      expect(binding.read() === source).assertTrue();
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0134
     * @tc.desc binding-contract: operation sequence WRW over a mutable binding seeded with space.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0134', 0, () => {
      let source: string = ' ';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      binding.write('NEXT');
      expect(binding.read() === source).assertTrue();
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0135
     * @tc.desc binding-contract: operation sequence RRW over a mutable binding seeded with space.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0135', 0, () => {
      let source: string = ' ';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      expect(binding.read() === source).assertTrue();
      expect(binding.read() === source).assertTrue();
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0136
     * @tc.desc binding-contract: operation sequence WWR over a mutable binding seeded with space.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0136', 0, () => {
      let source: string = ' ';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      binding.write('NEXT');
      binding.write('NEXT');
      expect(binding.read() === source).assertTrue();
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0137
     * @tc.desc binding-contract: operation sequence WWW over a mutable binding seeded with space.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0137', 0, () => {
      let source: string = ' ';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      binding.write('NEXT');
      binding.write('NEXT');
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0138
     * @tc.desc binding-contract: operation sequence RRR over a mutable binding seeded with space.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0138', 0, () => {
      let source: string = ' ';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      expect(binding.read() === source).assertTrue();
      expect(binding.read() === source).assertTrue();
      expect(binding.read() === source).assertTrue();
      expect(source).assertEqual(' ');
      expect(binding.read()).assertEqual(' ');
      expect((source === ' ')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0139
     * @tc.desc binding-contract: operation sequence WRR over a mutable binding seeded with space.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0139', 0, () => {
      let source: string = ' ';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      binding.write('NEXT');
      expect(binding.read() === source).assertTrue();
      expect(binding.read() === source).assertTrue();
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0140
     * @tc.desc binding-contract: operation sequence RWW over a mutable binding seeded with space.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0140', 0, () => {
      let source: string = ' ';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      expect(binding.read() === source).assertTrue();
      binding.write('NEXT');
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0141
     * @tc.desc binding-contract: operation sequence RWR over a mutable binding seeded with ascii.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0141', 0, () => {
      let source: string = 'A';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      expect(binding.read() === source).assertTrue();
      binding.write('NEXT');
      expect(binding.read() === source).assertTrue();
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0142
     * @tc.desc binding-contract: operation sequence WRW over a mutable binding seeded with ascii.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0142', 0, () => {
      let source: string = 'A';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      binding.write('NEXT');
      expect(binding.read() === source).assertTrue();
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0143
     * @tc.desc binding-contract: operation sequence RRW over a mutable binding seeded with ascii.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0143', 0, () => {
      let source: string = 'A';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      expect(binding.read() === source).assertTrue();
      expect(binding.read() === source).assertTrue();
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0144
     * @tc.desc binding-contract: operation sequence WWR over a mutable binding seeded with ascii.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0144', 0, () => {
      let source: string = 'A';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      binding.write('NEXT');
      binding.write('NEXT');
      expect(binding.read() === source).assertTrue();
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0145
     * @tc.desc binding-contract: operation sequence WWW over a mutable binding seeded with ascii.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0145', 0, () => {
      let source: string = 'A';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      binding.write('NEXT');
      binding.write('NEXT');
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0146
     * @tc.desc binding-contract: operation sequence RRR over a mutable binding seeded with ascii.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0146', 0, () => {
      let source: string = 'A';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      expect(binding.read() === source).assertTrue();
      expect(binding.read() === source).assertTrue();
      expect(binding.read() === source).assertTrue();
      expect(source).assertEqual('A');
      expect(binding.read()).assertEqual('A');
      expect((source === 'A')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0147
     * @tc.desc binding-contract: operation sequence WRR over a mutable binding seeded with ascii.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0147', 0, () => {
      let source: string = 'A';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      binding.write('NEXT');
      expect(binding.read() === source).assertTrue();
      expect(binding.read() === source).assertTrue();
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0148
     * @tc.desc binding-contract: operation sequence RWW over a mutable binding seeded with ascii.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0148', 0, () => {
      let source: string = 'A';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      expect(binding.read() === source).assertTrue();
      binding.write('NEXT');
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0149
     * @tc.desc binding-contract: operation sequence RWR over a mutable binding seeded with word.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0149', 0, () => {
      let source: string = 'abc';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      expect(binding.read() === source).assertTrue();
      binding.write('NEXT');
      expect(binding.read() === source).assertTrue();
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0150
     * @tc.desc binding-contract: operation sequence WRW over a mutable binding seeded with word.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0150', 0, () => {
      let source: string = 'abc';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      binding.write('NEXT');
      expect(binding.read() === source).assertTrue();
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0151
     * @tc.desc binding-contract: operation sequence RRW over a mutable binding seeded with word.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0151', 0, () => {
      let source: string = 'abc';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      expect(binding.read() === source).assertTrue();
      expect(binding.read() === source).assertTrue();
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0152
     * @tc.desc binding-contract: operation sequence WWR over a mutable binding seeded with word.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0152', 0, () => {
      let source: string = 'abc';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      binding.write('NEXT');
      binding.write('NEXT');
      expect(binding.read() === source).assertTrue();
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0153
     * @tc.desc binding-contract: operation sequence WWW over a mutable binding seeded with word.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0153', 0, () => {
      let source: string = 'abc';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      binding.write('NEXT');
      binding.write('NEXT');
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0154
     * @tc.desc binding-contract: operation sequence RRR over a mutable binding seeded with word.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0154', 0, () => {
      let source: string = 'abc';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      expect(binding.read() === source).assertTrue();
      expect(binding.read() === source).assertTrue();
      expect(binding.read() === source).assertTrue();
      expect(source).assertEqual('abc');
      expect(binding.read()).assertEqual('abc');
      expect((source === 'abc')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0155
     * @tc.desc binding-contract: operation sequence WRR over a mutable binding seeded with word.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0155', 0, () => {
      let source: string = 'abc';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      binding.write('NEXT');
      expect(binding.read() === source).assertTrue();
      expect(binding.read() === source).assertTrue();
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0156
     * @tc.desc binding-contract: operation sequence RWW over a mutable binding seeded with word.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0156', 0, () => {
      let source: string = 'abc';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      expect(binding.read() === source).assertTrue();
      binding.write('NEXT');
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0157
     * @tc.desc binding-contract: operation sequence RWR over a mutable binding seeded with han.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0157', 0, () => {
      let source: string = '\u65b0';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      expect(binding.read() === source).assertTrue();
      binding.write('NEXT');
      expect(binding.read() === source).assertTrue();
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0158
     * @tc.desc binding-contract: operation sequence WRW over a mutable binding seeded with han.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0158', 0, () => {
      let source: string = '\u65b0';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      binding.write('NEXT');
      expect(binding.read() === source).assertTrue();
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0159
     * @tc.desc binding-contract: operation sequence RRW over a mutable binding seeded with han.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0159', 0, () => {
      let source: string = '\u65b0';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      expect(binding.read() === source).assertTrue();
      expect(binding.read() === source).assertTrue();
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0160
     * @tc.desc binding-contract: operation sequence WWR over a mutable binding seeded with han.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0160', 0, () => {
      let source: string = '\u65b0';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      binding.write('NEXT');
      binding.write('NEXT');
      expect(binding.read() === source).assertTrue();
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0161
     * @tc.desc binding-contract: operation sequence WWW over a mutable binding seeded with han.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0161', 0, () => {
      let source: string = '\u65b0';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      binding.write('NEXT');
      binding.write('NEXT');
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0162
     * @tc.desc binding-contract: operation sequence RRR over a mutable binding seeded with han.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0162', 0, () => {
      let source: string = '\u65b0';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      expect(binding.read() === source).assertTrue();
      expect(binding.read() === source).assertTrue();
      expect(binding.read() === source).assertTrue();
      expect(source).assertEqual('\u65b0');
      expect(binding.read()).assertEqual('\u65b0');
      expect((source === '\u65b0')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0163
     * @tc.desc binding-contract: operation sequence WRR over a mutable binding seeded with han.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0163', 0, () => {
      let source: string = '\u65b0';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      binding.write('NEXT');
      expect(binding.read() === source).assertTrue();
      expect(binding.read() === source).assertTrue();
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0164
     * @tc.desc binding-contract: operation sequence RWW over a mutable binding seeded with han.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0164', 0, () => {
      let source: string = '\u65b0';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      expect(binding.read() === source).assertTrue();
      binding.write('NEXT');
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0165
     * @tc.desc binding-contract: operation sequence RWR over a mutable binding seeded with han2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0165', 0, () => {
      let source: string = '\u65b0\u5e74';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      expect(binding.read() === source).assertTrue();
      binding.write('NEXT');
      expect(binding.read() === source).assertTrue();
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0166
     * @tc.desc binding-contract: operation sequence WRW over a mutable binding seeded with han2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0166', 0, () => {
      let source: string = '\u65b0\u5e74';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      binding.write('NEXT');
      expect(binding.read() === source).assertTrue();
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0167
     * @tc.desc binding-contract: operation sequence RRW over a mutable binding seeded with han2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0167', 0, () => {
      let source: string = '\u65b0\u5e74';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      expect(binding.read() === source).assertTrue();
      expect(binding.read() === source).assertTrue();
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0168
     * @tc.desc binding-contract: operation sequence WWR over a mutable binding seeded with han2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0168', 0, () => {
      let source: string = '\u65b0\u5e74';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      binding.write('NEXT');
      binding.write('NEXT');
      expect(binding.read() === source).assertTrue();
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0169
     * @tc.desc binding-contract: operation sequence WWW over a mutable binding seeded with han2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0169', 0, () => {
      let source: string = '\u65b0\u5e74';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      binding.write('NEXT');
      binding.write('NEXT');
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0170
     * @tc.desc binding-contract: operation sequence RRR over a mutable binding seeded with han2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0170', 0, () => {
      let source: string = '\u65b0\u5e74';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      expect(binding.read() === source).assertTrue();
      expect(binding.read() === source).assertTrue();
      expect(binding.read() === source).assertTrue();
      expect(source).assertEqual('\u65b0\u5e74');
      expect(binding.read()).assertEqual('\u65b0\u5e74');
      expect((source === '\u65b0\u5e74')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0171
     * @tc.desc binding-contract: operation sequence WRR over a mutable binding seeded with han2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0171', 0, () => {
      let source: string = '\u65b0\u5e74';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      binding.write('NEXT');
      expect(binding.read() === source).assertTrue();
      expect(binding.read() === source).assertTrue();
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0172
     * @tc.desc binding-contract: operation sequence RWW over a mutable binding seeded with han2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0172', 0, () => {
      let source: string = '\u65b0\u5e74';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      expect(binding.read() === source).assertTrue();
      binding.write('NEXT');
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0173
     * @tc.desc binding-contract: operation sequence RWR over a mutable binding seeded with wish.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0173', 0, () => {
      let source: string = '\u65b0\u5e74\u5feb\u4e50!';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      expect(binding.read() === source).assertTrue();
      binding.write('NEXT');
      expect(binding.read() === source).assertTrue();
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0174
     * @tc.desc binding-contract: operation sequence WRW over a mutable binding seeded with wish.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0174', 0, () => {
      let source: string = '\u65b0\u5e74\u5feb\u4e50!';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      binding.write('NEXT');
      expect(binding.read() === source).assertTrue();
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0175
     * @tc.desc binding-contract: operation sequence RRW over a mutable binding seeded with wish.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0175', 0, () => {
      let source: string = '\u65b0\u5e74\u5feb\u4e50!';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      expect(binding.read() === source).assertTrue();
      expect(binding.read() === source).assertTrue();
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0176
     * @tc.desc binding-contract: operation sequence WWR over a mutable binding seeded with wish.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0176', 0, () => {
      let source: string = '\u65b0\u5e74\u5feb\u4e50!';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      binding.write('NEXT');
      binding.write('NEXT');
      expect(binding.read() === source).assertTrue();
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0177
     * @tc.desc binding-contract: operation sequence WWW over a mutable binding seeded with wish.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0177', 0, () => {
      let source: string = '\u65b0\u5e74\u5feb\u4e50!';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      binding.write('NEXT');
      binding.write('NEXT');
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0178
     * @tc.desc binding-contract: operation sequence RRR over a mutable binding seeded with wish.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0178', 0, () => {
      let source: string = '\u65b0\u5e74\u5feb\u4e50!';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      expect(binding.read() === source).assertTrue();
      expect(binding.read() === source).assertTrue();
      expect(binding.read() === source).assertTrue();
      expect(source).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(binding.read()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect((source === '\u65b0\u5e74\u5feb\u4e50!')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0179
     * @tc.desc binding-contract: operation sequence WRR over a mutable binding seeded with wish.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0179', 0, () => {
      let source: string = '\u65b0\u5e74\u5feb\u4e50!';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      binding.write('NEXT');
      expect(binding.read() === source).assertTrue();
      expect(binding.read() === source).assertTrue();
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0180
     * @tc.desc binding-contract: operation sequence RWW over a mutable binding seeded with wish.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0180', 0, () => {
      let source: string = '\u65b0\u5e74\u5feb\u4e50!';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      expect(binding.read() === source).assertTrue();
      binding.write('NEXT');
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0181
     * @tc.desc binding-contract: operation sequence RWR over a mutable binding seeded with placeholder.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0181', 0, () => {
      let source: string = '\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      expect(binding.read() === source).assertTrue();
      binding.write('NEXT');
      expect(binding.read() === source).assertTrue();
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0182
     * @tc.desc binding-contract: operation sequence WRW over a mutable binding seeded with placeholder.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0182', 0, () => {
      let source: string = '\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      binding.write('NEXT');
      expect(binding.read() === source).assertTrue();
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0183
     * @tc.desc binding-contract: operation sequence RRW over a mutable binding seeded with placeholder.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0183', 0, () => {
      let source: string = '\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      expect(binding.read() === source).assertTrue();
      expect(binding.read() === source).assertTrue();
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0184
     * @tc.desc binding-contract: operation sequence WWR over a mutable binding seeded with placeholder.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0184', 0, () => {
      let source: string = '\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      binding.write('NEXT');
      binding.write('NEXT');
      expect(binding.read() === source).assertTrue();
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0185
     * @tc.desc binding-contract: operation sequence WWW over a mutable binding seeded with placeholder.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0185', 0, () => {
      let source: string = '\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      binding.write('NEXT');
      binding.write('NEXT');
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0186
     * @tc.desc binding-contract: operation sequence RRR over a mutable binding seeded with placeholder.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0186', 0, () => {
      let source: string = '\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      expect(binding.read() === source).assertTrue();
      expect(binding.read() === source).assertTrue();
      expect(binding.read() === source).assertTrue();
      expect(source).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(binding.read()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect((source === '\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0187
     * @tc.desc binding-contract: operation sequence WRR over a mutable binding seeded with placeholder.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0187', 0, () => {
      let source: string = '\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      binding.write('NEXT');
      expect(binding.read() === source).assertTrue();
      expect(binding.read() === source).assertTrue();
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0188
     * @tc.desc binding-contract: operation sequence RWW over a mutable binding seeded with placeholder.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0188', 0, () => {
      let source: string = '\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      expect(binding.read() === source).assertTrue();
      binding.write('NEXT');
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0189
     * @tc.desc binding-contract: operation sequence RWR over a mutable binding seeded with emoji.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0189', 0, () => {
      let source: string = '\ud83c\udf88';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      expect(binding.read() === source).assertTrue();
      binding.write('NEXT');
      expect(binding.read() === source).assertTrue();
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0190
     * @tc.desc binding-contract: operation sequence WRW over a mutable binding seeded with emoji.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0190', 0, () => {
      let source: string = '\ud83c\udf88';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      binding.write('NEXT');
      expect(binding.read() === source).assertTrue();
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0191
     * @tc.desc binding-contract: operation sequence RRW over a mutable binding seeded with emoji.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0191', 0, () => {
      let source: string = '\ud83c\udf88';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      expect(binding.read() === source).assertTrue();
      expect(binding.read() === source).assertTrue();
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0192
     * @tc.desc binding-contract: operation sequence WWR over a mutable binding seeded with emoji.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0192', 0, () => {
      let source: string = '\ud83c\udf88';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      binding.write('NEXT');
      binding.write('NEXT');
      expect(binding.read() === source).assertTrue();
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0193
     * @tc.desc binding-contract: operation sequence WWW over a mutable binding seeded with emoji.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0193', 0, () => {
      let source: string = '\ud83c\udf88';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      binding.write('NEXT');
      binding.write('NEXT');
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0194
     * @tc.desc binding-contract: operation sequence RRR over a mutable binding seeded with emoji.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0194', 0, () => {
      let source: string = '\ud83c\udf88';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      expect(binding.read() === source).assertTrue();
      expect(binding.read() === source).assertTrue();
      expect(binding.read() === source).assertTrue();
      expect(source).assertEqual('\ud83c\udf88');
      expect(binding.read()).assertEqual('\ud83c\udf88');
      expect((source === '\ud83c\udf88')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0195
     * @tc.desc binding-contract: operation sequence WRR over a mutable binding seeded with emoji.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0195', 0, () => {
      let source: string = '\ud83c\udf88';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      binding.write('NEXT');
      expect(binding.read() === source).assertTrue();
      expect(binding.read() === source).assertTrue();
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0196
     * @tc.desc binding-contract: operation sequence RWW over a mutable binding seeded with emoji.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0196', 0, () => {
      let source: string = '\ud83c\udf88';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      expect(binding.read() === source).assertTrue();
      binding.write('NEXT');
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0197
     * @tc.desc binding-contract: operation sequence RWR over a mutable binding seeded with emoji-han.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0197', 0, () => {
      let source: string = '\ud83c\udf88 \u65b0\u5e74';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      expect(binding.read() === source).assertTrue();
      binding.write('NEXT');
      expect(binding.read() === source).assertTrue();
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0198
     * @tc.desc binding-contract: operation sequence WRW over a mutable binding seeded with emoji-han.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0198', 0, () => {
      let source: string = '\ud83c\udf88 \u65b0\u5e74';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      binding.write('NEXT');
      expect(binding.read() === source).assertTrue();
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0199
     * @tc.desc binding-contract: operation sequence RRW over a mutable binding seeded with emoji-han.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0199', 0, () => {
      let source: string = '\ud83c\udf88 \u65b0\u5e74';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      expect(binding.read() === source).assertTrue();
      expect(binding.read() === source).assertTrue();
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0200
     * @tc.desc binding-contract: operation sequence WWR over a mutable binding seeded with emoji-han.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0200', 0, () => {
      let source: string = '\ud83c\udf88 \u65b0\u5e74';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      binding.write('NEXT');
      binding.write('NEXT');
      expect(binding.read() === source).assertTrue();
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0201
     * @tc.desc binding-contract: operation sequence WWW over a mutable binding seeded with emoji-han.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0201', 0, () => {
      let source: string = '\ud83c\udf88 \u65b0\u5e74';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      binding.write('NEXT');
      binding.write('NEXT');
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0202
     * @tc.desc binding-contract: operation sequence RRR over a mutable binding seeded with emoji-han.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0202', 0, () => {
      let source: string = '\ud83c\udf88 \u65b0\u5e74';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      expect(binding.read() === source).assertTrue();
      expect(binding.read() === source).assertTrue();
      expect(binding.read() === source).assertTrue();
      expect(source).assertEqual('\ud83c\udf88 \u65b0\u5e74');
      expect(binding.read()).assertEqual('\ud83c\udf88 \u65b0\u5e74');
      expect((source === '\ud83c\udf88 \u65b0\u5e74')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0203
     * @tc.desc binding-contract: operation sequence WRR over a mutable binding seeded with emoji-han.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0203', 0, () => {
      let source: string = '\ud83c\udf88 \u65b0\u5e74';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      binding.write('NEXT');
      expect(binding.read() === source).assertTrue();
      expect(binding.read() === source).assertTrue();
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0204
     * @tc.desc binding-contract: operation sequence RWW over a mutable binding seeded with emoji-han.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0204', 0, () => {
      let source: string = '\ud83c\udf88 \u65b0\u5e74';
      const binding: GetterSetterBinding = new GetterSetterBinding(() => source, (value: string) => { source = value; });
      expect(binding.read() === source).assertTrue();
      binding.write('NEXT');
      binding.write('NEXT');
      expect(source).assertEqual('NEXT');
      expect(binding.read()).assertEqual('NEXT');
      expect((source === 'NEXT')).assertTrue();
    });

    /**
     * @tc.name BindingContractTest_case_0205
     * @tc.desc binding-contract: counting binding keeps read/write accounting for empty.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0205', 0, () => {
      const binding: CountingBinding = new CountingBinding();
      binding.write('');
      expect(binding.read()).assertEqual('');
      expect(binding.read()).assertEqual('');
      expect(binding.writes).assertEqual(1);
      expect(binding.reads).assertEqual(2);
      expect(binding.store).assertEqual('');
    });

    /**
     * @tc.name BindingContractTest_case_0206
     * @tc.desc binding-contract: counting binding keeps read/write accounting for space.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0206', 0, () => {
      const binding: CountingBinding = new CountingBinding();
      binding.write(' ');
      expect(binding.read()).assertEqual(' ');
      expect(binding.read()).assertEqual(' ');
      expect(binding.writes).assertEqual(1);
      expect(binding.reads).assertEqual(2);
      expect(binding.store).assertEqual(' ');
    });

    /**
     * @tc.name BindingContractTest_case_0207
     * @tc.desc binding-contract: counting binding keeps read/write accounting for ascii.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0207', 0, () => {
      const binding: CountingBinding = new CountingBinding();
      binding.write('A');
      expect(binding.read()).assertEqual('A');
      expect(binding.read()).assertEqual('A');
      expect(binding.writes).assertEqual(1);
      expect(binding.reads).assertEqual(2);
      expect(binding.store).assertEqual('A');
    });

    /**
     * @tc.name BindingContractTest_case_0208
     * @tc.desc binding-contract: counting binding keeps read/write accounting for word.
     * @tc.type Function
     * @tc.level Level1
     */
    it('BindingContractTest_case_0208', 0, () => {
      const binding: CountingBinding = new CountingBinding();
      binding.write('abc');
      expect(binding.read()).assertEqual('abc');
      expect(binding.read()).assertEqual('abc');
      expect(binding.writes).assertEqual(1);
      expect(binding.reads).assertEqual(2);
      expect(binding.store).assertEqual('abc');
    });

  });
}
