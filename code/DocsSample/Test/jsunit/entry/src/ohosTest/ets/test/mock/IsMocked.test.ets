/*
* Copyright (c) 2025 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License")
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

// [Start isMocked_sample]
import { describe, expect, it, MockKit, when } from '@ohos/hypium';

class ClassName {
  constructor() {
  }
  count = 0;
  method_1(arg: string) {
    return '888888';
  }
}

export default function isMockedTest() {
  describe('isMockedTest', () => {
    it('isMocked_method', 0, () => {
      // 1.创建一个Mock能力的对象MockKit
      let mocker: MockKit = new MockKit();
      // 2.创建一个对象claser
      let claser: ClassName = new ClassName();
      // 3.进行Mock操作，对ClassName类的method_1函数进行Mock并设置桩行为
      let mockfunc: Function = mocker.mockFunc(claser, claser.method_1);
      when(mockfunc)('test').afterReturn('1');
      // 4.查询method_1是否处于Mock状态，返回true
      expect(mocker.isMocked(claser, 'method_1')).assertTrue();
      // 5.clear还原后查询，返回false
      mocker.clear(claser);
      expect(mocker.isMocked(claser, 'method_1')).assertFalse();
    })

    it('isMocked_property', 0, () => {
      // 1.创建一个Mock能力的对象MockKit
      let mocker: MockKit = new MockKit();
      // 2.创建一个对象claser
      let claser: ClassName = new ClassName();
      // 3.Mock ClassName对象的成员变量count
      mocker.mockProperty(claser, "count", 999);
      // 4.查询count是否处于Mock状态，返回true
      expect(mocker.isMocked(claser, 'count')).assertTrue();
      // 5.ignoreMock还原后查询，返回false
      mocker.ignoreMock(claser, "count");
      expect(mocker.isMocked(claser, 'count')).assertFalse();
    })
  })
}

// [End isMocked_sample]