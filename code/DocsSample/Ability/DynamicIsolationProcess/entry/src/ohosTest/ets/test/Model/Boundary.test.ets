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


import { describe, beforeAll, afterAll, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  SAMPLE_BUNDLE, SAMPLE_MODULE, MAIN_ABILITY, ISOLATED_ABILITY, ISOLATION_KEY, KEY_MAX_LENGTH, NAME_MAX_LENGTH, STATE_CREATED, STATE_FOREGROUND, STATE_BACKGROUND, STATE_DESTROYED, ERROR_SUCCESS, ERROR_INVALID_PARAM, ERROR_WANT_INVALID, ERROR_CONTEXT_MISSING, IsolationModel, IsolationWant
} from '../Shared/IsolationFixtures';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_DynamicIsolationProcess]';

export default function dynamicIsolationProcessBoundaryTest(): void {
  describe('DynamicIsolationProcessModelTestBoundary', (): void => {
    beforeAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynamicIsolationProcessBoundaryTest started');
    });
    afterAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynamicIsolationProcessBoundaryTest finished');
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_BOUNDARY_0001
    // @tc.name      dynamicIsolationProcessBoundaryCase001
    // @tc.desc      Verify isolation key length boundary at 0. (parameterised matrix part 1).
    it('dynamicIsolationProcessBoundaryCase001', 0, (): void => {
      {
        const key: string = '';
        const result: boolean = IsolationModel.isValidIsolationKey(key);
        expect(result).assertFalse();
      }
      {
        const key: string = 'a';
        const result: boolean = IsolationModel.isValidIsolationKey(key);
        expect(result).assertTrue();
      }
      {
        const key: string = 'aa';
        const result: boolean = IsolationModel.isValidIsolationKey(key);
        expect(result).assertTrue();
      }
      {
        const key: string = 'aaa';
        const result: boolean = IsolationModel.isValidIsolationKey(key);
        expect(result).assertTrue();
      }
      {
        const key: string = 'aaaa';
        const result: boolean = IsolationModel.isValidIsolationKey(key);
        expect(result).assertTrue();
      }
      {
        const key: string = 'aaaaa';
        const result: boolean = IsolationModel.isValidIsolationKey(key);
        expect(result).assertTrue();
      }
      {
        const key: string = 'aaaaaa';
        const result: boolean = IsolationModel.isValidIsolationKey(key);
        expect(result).assertTrue();
      }
      {
        const key: string = 'aaaaaaa';
        const result: boolean = IsolationModel.isValidIsolationKey(key);
        expect(result).assertTrue();
      }
      {
        const key: string = 'aaaaaaaaaaaaaaaa';
        const result: boolean = IsolationModel.isValidIsolationKey(key);
        expect(result).assertTrue();
      }
      {
        const key: string = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
        const result: boolean = IsolationModel.isValidIsolationKey(key);
        expect(result).assertTrue();
      }
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_BOUNDARY_0002
    // @tc.name      dynamicIsolationProcessBoundaryCase002
    // @tc.desc      Verify isolation key length boundary at 63. (parameterised matrix part 2).
    it('dynamicIsolationProcessBoundaryCase002', 0, (): void => {
      {
        const key: string = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
        const result: boolean = IsolationModel.isValidIsolationKey(key);
        expect(result).assertTrue();
      }
      {
        const key: string = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
        const result: boolean = IsolationModel.isValidIsolationKey(key);
        expect(result).assertTrue();
      }
      {
        const key: string = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
        const result: boolean = IsolationModel.isValidIsolationKey(key);
        expect(result).assertFalse();
      }
      {
        const key: string = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
        const result: boolean = IsolationModel.isValidIsolationKey(key);
        expect(result).assertFalse();
      }
      {
        const key: string = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
        const result: boolean = IsolationModel.isValidIsolationKey(key);
        expect(result).assertFalse();
      }
      {
        const name: string = 'a.b';
        const result: boolean = IsolationModel.isValidBundleName(name);
        expect(result).assertTrue();
      }
      {
        const name: string = 'a.b';
        const result: boolean = IsolationModel.isValidBundleName(name);
        expect(result).assertTrue();
      }
      {
        const name: string = 'a.b';
        const result: boolean = IsolationModel.isValidBundleName(name);
        expect(result).assertTrue();
      }
      {
        const name: string = 'a.bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb';
        const result: boolean = IsolationModel.isValidBundleName(name);
        expect(result).assertTrue();
      }
      {
        const name: string = 'a.bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb';
        const result: boolean = IsolationModel.isValidBundleName(name);
        expect(result).assertTrue();
      }
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_BOUNDARY_0003
    // @tc.name      dynamicIsolationProcessBoundaryCase003
    // @tc.desc      Verify bundle name length boundary at 129. (parameterised matrix part 3).
    it('dynamicIsolationProcessBoundaryCase003', 0, (): void => {
      {
        const name: string = 'a.bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb';
        const result: boolean = IsolationModel.isValidBundleName(name);
        expect(result).assertFalse();
      }
      {
        const name: string = 'a.bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb';
        const result: boolean = IsolationModel.isValidBundleName(name);
        expect(result).assertFalse();
      }
      {
        const keys: Array<string> = [];
        const result: number = IsolationModel.contextCount(keys);
        expect(result).assertEqual(0);
      }
      {
        const keys: Array<string> = ['test0'];
        const result: number = IsolationModel.contextCount(keys);
        expect(result).assertEqual(1);
      }
      {
        const keys: Array<string> = ['test0', 'test1'];
        const result: number = IsolationModel.contextCount(keys);
        expect(result).assertEqual(2);
      }
      {
        const keys: Array<string> = ['test0', 'test1', 'test2'];
        const result: number = IsolationModel.contextCount(keys);
        expect(result).assertEqual(3);
      }
      {
        const keys: Array<string> = ['test0', 'test1', 'test2', 'test3'];
        const result: number = IsolationModel.contextCount(keys);
        expect(result).assertEqual(4);
      }
      {
        const keys: Array<string> = ['test0', 'test1', 'test2', 'test3', 'test4'];
        const result: number = IsolationModel.contextCount(keys);
        expect(result).assertEqual(5);
      }
      {
        const keys: Array<string> = ['test0', 'test1', 'test2', 'test3', 'test4', 'test5'];
        const result: number = IsolationModel.contextCount(keys);
        expect(result).assertEqual(6);
      }
      {
        const keys: Array<string> = ['test0', 'test1', 'test2', 'test3', 'test4', 'test5', 'test6'];
        const result: number = IsolationModel.contextCount(keys);
        expect(result).assertEqual(7);
      }
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_BOUNDARY_0004
    // @tc.name      dynamicIsolationProcessBoundaryCase004
    // @tc.desc      Verify context count for 8 keys. (parameterised matrix part 4).
    it('dynamicIsolationProcessBoundaryCase004', 0, (): void => {
      {
        const keys: Array<string> = ['test0', 'test1', 'test2', 'test3', 'test4', 'test5', 'test6', 'test7'];
        const result: number = IsolationModel.contextCount(keys);
        expect(result).assertEqual(8);
      }
      {
        const keys: Array<string> = ['test0', 'test1', 'test2', 'test3', 'test4', 'test5', 'test6', 'test7', 'test8'];
        const result: number = IsolationModel.contextCount(keys);
        expect(result).assertEqual(9);
      }
      {
        const keys: Array<string> = ['test0', 'test1', 'test2', 'test3', 'test4', 'test5', 'test6', 'test7', 'test8', 'test9'];
        const result: number = IsolationModel.contextCount(keys);
        expect(result).assertEqual(10);
      }
      {
        const keys: Array<string> = ['test0', 'test1', 'test2', 'test3', 'test4', 'test5', 'test6', 'test7', 'test8', 'test9', 'test10'];
        const result: number = IsolationModel.contextCount(keys);
        expect(result).assertEqual(11);
      }
    });

  });
}
