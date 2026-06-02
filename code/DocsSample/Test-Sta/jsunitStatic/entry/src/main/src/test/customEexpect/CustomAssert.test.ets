'use static';
/**
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

/**
 * arkXtest框架支持自定义断言
 * 支持版本 since 1.0.18 版本
 */

import { Assert, beforeAll,afterAll, describe, expect, Hypium, it } from '../../../../hypium/index';
// custom.ets
interface customAssert extends Assert {
  // 自定义断言声明
  myAssertEqual(expectValue: boolean): void;
}

interface R {
  pass: boolean,
  message: string
}

//自定义断言实现
let myAssertEqual: (actualValue: boolean, expectValue: boolean) => R = (actualValue: boolean, expectValue: boolean): R => {
  let result: R = {
    pass: true,
    message: 'just is a msg'
  }

  let compare: () => R = (): R => {
    if (expectValue === actualValue) {
      result.pass = true;
      result.message = '';
    } else {
      result.pass = false;
      result.message = 'expectValue !== actualValue!';
    }
    return result;
  }
  result = compare();
  return result;
}

export default function customAssertTest(): void {
  describe('customAssertTest', (): void => {
    beforeAll((): void => {
      //注册自定义断言，只有先注册才可以使用
      Hypium.registerAssert(myAssertEqual);
    })

    afterAll((): void => {
      //注册自定义断言，只有先注册才可以使用
      Hypium.unregisterAssert(myAssertEqual);
    })

    it('assertContain1', 0, (): void => {
      let a: boolean = true;
      let b: boolean = true;
      (expect(a) as customAssert).myAssertEqual(b);
      Hypium.unregisterAssert(myAssertEqual);
    })
    it('assertContain2', 0, (): void => {
      Hypium.registerAssert(myAssertEqual);
      let a: boolean = true;
      let b: boolean = true;
      (expect(a) as customAssert).myAssertEqual(b);
      // 注销自定义断言，注销以后就无法使用
      Hypium.unregisterAssert(myAssertEqual);
      try {
        (expect(a) as customAssert).myAssertEqual(b);
      } catch (e) {
        expect(e.message).assertEqual('myAssertEqual is unregistered');
      }
    })
  })
}