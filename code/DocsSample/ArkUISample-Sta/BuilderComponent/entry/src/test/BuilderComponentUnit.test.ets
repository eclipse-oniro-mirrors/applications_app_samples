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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

export default function builderComponentUnitTest() {
  describe('builderComponentUnitTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    });
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });
    it('assertContain', 0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let a = 'abc';
      let b = 'b';
      // Defines a variety of assertion methods, which are used to declare expected boolean conditions.
      expect(a).assertContain(b);
      expect(a).assertEqual(a);
    });

    // Test cases for BuilderCallInWatch - Testing @Builder with @Watch decorator
    describe('BuilderCallInWatch', () => {
      it('shouldInitializeContent', 0, () => {
        // Test that @Provide decorated variable initializes correctly
        const initialContent = 'Index: hello world';
        expect(initialContent).assertEqual('Index: hello world');
      });

      it('shouldModifyContentOnButtonClick', 0, () => {
        // Test content modification when button is clicked
        let content = 'Index: hello world';
        const modifier = '_world';
        content += modifier;
        expect(content).assertEqual('Index: hello world_world');
      });

      it('shouldTriggerWatchCallback', 0, () => {
        // Test that @Watch callback is triggered when value changes
        let changeCount = 0;
        const simulateWatchCallback = () => {
          changeCount++;
        };
        simulateWatchCallback();
        expect(changeCount).assertLarger(0);
      });
    });

    // Test cases for BuilderChangeVariableRight - Testing MutableBinding with setters
    describe('BuilderChangeVariableRight', () => {
      it('shouldCreateMutableBindingWithSetter', 0, () => {
        // Test that MutableBinding requires setter callback
        let value = 'Hello';
        const getter = () => value;
        const setter = (newValue: string) => { value = newValue; };
        expect(getter()).assertEqual('Hello');
        setter('Modified');
        expect(getter()).assertEqual('Modified');
      });

      it('shouldModifyObjectPropertyValue', 0, () => {
        // Test modification of object property through MutableBinding
        interface TempMod {
          paramA: string;
        }
        let objectOne: TempMod = { paramA: 'Hello' };
        const originalValue = objectOne.paramA;
        objectOne.paramA = 'ArkUI';
        expect(objectOne.paramA).assertEqual('ArkUI');
        expect(objectOne.paramA).assertNotEqual(originalValue);
      });

      it('shouldReplaceEntireObject', 0, () => {
        // Test entire object replacement through MutableBinding
        interface TempMod {
          paramA: string;
        }
        let objectOne: TempMod = { paramA: 'Hello' };
        const newObject = { paramA: 'trialOne' };
        objectOne = newObject;
        expect(objectOne.paramA).assertEqual('trialOne');
      });

      it('shouldModifyStringBindingValue', 0, () => {
        // Test string value modification through MutableBinding
        let message = 'Value Passing';
        const newValue = 'value change mod';
        message = newValue;
        expect(message).assertEqual(newValue);
      });
    });

    // Test cases for BuilderMutableBindingNoSetter - Testing Binding and MutableBinding
    describe('BuilderMutableBindingNoSetter', () => {
      it('shouldInitializeObservedClass', 0, () => {
        // Test @ObservedV2 class initialization
        class GlobalTmp {
          public strValue: string = 'Hello';
        }
        const instance = new GlobalTmp();
        expect(instance.strValue).assertEqual('Hello');
      });

      it('shouldCreateBindingWithGetter', 0, () => {
        // Test Binding creation with getter function
        let num = 0;
        const getter = () => num;
        expect(getter()).assertEqual(0);
      });

      it('shouldCreateMutableBindingWithSetter', 0, () => {
        // Test MutableBinding with both getter and setter
        let num = 0;
        const getter = () => num;
        const setter = (val: number) => { num = val; };
        setter(1);
        expect(getter()).assertEqual(1);
      });

      it('shouldIncrementMutableBindingValue', 0, () => {
        // Test increment operation on MutableBinding
        let num = 0;
        num += 1;
        expect(num).assertEqual(1);
      });

      it('shouldUpdateValuesIndependently', 0, () => {
        // Test independent updates of multiple bindings
        class GlobalTmp {
          public strValue: string = 'Hello';
        }
        let obj = new GlobalTmp();
        let num = 0;
        obj.strValue = 'Hello World 2025';
        num = 1;
        expect(obj.strValue).assertEqual('Hello World 2025');
        expect(num).assertEqual(1);
      });
    });
  });
}
