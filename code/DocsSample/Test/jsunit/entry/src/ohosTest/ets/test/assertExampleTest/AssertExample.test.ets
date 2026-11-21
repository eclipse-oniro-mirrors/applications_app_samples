/*
 * Copyright (c) 2023-2024 Huawei Device Co., Ltd.
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

/*
* | No.  | API                | 功能说明                                                     |
* | :--- | :------------------| ------------------------------------------------------------|
* | 1    | assertClose        | 检验actualvalue和expectvalue(0)的接近程度是否是expectValue(1)。 |
* | 2    | assertContain      | 检验actualvalue中是否包含expectvalue。                       |
* | 3    | assertEqual        | 检验actualvalue是否等于expectvalue[0]。                      |
* | 4    | assertFail         | 抛出一个错误。                                               |
* | 5    | assertFalse        | 检验actualvalue是否是false。                                 |
* | 6    | assertTrue         | 检验actualvalue是否是true。                                  |
* | 7    | assertInstanceOf   | 检验actualvalue是否是expectvalue类型。                       |
* | 8    | assertLarger       | 检验actualvalue是否大于expectvalue。                         |
* | 9    | assertLess         | 检验actualvalue是否小于expectvalue。                         |
* | 10   | assertNull         | 检验actualvalue是否是null。                                  |
* | 11   | assertThrowError   | 检验actualvalue抛出Error内容是否是expectValue。              |
* | 12   | assertUndefined    | 检验actualvalue是否是undefined。                             |
* | 13   | assertNaN          | @since1.0.4 检验actualvalue是否是NaN                        |
* | 14   | assertNegUnlimited | @since1.0.4 检验actualvalue是否等于Number.NEGATIVE_INFINITY             |
* | 15   | assertPosUnlimited | @since1.0.4 检验actualvalue是否等于Number.POSITIVE_INFINITY            |
* | 16   | assertDeepEquals   | @since1.0.4 检验actualvalue和expectvalue(0)是否是同一个对象               |
* | 17   | assertPromiseIsPending | @since1.0.4 判断promise是否处于Pending状态。                         |
* | 18   | assertPromiseIsRejected | @since1.0.4 判断promise是否处于Rejected状态。                       |
* | 19   | assertPromiseIsRejectedWith | @since1.0.4 判断promise是否处于Rejected状态，并且比较执行的结果值。|
* | 20   | assertPromiseIsRejectedWithError | @since1.0.4 比较拒绝异常的类型和message值。 |
* | 21   | assertPromiseIsResolved | @since1.0.4 判断promise是否处于Resolved状态。                       |
* | 22   | assertPromiseIsResolvedWith | @since1.0.4 判断promise是否处于Resolved状态，并且比较执行的结果值。|
* | 23   | not                | @since1.0.4 断言取反,支持上面所有的断言功能                                 |
*
 */

// [Start assert_sample]
import { paceTurn } from '../TestPace';
import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { AssertionObservation, LocalExpectService, observeAssertion } from '../AssertionObservation';

