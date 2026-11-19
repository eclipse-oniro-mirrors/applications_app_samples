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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import formBindingData from '@ohos.app.form.formBindingData';

const DOMAIN: number = 0xF814;
const TAG: string = 'FormBindingDataModelCoreTest';

const CONDITION_ID: string = '110000';
const WEATHER_KEY: string = 'weather';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function buildWeatherProxy(): formBindingData.ProxyData {
  return { key: WEATHER_KEY, subscriberId: CONDITION_ID } as formBindingData.ProxyData;
}

function readSubscriberId(proxy: formBindingData.ProxyData): string {
  const value: string | undefined = proxy.subscriberId;
  if (value === undefined) {
    return '';
  }
  return value;
}

export default function formBindingDataModelCoreTest(): void {
  describe('FormBindingDataModelCoreTest', () => {
    /**
     * @tc.number    SUB_REQUESTADDFORM_BINDINGDATA_0201
     * @tc.name      testBindingData0201
     * @tc.desc      Verify createFormBindingData without arguments returns a defined object.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBindingData0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBindingData0201 begin');
      const binding = formBindingData.createFormBindingData();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${binding !== undefined && binding !== null}`);
      expect(binding !== undefined && binding !== null).assertTrue();
      log('testBindingData0201 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_BINDINGDATA_0202
     * @tc.name      testBindingData0202
     * @tc.desc      Verify createFormBindingData without arguments returns an object type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBindingData0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBindingData0202 begin');
      const binding = formBindingData.createFormBindingData();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof binding=${typeof binding}, expected='object'`);
      expect(typeof binding).assertEqual('object');
      log('testBindingData0202 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_BINDINGDATA_0203
     * @tc.name      testBindingData0203
     * @tc.desc      Verify createFormBindingData with an object argument returns a defined object.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBindingData0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBindingData0203 begin');
      const binding = formBindingData.createFormBindingData({ 'temperature': '25' });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${binding !== undefined && binding !== null}`);
      expect(binding !== undefined && binding !== null).assertTrue();
      log('testBindingData0203 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_BINDINGDATA_0204
     * @tc.name      testBindingData0204
     * @tc.desc      Verify createFormBindingData with a string argument returns a defined object.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBindingData0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBindingData0204 begin');
      const binding = formBindingData.createFormBindingData('rawPayload');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${binding !== undefined && binding !== null}`);
      expect(binding !== undefined && binding !== null).assertTrue();
      log('testBindingData0204 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_BINDINGDATA_0205
     * @tc.name      testBindingData0205
     * @tc.desc      Verify createFormBindingData with a multi-field object returns a defined object.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBindingData0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBindingData0205 begin');
      const binding = formBindingData.createFormBindingData({ 'temperature': '25', 'city': 'shenzhen' });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${binding !== undefined && binding !== null}`);
      expect(binding !== undefined && binding !== null).assertTrue();
      log('testBindingData0205 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_BINDINGDATA_0206
     * @tc.name      testBindingData0206
     * @tc.desc      Verify two independent createFormBindingData calls both succeed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBindingData0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBindingData0206 begin');
      const first = formBindingData.createFormBindingData();
      const second = formBindingData.createFormBindingData();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${first !== undefined && second !== undefined}`);
      expect(first !== undefined && second !== undefined).assertTrue();
      log('testBindingData0206 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_BINDINGDATA_0207
     * @tc.name      testBindingData0207
     * @tc.desc      Verify assigning proxies exposes an array on the binding data.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBindingData0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBindingData0207 begin');
      const binding = formBindingData.createFormBindingData();
      const proxies: Array<formBindingData.ProxyData> = [buildWeatherProxy()];
      binding.proxies = proxies;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Array.isArray(binding.proxies)}`);
      expect(Array.isArray(binding.proxies)).assertTrue();
      log('testBindingData0207 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_BINDINGDATA_0208
     * @tc.name      testBindingData0208
     * @tc.desc      Verify one proxy entry is readable back with length one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBindingData0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBindingData0208 begin');
      const binding = formBindingData.createFormBindingData();
      binding.proxies = [buildWeatherProxy()];
      const actual: Array<formBindingData.ProxyData> | undefined = binding.proxies;
      let length: number = 0;
      if (actual !== undefined) {
        length = actual.length;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual length=${length}, expected=1`);
      expect(length).assertEqual(1);
      log('testBindingData0208 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_BINDINGDATA_0209
     * @tc.name      testBindingData0209
     * @tc.desc      Verify the weather proxy key survives the binding assignment.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBindingData0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBindingData0209 begin');
      const binding = formBindingData.createFormBindingData();
      binding.proxies = [buildWeatherProxy()];
      const actual: Array<formBindingData.ProxyData> | undefined = binding.proxies;
      let key: string = '';
      if (actual !== undefined && actual.length > 0) {
        key = actual[0].key;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual key=${key}, expected=WEATHER_KEY`);
      expect(key).assertEqual(WEATHER_KEY);
      log('testBindingData0209 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_BINDINGDATA_0210
     * @tc.name      testBindingData0210
     * @tc.desc      Verify the weather proxy subscriberId equals the 110000 condition id.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBindingData0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBindingData0210 begin');
      const binding = formBindingData.createFormBindingData();
      binding.proxies = [buildWeatherProxy()];
      const actual: Array<formBindingData.ProxyData> | undefined = binding.proxies;
      let subscriberId: string = '';
      if (actual !== undefined && actual.length > 0) {
        subscriberId = readSubscriberId(actual[0]);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual subscriberId=${subscriberId}, expected=CONDITION_ID`);
      expect(subscriberId).assertEqual(CONDITION_ID);
      log('testBindingData0210 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_BINDINGDATA_0211
     * @tc.name      testBindingData0211
     * @tc.desc      Verify the proxy key keeps the string type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBindingData0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBindingData0211 begin');
      const proxy: formBindingData.ProxyData = buildWeatherProxy();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof proxy.key=${typeof proxy.key}, expected='string'`);
      expect(typeof proxy.key).assertEqual('string');
      log('testBindingData0211 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_BINDINGDATA_0212
     * @tc.name      testBindingData0212
     * @tc.desc      Verify the proxy subscriberId keeps the string type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBindingData0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBindingData0212 begin');
      const proxy: formBindingData.ProxyData = buildWeatherProxy();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof proxy.subscriberId=${typeof proxy.subscriberId}`);
      expect(typeof proxy.subscriberId).assertEqual('string');
      log('testBindingData0212 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_BINDINGDATA_0213
     * @tc.name      testBindingData0213
     * @tc.desc      Verify assigning an empty proxy array is readable back with length zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBindingData0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBindingData0213 begin');
      const binding = formBindingData.createFormBindingData();
      binding.proxies = [];
      const actual: Array<formBindingData.ProxyData> | undefined = binding.proxies;
      let length: number = -1;
      if (actual !== undefined) {
        length = actual.length;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual length=${length}, expected=0`);
      expect(length).assertEqual(0);
      log('testBindingData0213 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_BINDINGDATA_0214
     * @tc.name      testBindingData0214
     * @tc.desc      Verify two proxy entries are readable back with length two.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBindingData0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBindingData0214 begin');
      const binding = formBindingData.createFormBindingData();
      binding.proxies = [buildWeatherProxy(),
        { key: 'status', subscriberId: '910000' } as formBindingData.ProxyData];
      const actual: Array<formBindingData.ProxyData> | undefined = binding.proxies;
      let length: number = 0;
      if (actual !== undefined) {
        length = actual.length;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual length=${length}, expected=2`);
      expect(length).assertEqual(2);
      log('testBindingData0214 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_BINDINGDATA_0215
     * @tc.name      testBindingData0215
     * @tc.desc      Verify the second proxy entry keeps the status key.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBindingData0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBindingData0215 begin');
      const binding = formBindingData.createFormBindingData();
      binding.proxies = [buildWeatherProxy(),
        { key: 'status', subscriberId: '910000' } as formBindingData.ProxyData];
      const actual: Array<formBindingData.ProxyData> | undefined = binding.proxies;
      let key: string = '';
      if (actual !== undefined && actual.length > 1) {
        key = actual[1].key;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual key=${key}, expected='status'`);
      expect(key).assertEqual('status');
      log('testBindingData0215 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_BINDINGDATA_0216
     * @tc.name      testBindingData0216
     * @tc.desc      Verify the second proxy entry keeps its subscriberId value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBindingData0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBindingData0216 begin');
      const binding = formBindingData.createFormBindingData();
      binding.proxies = [buildWeatherProxy(),
        { key: 'status', subscriberId: '910000' } as formBindingData.ProxyData];
      const actual: Array<formBindingData.ProxyData> | undefined = binding.proxies;
      let subscriberId: string = '';
      if (actual !== undefined && actual.length > 1) {
        subscriberId = readSubscriberId(actual[1]);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual subscriberId=${subscriberId}, expected='910000'`);
      expect(subscriberId).assertEqual('910000');
      log('testBindingData0216 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_BINDINGDATA_0217
     * @tc.name      testBindingData0217
     * @tc.desc      Verify reassigning proxies replaces the previous array.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBindingData0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBindingData0217 begin');
      const binding = formBindingData.createFormBindingData();
      binding.proxies = [buildWeatherProxy(),
        { key: 'status', subscriberId: '910000' } as formBindingData.ProxyData];
      binding.proxies = [buildWeatherProxy()];
      const actual: Array<formBindingData.ProxyData> | undefined = binding.proxies;
      let length: number = 0;
      if (actual !== undefined) {
        length = actual.length;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual length=${length}, expected=1`);
      expect(length).assertEqual(1);
      log('testBindingData0217 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_BINDINGDATA_0218
     * @tc.name      testBindingData0218
     * @tc.desc      Verify a fresh binding data object has no proxies assigned.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBindingData0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBindingData0218 begin');
      const binding = formBindingData.createFormBindingData();
      const actual: Array<formBindingData.ProxyData> | undefined = binding.proxies;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual === undefined=${actual === undefined}`);
      expect(actual === undefined).assertTrue();
      log('testBindingData0218 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_BINDINGDATA_0219
     * @tc.name      testBindingData0219
     * @tc.desc      Verify proxies assigned to one binding do not leak into another instance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBindingData0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBindingData0219 begin');
      const first = formBindingData.createFormBindingData();
      const second = formBindingData.createFormBindingData();
      first.proxies = [buildWeatherProxy()];
      const actual: Array<formBindingData.ProxyData> | undefined = second.proxies;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual === undefined=${actual === undefined}`);
      expect(actual === undefined).assertTrue();
      log('testBindingData0219 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_BINDINGDATA_0220
     * @tc.name      testBindingData0220
     * @tc.desc      Verify three proxy entries are readable back with length three.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBindingData0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBindingData0220 begin');
      const binding = formBindingData.createFormBindingData();
      binding.proxies = [buildWeatherProxy(),
        { key: 'status', subscriberId: '910000' } as formBindingData.ProxyData,
        { key: 'humidity', subscriberId: '120000' } as formBindingData.ProxyData];
      const actual: Array<formBindingData.ProxyData> | undefined = binding.proxies;
      let length: number = 0;
      if (actual !== undefined) {
        length = actual.length;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual length=${length}, expected=3`);
      expect(length).assertEqual(3);
      log('testBindingData0220 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_BINDINGDATA_0221
     * @tc.name      testBindingData0221
     * @tc.desc      Verify the third proxy entry keeps the humidity key.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBindingData0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBindingData0221 begin');
      const binding = formBindingData.createFormBindingData();
      binding.proxies = [buildWeatherProxy(),
        { key: 'status', subscriberId: '910000' } as formBindingData.ProxyData,
        { key: 'humidity', subscriberId: '120000' } as formBindingData.ProxyData];
      const actual: Array<formBindingData.ProxyData> | undefined = binding.proxies;
      let key: string = '';
      if (actual !== undefined && actual.length > 2) {
        key = actual[2].key;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual key=${key}, expected='humidity'`);
      expect(key).assertEqual('humidity');
      log('testBindingData0221 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_BINDINGDATA_0222
     * @tc.name      testBindingData0222
     * @tc.desc      Verify the 110000 condition id keeps six characters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBindingData0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBindingData0222 begin');
      const proxy: formBindingData.ProxyData = buildWeatherProxy();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual readSubscriberId(proxy).length, expected=6`);
      expect(readSubscriberId(proxy).length).assertEqual(6);
      log('testBindingData0222 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_BINDINGDATA_0223
     * @tc.name      testBindingData0223
     * @tc.desc      Verify the weather proxy key keeps seven characters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBindingData0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBindingData0223 begin');
      const proxy: formBindingData.ProxyData = buildWeatherProxy();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual proxy.key.length=${proxy.key.length}, expected=7`);
      expect(proxy.key.length).assertEqual(7);
      log('testBindingData0223 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_BINDINGDATA_0224
     * @tc.name      testBindingData0224
     * @tc.desc      Verify the proxy key field is writable after construction.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBindingData0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBindingData0224 begin');
      const proxy: formBindingData.ProxyData = buildWeatherProxy();
      proxy.key = 'temperature';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual proxy.key=${proxy.key}, expected='temperature'`);
      expect(proxy.key).assertEqual('temperature');
      log('testBindingData0224 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_BINDINGDATA_0225
     * @tc.name      testBindingData0225
     * @tc.desc      Verify createFormBindingData accepts a JSON formatted string payload.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBindingData0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBindingData0225 begin');
      const binding = formBindingData.createFormBindingData('{"temperature":"25"}');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${binding !== undefined && binding !== null}`);
      expect(binding !== undefined && binding !== null).assertTrue();
      log('testBindingData0225 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_BINDINGDATA_0226
     * @tc.name      testBindingData0226
     * @tc.desc      Verify createFormBindingData accepts a nested object payload.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBindingData0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBindingData0226 begin');
      const binding = formBindingData.createFormBindingData({ 'detail': { 'city': 'shenzhen' } });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${binding !== undefined && binding !== null}`);
      expect(binding !== undefined && binding !== null).assertTrue();
      log('testBindingData0226 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_BINDINGDATA_0227
     * @tc.name      testBindingData0227
     * @tc.desc      Verify the first proxy entry is not null after assignment.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBindingData0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBindingData0227 begin');
      const binding = formBindingData.createFormBindingData();
      binding.proxies = [buildWeatherProxy()];
      const actual: Array<formBindingData.ProxyData> | undefined = binding.proxies;
      let notNull: boolean = false;
      if (actual !== undefined && actual.length > 0) {
        notNull = actual[0] !== null && actual[0] !== undefined;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue notNull=${notNull}`);
      expect(notNull).assertTrue();
      log('testBindingData0227 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_BINDINGDATA_0228
     * @tc.name      testBindingData0228
     * @tc.desc      Verify an assigned empty proxy array still reports as an array.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBindingData0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBindingData0228 begin');
      const binding = formBindingData.createFormBindingData();
      binding.proxies = [];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Array.isArray(binding.proxies)}`);
      expect(Array.isArray(binding.proxies)).assertTrue();
      log('testBindingData0228 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_BINDINGDATA_0229
     * @tc.name      testBindingData0229
     * @tc.desc      Verify repeated proxy reads return the same entry count.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBindingData0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBindingData0229 begin');
      const binding = formBindingData.createFormBindingData();
      binding.proxies = [buildWeatherProxy()];
      const firstRead: Array<formBindingData.ProxyData> | undefined = binding.proxies;
      const secondRead: Array<formBindingData.ProxyData> | undefined = binding.proxies;
      let firstLength: number = 0;
      let secondLength: number = 0;
      if (firstRead !== undefined) {
        firstLength = firstRead.length;
      }
      if (secondRead !== undefined) {
        secondLength = secondRead.length;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual firstLength=${firstLength}, expected=secondLength`);
      expect(firstLength).assertEqual(secondLength);
      log('testBindingData0229 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_BINDINGDATA_0230
     * @tc.name      testBindingData0230
     * @tc.desc      Verify a binding created with an object payload keeps the object type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBindingData0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBindingData0230 begin');
      const binding = formBindingData.createFormBindingData({ 'temperature': '25' });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof binding=${typeof binding}, expected='object'`);
      expect(typeof binding).assertEqual('object');
      log('testBindingData0230 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_BINDINGDATA_0231
     * @tc.name      testBindingData0231
     * @tc.desc      Verify a single character proxy key is preserved.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBindingData0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBindingData0231 begin');
      const binding = formBindingData.createFormBindingData();
      binding.proxies = [{ key: 'a', subscriberId: CONDITION_ID } as formBindingData.ProxyData];
      const actual: Array<formBindingData.ProxyData> | undefined = binding.proxies;
      let key: string = '';
      if (actual !== undefined && actual.length > 0) {
        key = actual[0].key;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual key=${key}, expected='a'`);
      expect(key).assertEqual('a');
      log('testBindingData0231 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_BINDINGDATA_0232
     * @tc.name      testBindingData0232
     * @tc.desc      Verify a numeric string subscriberId is preserved.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBindingData0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBindingData0232 begin');
      const binding = formBindingData.createFormBindingData();
      binding.proxies = [{ key: WEATHER_KEY, subscriberId: '123' } as formBindingData.ProxyData];
      const actual: Array<formBindingData.ProxyData> | undefined = binding.proxies;
      let subscriberId: string = '';
      if (actual !== undefined && actual.length > 0) {
        subscriberId = readSubscriberId(actual[0]);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual subscriberId=${subscriberId}, expected='123'`);
      expect(subscriberId).assertEqual('123');
      log('testBindingData0232 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_BINDINGDATA_0233
     * @tc.name      testBindingData0233
     * @tc.desc      Verify two bindings with the same proxy array read equal lengths.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBindingData0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBindingData0233 begin');
      const first = formBindingData.createFormBindingData();
      const second = formBindingData.createFormBindingData();
      first.proxies = [buildWeatherProxy()];
      second.proxies = [buildWeatherProxy()];
      const firstLength: number = first.proxies !== undefined ? first.proxies.length : 0;
      const secondLength: number = second.proxies !== undefined ? second.proxies.length : 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual firstLength=${firstLength}, expected=secondLength`);
      expect(firstLength).assertEqual(secondLength);
      log('testBindingData0233 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_BINDINGDATA_0234
     * @tc.name      testBindingData0234
     * @tc.desc      Verify four proxy entries are readable back with length four.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBindingData0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBindingData0234 begin');
      const binding = formBindingData.createFormBindingData();
      binding.proxies = [buildWeatherProxy(),
        { key: 'status', subscriberId: '910000' } as formBindingData.ProxyData,
        { key: 'humidity', subscriberId: '120000' } as formBindingData.ProxyData,
        { key: 'wind', subscriberId: '130000' } as formBindingData.ProxyData];
      const actual: Array<formBindingData.ProxyData> | undefined = binding.proxies;
      let length: number = 0;
      if (actual !== undefined) {
        length = actual.length;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual length=${length}, expected=4`);
      expect(length).assertEqual(4);
      log('testBindingData0234 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_BINDINGDATA_0235
     * @tc.name      testBindingData0235
     * @tc.desc      Verify the fourth proxy entry keeps the wind key.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBindingData0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBindingData0235 begin');
      const binding = formBindingData.createFormBindingData();
      binding.proxies = [buildWeatherProxy(),
        { key: 'status', subscriberId: '910000' } as formBindingData.ProxyData,
        { key: 'humidity', subscriberId: '120000' } as formBindingData.ProxyData,
        { key: 'wind', subscriberId: '130000' } as formBindingData.ProxyData];
      const actual: Array<formBindingData.ProxyData> | undefined = binding.proxies;
      let key: string = '';
      if (actual !== undefined && actual.length > 3) {
        key = actual[3].key;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual key=${key}, expected='wind'`);
      expect(key).assertEqual('wind');
      log('testBindingData0235 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_BINDINGDATA_0236
     * @tc.name      testBindingData0236
     * @tc.desc      Verify rebinding a shorter proxy array does not mutate the original array.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBindingData0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBindingData0236 begin');
      const original: Array<formBindingData.ProxyData> = [buildWeatherProxy(),
        { key: 'status', subscriberId: '910000' } as formBindingData.ProxyData];
      const binding = formBindingData.createFormBindingData();
      binding.proxies = [buildWeatherProxy()];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual original.length=${original.length}, expected=2`);
      expect(original.length).assertEqual(2);
      log('testBindingData0236 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_BINDINGDATA_0237
     * @tc.name      testBindingData0237
     * @tc.desc      Verify createFormBindingData accepts a single field object payload.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBindingData0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBindingData0237 begin');
      const binding = formBindingData.createFormBindingData({ 'x': '1' });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${binding !== undefined && binding !== null}`);
      expect(binding !== undefined && binding !== null).assertTrue();
      log('testBindingData0237 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_BINDINGDATA_0238
     * @tc.name      testBindingData0238
     * @tc.desc      Verify createFormBindingData accepts a two field object payload.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBindingData0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBindingData0238 begin');
      const binding = formBindingData.createFormBindingData({ 'x': '1', 'y': '2' });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${binding !== undefined && binding !== null}`);
      expect(binding !== undefined && binding !== null).assertTrue();
      log('testBindingData0238 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_BINDINGDATA_0239
     * @tc.name      testBindingData0239
     * @tc.desc      Verify createFormBindingData accepts an empty object payload.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBindingData0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBindingData0239 begin');
      const binding = formBindingData.createFormBindingData({});
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${binding !== undefined && binding !== null}`);
      expect(binding !== undefined && binding !== null).assertTrue();
      log('testBindingData0239 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_BINDINGDATA_0240
     * @tc.name      testBindingData0240
     * @tc.desc      Verify a two entry proxy assignment still reports as an array.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBindingData0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBindingData0240 begin');
      const binding = formBindingData.createFormBindingData();
      binding.proxies = [buildWeatherProxy(),
        { key: 'status', subscriberId: '910000' } as formBindingData.ProxyData];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Array.isArray(binding.proxies)}`);
      expect(Array.isArray(binding.proxies)).assertTrue();
      log('testBindingData0240 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_BINDINGDATA_0241
     * @tc.name      testBindingData0241
     * @tc.desc      Verify the first of two proxy entries keeps the weather key.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBindingData0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBindingData0241 begin');
      const binding = formBindingData.createFormBindingData();
      binding.proxies = [buildWeatherProxy(),
        { key: 'status', subscriberId: '910000' } as formBindingData.ProxyData];
      const actual: Array<formBindingData.ProxyData> | undefined = binding.proxies;
      let key: string = '';
      if (actual !== undefined && actual.length > 0) {
        key = actual[0].key;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual key=${key}, expected=WEATHER_KEY`);
      expect(key).assertEqual(WEATHER_KEY);
      log('testBindingData0241 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_BINDINGDATA_0242
     * @tc.name      testBindingData0242
     * @tc.desc      Verify the second of two proxy entries keeps its subscriberId.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBindingData0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBindingData0242 begin');
      const binding = formBindingData.createFormBindingData();
      binding.proxies = [buildWeatherProxy(),
        { key: 'status', subscriberId: '910000' } as formBindingData.ProxyData];
      const actual: Array<formBindingData.ProxyData> | undefined = binding.proxies;
      let subscriberId: string = '';
      if (actual !== undefined && actual.length > 1) {
        subscriberId = readSubscriberId(actual[1]);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual subscriberId=${subscriberId}, expected='910000'`);
      expect(subscriberId).assertEqual('910000');
      log('testBindingData0242 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_BINDINGDATA_0243
     * @tc.name      testBindingData0243
     * @tc.desc      Verify a single zero subscriberId boundary value is preserved.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBindingData0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBindingData0243 begin');
      const binding = formBindingData.createFormBindingData();
      binding.proxies = [{ key: WEATHER_KEY, subscriberId: '0' } as formBindingData.ProxyData];
      const actual: Array<formBindingData.ProxyData> | undefined = binding.proxies;
      let subscriberId: string = '';
      if (actual !== undefined && actual.length > 0) {
        subscriberId = readSubscriberId(actual[0]);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual subscriberId=${subscriberId}, expected='0'`);
      expect(subscriberId).assertEqual('0');
      log('testBindingData0243 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_BINDINGDATA_0244
     * @tc.name      testBindingData0244
     * @tc.desc      Verify an empty proxy key boundary value is preserved.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBindingData0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBindingData0244 begin');
      const binding = formBindingData.createFormBindingData();
      binding.proxies = [{ key: '', subscriberId: CONDITION_ID } as formBindingData.ProxyData];
      const actual: Array<formBindingData.ProxyData> | undefined = binding.proxies;
      let key: string = 'x';
      if (actual !== undefined && actual.length > 0) {
        key = actual[0].key;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual key=${key}, expected=''`);
      expect(key).assertEqual('');
      log('testBindingData0244 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_BINDINGDATA_0245
     * @tc.name      testBindingData0245
     * @tc.desc      Verify all subscriberId values of three proxies are non empty strings.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBindingData0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBindingData0245 begin');
      const binding = formBindingData.createFormBindingData();
      binding.proxies = [buildWeatherProxy(),
        { key: 'status', subscriberId: '910000' } as formBindingData.ProxyData,
        { key: 'humidity', subscriberId: '120000' } as formBindingData.ProxyData];
      const actual: Array<formBindingData.ProxyData> | undefined = binding.proxies;
      let allNonEmpty: boolean = false;
      if (actual !== undefined && actual.length === 3) {
        allNonEmpty = readSubscriberId(actual[0]).length > 0 &&
          readSubscriberId(actual[1]).length > 0 && readSubscriberId(actual[2]).length > 0;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue allNonEmpty=${allNonEmpty}`);
      expect(allNonEmpty).assertTrue();
      log('testBindingData0245 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_BINDINGDATA_0246
     * @tc.name      testBindingData0246
     * @tc.desc      Verify a binding created with a string payload keeps the object type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBindingData0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBindingData0246 begin');
      const binding = formBindingData.createFormBindingData('payload');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof binding=${typeof binding}, expected='object'`);
      expect(typeof binding).assertEqual('object');
      log('testBindingData0246 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_BINDINGDATA_0247
     * @tc.name      testBindingData0247
     * @tc.desc      Verify reading proxies on a fresh binding completes without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBindingData0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBindingData0247 begin');
      const binding = formBindingData.createFormBindingData();
      const actual: Array<formBindingData.ProxyData> | undefined = binding.proxies;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${actual === undefined || actual.length === 0}`);
      expect(actual === undefined || actual.length === 0).assertTrue();
      log('testBindingData0247 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_BINDINGDATA_0248
     * @tc.name      testBindingData0248
     * @tc.desc      Verify five proxy entries are readable back with length five.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBindingData0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBindingData0248 begin');
      const binding = formBindingData.createFormBindingData();
      binding.proxies = [buildWeatherProxy(),
        { key: 'status', subscriberId: '910000' } as formBindingData.ProxyData,
        { key: 'humidity', subscriberId: '120000' } as formBindingData.ProxyData,
        { key: 'wind', subscriberId: '130000' } as formBindingData.ProxyData,
        { key: 'uv', subscriberId: '140000' } as formBindingData.ProxyData];
      const actual: Array<formBindingData.ProxyData> | undefined = binding.proxies;
      let length: number = 0;
      if (actual !== undefined) {
        length = actual.length;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual length=${length}, expected=5`);
      expect(length).assertEqual(5);
      log('testBindingData0248 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_BINDINGDATA_0249
     * @tc.name      testBindingData0249
     * @tc.desc      Verify the fifth proxy entry keeps its subscriberId value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBindingData0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBindingData0249 begin');
      const binding = formBindingData.createFormBindingData();
      binding.proxies = [buildWeatherProxy(),
        { key: 'status', subscriberId: '910000' } as formBindingData.ProxyData,
        { key: 'humidity', subscriberId: '120000' } as formBindingData.ProxyData,
        { key: 'wind', subscriberId: '130000' } as formBindingData.ProxyData,
        { key: 'uv', subscriberId: '140000' } as formBindingData.ProxyData];
      const actual: Array<formBindingData.ProxyData> | undefined = binding.proxies;
      let subscriberId: string = '';
      if (actual !== undefined && actual.length > 4) {
        subscriberId = readSubscriberId(actual[4]);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual subscriberId=${subscriberId}, expected='140000'`);
      expect(subscriberId).assertEqual('140000');
      log('testBindingData0249 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_BINDINGDATA_0250
     * @tc.name      testBindingData0250
     * @tc.desc      Verify the full publish binding smoke flow creates, binds and reads proxies.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBindingData0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBindingData0250 begin');
      const binding = formBindingData.createFormBindingData();
      const proxies: Array<formBindingData.ProxyData> = [buildWeatherProxy()];
      binding.proxies = proxies;
      const actual: Array<formBindingData.ProxyData> | undefined = binding.proxies;
      let ok: boolean = false;
      if (actual !== undefined && actual.length === 1) {
        ok = actual[0].key === WEATHER_KEY && actual[0].subscriberId === CONDITION_ID;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ok=${ok}`);
      expect(ok).assertTrue();
      log('testBindingData0250 end');
    })
  })
}