export default function exampleTest(): void {
  describe('ExampleTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number testJsunitAssertClose0001
     * @tc.name testJsunitAssertClose0001
     * @tc.desc Retain the relative tolerance example and check a genuinely rejected tighter tolerance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitAssertClose0001', Level.LEVEL1, (): void => {
      // Hypium uses relative error: |100-99|/100 = 0.01, therefore the original 0.1 passes.
      hilog.info(0x0000, 'AssertObserve', 'actual=100 expected=99 precision=0.1');
      expect(100).assertClose(99, 0.1);
      const failure: AssertionObservation = observeAssertion((service: LocalExpectService): void => {
        hilog.info(0x0000, 'AssertObserve', 'actual=100 expected=99 precision=0.001');
        service.expect(100).assertClose(99, 0.001);
      });
      hilog.info(0x0000, 'AssertObserve', 'rejected tolerance error name=%{public}s', failure.name);
      expect(failure.name).assertEqual('AssertException');
      hilog.info(0x0000, 'AssertObserve', 'rejected tolerance error message=%{public}s', failure.message);
      expect(failure.message).assertEqual('|100 - 99|/100 is not less than 0.001');
      hilog.info(0x0000, 'AssertObserve', 'failure reported=%{public}s', String(failure.reported));
      expect(failure.reported).assertTrue();
    });

    /**
     * @tc.number testJsunitAssertContain0004
     * @tc.name testJsunitAssertContain0004
     * @tc.desc Combine string and array membership with present and absent elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitAssertContain0004', Level.LEVEL1, (): void => {
      const text: string = 'abc';
      const values: number[] = [1, 2, 3];
      hilog.info(0x0000, 'AssertExample', 'text=abc present=b absent=z; array=[1,2,3] present=1 absent=4');
      expect(text).assertContain('b');
      hilog.info(0x0000, 'AssertExample', 'array=%{public}s expected member=1', JSON.stringify(values));
      expect(values).assertContain(1);
      hilog.info(0x0000, 'AssertExample', 'text=%{public}s expected absent=z', text);
      expect(text).not().assertContain('z');
      hilog.info(0x0000, 'AssertExample', 'array=%{public}s expected absent=4', JSON.stringify(values));
      expect(values).not().assertContain(4);
    });

    /**
     * @tc.number testJsunitAssertScalar0005
     * @tc.name testJsunitAssertScalar0005
     * @tc.desc Combine equality and strict or inclusive ordering with distinct operands
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitAssertScalar0005', Level.LEVEL1, (): void => {
      const sum: number = 1 + 2;
      hilog.info(0x0000, 'AssertExample', 'sum=%{public}d larger=5>2 less=2<3 inclusive=4>=4,6<=6', sum);
      expect(sum).assertEqual(3);
      hilog.info(0x0000, 'AssertExample', 'actual=5 expected greater than=2');
      expect(5).assertLarger(2);
      hilog.info(0x0000, 'AssertExample', 'actual=2 expected less than=3');
      expect(2).assertLess(3);
      hilog.info(0x0000, 'AssertExample', 'actual=4 expected greater than or equal=4');
      expect(4).assertLargerOrEqual(4);
      hilog.info(0x0000, 'AssertExample', 'actual=6 expected less than or equal=6');
      expect(6).assertLessOrEqual(6);
      hilog.info(0x0000, 'AssertExample', 'actual number=%{public}d expected unequal to string=3', sum);
      expect(sum).not().assertEqual('3');
    });

    /**
     * @tc.number testJsunitAssertFailure0002
     * @tc.name testJsunitAssertFailure0002
     * @tc.desc Observe the explicit Hypium failure instead of failing or skipping the demonstration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitAssertFailure0002', Level.LEVEL1, (): void => {
      const failure: AssertionObservation = observeAssertion((service: LocalExpectService): void => {
        hilog.info(0x0000, 'AssertObserve', 'explicit failure without actual value');
        service.expect().assertFail();
      });
      hilog.info(0x0000, 'AssertObserve', 'explicit failure name=%{public}s', failure.name);
      expect(failure.name).assertEqual('AssertException');
      hilog.info(0x0000, 'AssertObserve', 'explicit failure message=%{public}s', failure.message);
      expect(failure.message).assertEqual('fail ');
      hilog.info(0x0000, 'AssertObserve', 'explicit failure reported=%{public}s', String(failure.reported));
      expect(failure.reported).assertTrue();
    });

    /**
     * @tc.number testJsunitAssertBooleanType0006
     * @tc.name testJsunitAssertBooleanType0006
     * @tc.desc Assert membership outcomes and the original String type with a negative type check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitAssertBooleanType0006', Level.LEVEL1, (): void => {
      const present: boolean = 'abc'.includes('b');
      const absent: boolean = [1, 2, 3].includes(4);
      const text: string = 'strTest';
      hilog.info(0x0000, 'AssertExample', 'present=%{public}s absent=%{public}s type input=%{public}s',
        String(present), String(absent), text);
      expect(present).assertTrue();
      hilog.info(0x0000, 'AssertExample', 'array=[1,2,3] member=4 result=%{public}s expected=false', String(absent));
      expect(absent).assertFalse();
      hilog.info(0x0000, 'AssertExample', 'actual=%{public}s expected type=String', text);
      expect(text).assertInstanceOf('String');
      hilog.info(0x0000, 'AssertExample', 'actual=%{public}s expected not type=Number', text);
      expect(text).not().assertInstanceOf('Number');
    });

    /**
     * @tc.number testJsunitAssertSpecial0007
     * @tc.name testJsunitAssertSpecial0007
     * @tc.desc Combine null, missing, NaN and signed infinity results from distinct operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitAssertSpecial0007', Level.LEVEL1, (): void => {
      const parsed: Object | null = JSON.parse('null') as Object | null;
      const values: Map<string, number> = new Map<string, number>();
      const missing: number | undefined = values.get('missing');
      const invalid: number = Number('not a number');
      const negative: number = -Number.MAX_VALUE * 2;
      const positive: number = Number.MAX_VALUE * 2;
      hilog.info(0x0000, 'AssertExample', 'null=%{public}s missing=%{public}s NaN=%{public}s infinities=%{public}s',
        String(parsed), String(missing), String(invalid), `${negative},${positive}`);
      expect(parsed).assertNull();
      hilog.info(0x0000, 'AssertExample', 'map key=missing result=%{public}s expected=undefined', String(missing));
      expect(missing).assertUndefined();
      hilog.info(0x0000, 'AssertExample', 'Number(not a number)=%{public}s expected=NaN', String(invalid));
      expect(invalid).assertNaN();
      hilog.info(0x0000, 'AssertExample', '-MAX_VALUE*2=%{public}s expected=-Infinity', String(negative));
      expect(negative).assertNegUnlimited();
      hilog.info(0x0000, 'AssertExample', 'MAX_VALUE*2=%{public}s expected=Infinity', String(positive));
      expect(positive).assertPosUnlimited();
    });

    /**
     * @tc.number testJsunitAssertThrow0008
     * @tc.name testJsunitAssertThrow0008
     * @tc.desc Match the original Error and require a recorded failure for a wrong expected message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitAssertThrow0008', Level.LEVEL1, (): void => {
      const action: () => void = (): void => {
        throw new Error('test');
      };
      hilog.info(0x0000, 'AssertExample', 'throw Error(test); matching message=test');
      expect(action).assertThrowError('test');
      const failure: AssertionObservation = observeAssertion((service: LocalExpectService): void => {
        hilog.info(0x0000, 'AssertExample', 'action throws Error(test); expected message=other');
        service.expect(action).assertThrowError('other');
      });
      hilog.info(0x0000, 'AssertExample', 'wrong message name=%{public}s reported=%{public}s',
        failure.name, String(failure.reported));
      expect(failure.name).assertEqual('AssertException');
      hilog.info(0x0000, 'AssertExample', 'wrong message diagnostic=%{public}s', failure.message);
      expect(failure.message).assertEqual('expected throw failed , test is not other');
      hilog.info(0x0000, 'AssertExample', 'wrong message reported=%{public}s expected=true', String(failure.reported));
      expect(failure.reported).assertTrue();
    });

    /**
     * @tc.number testJsunitAssertDeep0009
     * @tc.name testJsunitAssertDeep0009
     * @tc.desc Preserve null, array, map, object and regex comparison and detect changed content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitAssertDeep0009', Level.LEVEL1, (): void => {
      const parsed: Object | null = JSON.parse('null') as Object | null;
      const empty: number[] = [];
      const otherEmpty: number[] = [];
      const first: Map<number, number> = new Map<number, number>();
      const second: Map<number, number> = new Map<number, number>();
      first.set(1, 100);
      first.set(2, 200);
      second.set(1, 100);
      second.set(2, 200);
      const object: SampleTest = { x: 1 };
      const otherObject: SampleTest = { x: 1 };
      const regex: RegExp = new RegExp('/test/');
      const otherRegex: RegExp = new RegExp('/test/');
      hilog.info(0x0000, 'AssertExample', 'deep inputs: parsed null, empty arrays, map entries, x=1 and /test/');
      expect(parsed).assertDeepEquals(null);
      hilog.info(0x0000, 'AssertExample', 'array=%{public}s expected=%{public}s',
        JSON.stringify(empty), JSON.stringify(otherEmpty));
      expect(empty).assertDeepEquals(otherEmpty);
      hilog.info(0x0000, 'AssertExample', 'map=%{public}s expected=%{public}s',
        JSON.stringify(Array.from(first.entries())), JSON.stringify(Array.from(second.entries())));
      expect(first).assertDeepEquals(second);
      hilog.info(0x0000, 'AssertExample', 'object=%{public}s expected=%{public}s',
        JSON.stringify(object), JSON.stringify(otherObject));
      expect(object).assertDeepEquals(otherObject);
      hilog.info(0x0000, 'AssertExample', 'regex=%{public}s expected=%{public}s',
        regex.toString(), otherRegex.toString());
      expect(regex).assertDeepEquals(otherRegex);
      second.set(2, 201);
      otherObject.x = 2;
      hilog.info(0x0000, 'AssertExample', 'map=%{public}s expected different=%{public}s',
        JSON.stringify(Array.from(first.entries())), JSON.stringify(Array.from(second.entries())));
      expect(first).not().assertDeepEquals(second);
      hilog.info(0x0000, 'AssertExample', 'object=%{public}s expected different=%{public}s',
        JSON.stringify(object), JSON.stringify(otherObject));
      expect(object).not().assertDeepEquals(otherObject);
      hilog.info(0x0000, 'AssertExample', 'regex=%{public}s expected different pattern=/other/', regex.toString());
      expect(regex).not().assertDeepEquals(new RegExp('/other/'));
    });

    /**
     * @tc.number testJsunitAssertPromiseResolve0010
     * @tc.name testJsunitAssertPromiseResolve0010
     * @tc.desc Observe pending-to-resolved transition and the original resolved value example
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitAssertPromiseResolve0010', Level.LEVEL1, async (): Promise<void> => {
      let finish: (value: string) => void = (value: string): void => {};
      const pending: Promise<string> = new Promise<string>((resolve: (value: string) => void): void => {
        finish = resolve;
      });
      try {
        hilog.info(0x0000, 'AssertExample', 'deferred promise before resolve');
        await expect(pending).assertPromiseIsPending();
        const info: PromiseInfo = { res: 'result value' };
        const resolved: Promise<PromiseInfo> = Promise.resolve(info);
        const expected: PromiseInfo = { res: 'result value' };
        hilog.info(0x0000, 'AssertExample', 'separate promise resolves to result value');
        await expect(resolved).assertPromiseIsResolved();
        hilog.info(0x0000, 'AssertExample', 'resolved input=%{public}s expected=%{public}s',
          JSON.stringify(info), JSON.stringify(expected));
        await expect(resolved).assertPromiseIsResolvedWith(expected);
        finish('completed');
        hilog.info(0x0000, 'AssertExample', 'deferred promise after resolve=completed');
        await expect(pending).assertPromiseIsResolvedWith('completed');
      } finally {
        finish('cleanup');
      }
    });

    /**
     * @tc.number testJsunitAssertPromiseReject0011
     * @tc.name testJsunitAssertPromiseReject0011
     * @tc.desc Combine original rejection state, rejection value and typed Error examples
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitAssertPromiseReject0011', Level.LEVEL1, async (): Promise<void> => {
      const no: PromiseInfo = { res: 'no' };
      const value: PromiseInfo = { res: 'reject value' };
      const expected: PromiseInfo = { res: 'reject value' };
      hilog.info(0x0000, 'AssertExample', 'rejection inputs: no, reject value, TypeError(number)');
      await expect(Promise.reject(no)).assertPromiseIsRejected();
      hilog.info(0x0000, 'AssertExample', 'rejection input=%{public}s expected=%{public}s',
        JSON.stringify(value), JSON.stringify(expected));
      await expect(Promise.reject(value)).assertPromiseIsRejectedWith(expected);
      hilog.info(0x0000, 'AssertExample', 'rejection input=TypeError(number) expected type=TypeError message=number');
      await expect(Promise.reject(new TypeError('number'))).assertPromiseIsRejectedWithError(TypeError, 'number');
    });

    /**
     * @tc.number testJsunitAssertMessage0003
     * @tc.name testJsunitAssertMessage0003
     * @tc.desc Preserve unequal operands and verify assertion error plus the custom diagnostic message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitAssertMessage0003', Level.LEVEL1, (): void => {
      const failure: AssertionObservation = observeAssertion((service: LocalExpectService): void => {
        hilog.info(0x0000, 'AssertObserve', 'actual=1 expected=2 message=1 is not equal 2!');
        service.expect(1).message('1 is not equal 2!').assertEqual(2);
      });
      hilog.info(0x0000, 'AssertObserve', 'unequal operands error name=%{public}s', failure.name);
      expect(failure.name).assertEqual('AssertException');
      hilog.info(0x0000, 'AssertObserve', 'unequal operands error message=%{public}s', failure.message);
      expect(failure.message).assertEqual('expect 1 equals 2');
      hilog.info(0x0000, 'AssertObserve', 'custom diagnostic=%{public}s', failure.userMessage);
      expect(failure.userMessage).assertEqual('1 is not equal 2!');
      hilog.info(0x0000, 'AssertObserve', 'unequal operands reported=%{public}s', String(failure.reported));
      expect(failure.reported).assertTrue();
    });
  });
}

interface SampleTest {
  x: number;
}

interface PromiseInfo {
  res: string;
}

// [End assert_sample]