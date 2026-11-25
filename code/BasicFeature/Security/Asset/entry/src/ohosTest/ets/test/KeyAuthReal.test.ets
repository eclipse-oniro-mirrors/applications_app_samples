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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { addAssetPromise, removeAssetPromise, preQueryAssetPromise, queryAuthAssetPromise,
  postQueryAssetPromise, queryAssetPromise } from '../../../main/ets/model/AssetModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Asset]';

export default function keyAuthReal() {
  describe('KeyAuthRealTest', () => {
    /**
     * @tc.number SUB_ASSET_KEYAUTH_0301
     * @tc.name testKeyAuth0301
     * @tc.desc 合法值：preQuery 已保存账号不抛异常且两次结果均为 Uint8Array（PIN 弹窗路径降级覆盖）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testKeyAuth0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0301 begin');
      const alias: string = 'uAuth0301';
      await addAssetPromise(alias, 'pwd0301', 'l1');
      let thrown: boolean = false;
      let challenge: Uint8Array = new Uint8Array(0);
      try {
        challenge = await preQueryAssetPromise(alias);
      } catch (error) {
        thrown = true;
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(thrown), 'false');
      expect(thrown).assertFalse();
      expect(challenge instanceof Uint8Array).assertTrue();
      const again: Uint8Array = await preQueryAssetPromise(alias);
      expect(again instanceof Uint8Array).assertTrue();
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0301 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYAUTH_0302
     * @tc.name testKeyAuth0302
     * @tc.desc 合法值：preQuery 不存在账号与空账号结果一致且均为 Uint8Array
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testKeyAuth0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0302 begin');
      let thrown: boolean = false;
      let none: Uint8Array = new Uint8Array(0);
      let empty: Uint8Array = new Uint8Array(0);
      try {
        none = await preQueryAssetPromise('uAuth0302_not_exist');
        empty = await preQueryAssetPromise('');
      } catch (error) {
        thrown = true;
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(thrown), 'false');
      expect(thrown).assertFalse();
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', none.length, empty.length);
      expect(none.length).assertEqual(empty.length);
      expect(none instanceof Uint8Array).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0302 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYAUTH_0303
     * @tc.name testKeyAuth0303
     * @tc.desc 边界值：preQuery 空账号返回空挑战
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyAuth0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0303 begin');
      const challenge: Uint8Array = await preQueryAssetPromise('');
      expect(challenge instanceof Uint8Array).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', challenge.length, 0);
      expect(challenge.length).assertEqual(0);
      expect(challenge.byteLength).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0303 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYAUTH_0304
     * @tc.name testKeyAuth0304
     * @tc.desc 边界值：preQuery 不存在账号返回空挑战且不抛异常
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyAuth0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0304 begin');
      let thrown: boolean = false;
      let challenge: Uint8Array = new Uint8Array(0);
      try {
        challenge = await preQueryAssetPromise('uAuth0304_not_exist');
      } catch (error) {
        thrown = true;
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(thrown), 'false');
      expect(thrown).assertFalse();
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', challenge.length, 0);
      expect(challenge.length).assertEqual(0);
      expect(challenge instanceof Uint8Array).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0304 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYAUTH_0305
     * @tc.name testKeyAuth0305
     * @tc.desc 极值：preQuery 1000 字符账号返回空挑战且不抛异常
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyAuth0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0305 begin');
      let alias: string = '';
      for (let i: number = 0; i < 1000; i++) {
        alias += 'A';
      }
      let thrown: boolean = false;
      let challenge: Uint8Array = new Uint8Array(0);
      try {
        challenge = await preQueryAssetPromise(alias);
      } catch (error) {
        thrown = true;
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(thrown), 'false');
      expect(thrown).assertFalse();
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', challenge.length, 0);
      expect(challenge.length).assertEqual(0);
      expect(challenge instanceof Uint8Array).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0305 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYAUTH_0306
     * @tc.name testKeyAuth0306
     * @tc.desc 非法值：queryAuth 不存在账号返回空 Map
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyAuth0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0306 begin');
      let thrown: boolean = false;
      let result: Map<string, string> = new Map<string, string>();
      try {
        result = await queryAuthAssetPromise('uAuth0306_not_exist', new Uint8Array([1]), new Uint8Array([1]));
      } catch (error) {
        thrown = true;
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(thrown), 'false');
      expect(thrown).assertFalse();
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.size, 0);
      expect(result.size).assertEqual(0);
      expect(result.has('secret')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0306 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYAUTH_0307
     * @tc.name testKeyAuth0307
     * @tc.desc 非法值：queryAuth 存在账号加空挑战返回空 Map
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyAuth0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0307 begin');
      const alias: string = 'uAuth0307';
      await addAssetPromise(alias, 'pwd0307', 'l1');
      let result: Map<string, string> = await queryAuthAssetPromise(alias, new Uint8Array(0), new Uint8Array(0));
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.size, 0);
      expect(result.size).assertEqual(0);
      expect(result.has('secret')).assertFalse();
      expect(result instanceof Map).assertTrue();
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0307 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYAUTH_0308
     * @tc.name testKeyAuth0308
     * @tc.desc 非法值：queryAuth 空账号不抛异常且与不存在账号结果同为 Map 类型
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyAuth0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0308 begin');
      let thrown: boolean = false;
      let empty: Map<string, string> = new Map<string, string>();
      try {
        empty = await queryAuthAssetPromise('', new Uint8Array(0), new Uint8Array(0));
      } catch (error) {
        thrown = true;
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(thrown), 'false');
      expect(thrown).assertFalse();
      expect(empty instanceof Map).assertTrue();
      const none: Map<string, string> = await queryAuthAssetPromise('uAuth0308_not_exist',
        new Uint8Array(0), new Uint8Array(0));
      expect(none instanceof Map).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0308 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYAUTH_0309
     * @tc.name testKeyAuth0309
     * @tc.desc 非法值：queryAuth 无效 token 返回空 Map
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyAuth0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0309 begin');
      const alias: string = 'uAuth0309';
      await addAssetPromise(alias, 'pwd0309', 'l1');
      const challenge: Uint8Array = await preQueryAssetPromise(alias);
      const result: Map<string, string> = await queryAuthAssetPromise(alias, challenge, new Uint8Array([9, 9, 9]));
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.size, 0);
      expect(result.size).assertEqual(0);
      expect(result.has('secret')).assertFalse();
      expect(result instanceof Map).assertTrue();
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0309 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYAUTH_0310
     * @tc.name testKeyAuth0310
     * @tc.desc 边界值：queryAuth 存在账号加空 token 返回空 Map
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyAuth0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0310 begin');
      const alias: string = 'uAuth0310';
      await addAssetPromise(alias, 'pwd0310', 'l1');
      const challenge: Uint8Array = await preQueryAssetPromise(alias);
      const result: Map<string, string> = await queryAuthAssetPromise(alias, challenge, new Uint8Array(0));
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.size, 0);
      expect(result.size).assertEqual(0);
      expect(result.has('secret')).assertFalse();
      expect(result instanceof Map).assertTrue();
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0310 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYAUTH_0311
     * @tc.name testKeyAuth0311
     * @tc.desc 非法值：queryAuth 不存在账号加 32 字节挑战与 token 返回空 Map
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyAuth0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0311 begin');
      let challenge: Uint8Array = new Uint8Array(32);
      for (let i: number = 0; i < 32; i++) {
        challenge[i] = i;
      }
      let token: Uint8Array = new Uint8Array(32);
      for (let i: number = 0; i < 32; i++) {
        token[i] = 32 - i;
      }
      const result: Map<string, string> = await queryAuthAssetPromise('uAuth0311_not_exist', challenge, token);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.size, 0);
      expect(result.size).assertEqual(0);
      expect(result.has('secret')).assertFalse();
      expect(result instanceof Map).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0311 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYAUTH_0312
     * @tc.name testKeyAuth0312
     * @tc.desc 合法值：postQuery 空挑战不抛异常且返回 undefined
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testKeyAuth0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0312 begin');
      let thrown: boolean = false;
      let ret: void = undefined;
      try {
        ret = await postQueryAssetPromise(new Uint8Array(0));
      } catch (error) {
        thrown = true;
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(thrown), 'false');
      expect(thrown).assertFalse();
      expect(ret === undefined).assertTrue();
      try {
        await postQueryAssetPromise(new Uint8Array(0));
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0312 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYAUTH_0313
     * @tc.name testKeyAuth0313
     * @tc.desc 合法值：postQuery 全零挑战不抛异常
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testKeyAuth0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0313 begin');
      let challenge: Uint8Array = new Uint8Array(8);
      for (let i: number = 0; i < 8; i++) {
        challenge[i] = 0;
      }
      let thrown: boolean = false;
      try {
        await postQueryAssetPromise(challenge);
      } catch (error) {
        thrown = true;
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(thrown), 'false');
      expect(thrown).assertFalse();
      const after: Map<string, string>[] = await queryAssetPromise('', '');
      expect(after instanceof Array).assertTrue();
      const none: Map<string, string>[] = await queryAssetPromise('uAuth0313_not_exist', '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', none.length, 0);
      expect(none.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0313 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYAUTH_0314
     * @tc.name testKeyAuth0314
     * @tc.desc 边界值：postQuery 单字节挑战不抛异常
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyAuth0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0314 begin');
      let thrown: boolean = false;
      try {
        await postQueryAssetPromise(new Uint8Array([7]));
      } catch (error) {
        thrown = true;
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(thrown), 'false');
      expect(thrown).assertFalse();
      try {
        await postQueryAssetPromise(new Uint8Array([7]));
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertFalse();
      const after: Uint8Array = await preQueryAssetPromise('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', after.length, 0);
      expect(after.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0314 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYAUTH_0315
     * @tc.name testKeyAuth0315
     * @tc.desc 组合值：preQuery 到 queryAuth 到 postQuery 全链路不抛异常，无效 token 查询返回空 Map
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyAuth0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0315 begin');
      const alias: string = 'uAuth0315';
      await addAssetPromise(alias, 'pwd0315', 'l1');
      let thrown: boolean = false;
      let result: Map<string, string> = new Map<string, string>();
      try {
        const challenge: Uint8Array = await preQueryAssetPromise(alias);
        result = await queryAuthAssetPromise(alias, challenge, new Uint8Array([9, 9, 9]));
        await postQueryAssetPromise(challenge);
      } catch (error) {
        thrown = true;
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(thrown), 'false');
      expect(thrown).assertFalse();
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.size, 0);
      expect(result.size).assertEqual(0);
      expect(result instanceof Map).assertTrue();
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0315 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYAUTH_0316
     * @tc.name testKeyAuth0316
     * @tc.desc 组合值：preQuery 挑战用于 postQuery 不抛异常
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyAuth0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0316 begin');
      const alias: string = 'uAuth0316';
      await addAssetPromise(alias, 'pwd0316', 'l1');
      const challenge: Uint8Array = await preQueryAssetPromise(alias);
      expect(challenge instanceof Uint8Array).assertTrue();
      let thrown: boolean = false;
      try {
        await postQueryAssetPromise(challenge);
        await postQueryAssetPromise(challenge);
      } catch (error) {
        thrown = true;
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(thrown), 'false');
      expect(thrown).assertFalse();
      const after: Uint8Array = await preQueryAssetPromise(alias);
      expect(after instanceof Uint8Array).assertTrue();
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0316 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYAUTH_0317
     * @tc.name testKeyAuth0317
     * @tc.desc 状态值：同一账号两次 preQuery 结果类型一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyAuth0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0317 begin');
      const alias: string = 'uAuth0317';
      await addAssetPromise(alias, 'pwd0317', 'l1');
      let thrown: boolean = false;
      let first: Uint8Array = new Uint8Array(0);
      let second: Uint8Array = new Uint8Array(0);
      try {
        first = await preQueryAssetPromise(alias);
        second = await preQueryAssetPromise(alias);
      } catch (error) {
        thrown = true;
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(thrown), 'false');
      expect(thrown).assertFalse();
      expect(first instanceof Uint8Array).assertTrue();
      expect(second instanceof Uint8Array).assertTrue();
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0317 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYAUTH_0318
     * @tc.name testKeyAuth0318
     * @tc.desc 极值：queryAuth 1000 字符账号返回空 Map
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyAuth0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0318 begin');
      let alias: string = '';
      for (let i: number = 0; i < 1000; i++) {
        alias += 'B';
      }
      const result: Map<string, string> = await queryAuthAssetPromise(alias, new Uint8Array([1]), new Uint8Array([1]));
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.size, 0);
      expect(result.size).assertEqual(0);
      expect(result.has('secret')).assertFalse();
      expect(result instanceof Map).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0318 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYAUTH_0319
     * @tc.name testKeyAuth0319
     * @tc.desc 组合值：queryAuth 中文不存在账号返回空 Map
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyAuth0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0319 begin');
      const result: Map<string, string> = await queryAuthAssetPromise('账号0319',
        new Uint8Array([1]), new Uint8Array([1]));
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.size, 0);
      expect(result.size).assertEqual(0);
      expect(result.has('secret')).assertFalse();
      expect(result instanceof Map).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0319 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYAUTH_0320
     * @tc.name testKeyAuth0320
     * @tc.desc 组合值：postQuery 不存在账号的 preQuery 空挑战不抛异常
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testKeyAuth0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0320 begin');
      const challenge: Uint8Array = await preQueryAssetPromise('uAuth0320_not_exist');
      expect(challenge instanceof Uint8Array).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', challenge.length, 0);
      expect(challenge.length).assertEqual(0);
      let thrown: boolean = false;
      try {
        await postQueryAssetPromise(challenge);
      } catch (error) {
        thrown = true;
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(thrown), 'false');
      expect(thrown).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0320 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYAUTH_0321
     * @tc.name testKeyAuth0321
     * @tc.desc 合法值：postQuery 已保存账号的 preQuery 挑战不抛异常且资产可见
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyAuth0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0321 begin');
      const alias: string = 'uAuth0321';
      await addAssetPromise(alias, 'pwd0321', 'l1');
      const challenge: Uint8Array = await preQueryAssetPromise(alias);
      let thrown: boolean = false;
      try {
        await postQueryAssetPromise(challenge);
      } catch (error) {
        thrown = true;
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(thrown), 'false');
      expect(thrown).assertFalse();
      expect(challenge instanceof Uint8Array).assertTrue();
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 1);
      expect(result.length).assertEqual(1);
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0321 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYAUTH_0322
     * @tc.name testKeyAuth0322
     * @tc.desc 非法值：queryAuth 存在账号加空 token 返回空 Map
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyAuth0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0322 begin');
      const alias: string = 'uAuth0322';
      await addAssetPromise(alias, 'pwd0322', 'l1');
      const challenge: Uint8Array = await preQueryAssetPromise(alias);
      let thrown: boolean = false;
      let result: Map<string, string> = new Map<string, string>();
      try {
        result = await queryAuthAssetPromise(alias, challenge, new Uint8Array(0));
      } catch (error) {
        thrown = true;
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(thrown), 'false');
      expect(thrown).assertFalse();
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.size, 0);
      expect(result.size).assertEqual(0);
      expect(result.has('secret')).assertFalse();
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0322 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYAUTH_0323
     * @tc.name testKeyAuth0323
     * @tc.desc 状态值：保存前后 queryAuth 空 token 均返回空 Map
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyAuth0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0323 begin');
      const alias: string = 'uAuth0323';
      const before: Map<string, string> = await queryAuthAssetPromise(alias, new Uint8Array(0), new Uint8Array(0));
      await addAssetPromise(alias, 'pwd0323', 'l1');
      const after: Map<string, string> = await queryAuthAssetPromise(alias, new Uint8Array(0), new Uint8Array(0));
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', before.size, 0);
      expect(before.size).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', after.size, 0);
      expect(after.size).assertEqual(0);
      expect(before.size).assertEqual(after.size);
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0323 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYAUTH_0324
     * @tc.name testKeyAuth0324
     * @tc.desc 极值：preQuery 2000 字符账号返回空挑战且不抛异常
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyAuth0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0324 begin');
      let alias: string = '';
      for (let i: number = 0; i < 2000; i++) {
        alias += 'C';
      }
      let thrown: boolean = false;
      let challenge: Uint8Array = new Uint8Array(0);
      try {
        challenge = await preQueryAssetPromise(alias);
      } catch (error) {
        thrown = true;
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(thrown), 'false');
      expect(thrown).assertFalse();
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', challenge.length, 0);
      expect(challenge.length).assertEqual(0);
      expect(challenge instanceof Uint8Array).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0324 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYAUTH_0325
     * @tc.name testKeyAuth0325
     * @tc.desc 非法值：queryAuth 空挑战加全零 token 返回空 Map
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyAuth0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0325 begin');
      let token: Uint8Array = new Uint8Array(4);
      for (let i: number = 0; i < 4; i++) {
        token[i] = 0;
      }
      const result: Map<string, string> = await queryAuthAssetPromise('uAuth0325_not_exist', new Uint8Array(0), token);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.size, 0);
      expect(result.size).assertEqual(0);
      expect(result.has('secret')).assertFalse();
      expect(result instanceof Map).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0325 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYAUTH_0326
     * @tc.name testKeyAuth0326
     * @tc.desc 组合值：queryAuth emoji 不存在账号返回空 Map
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyAuth0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0326 begin');
      const result: Map<string, string> = await queryAuthAssetPromise('账号😀0326',
        new Uint8Array([1]), new Uint8Array([1]));
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.size, 0);
      expect(result.size).assertEqual(0);
      expect(result.has('secret')).assertFalse();
      expect(result instanceof Map).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0326 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYAUTH_0327
     * @tc.name testKeyAuth0327
     * @tc.desc 状态值：连续两次 postQuery 均不抛异常
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyAuth0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0327 begin');
      let challenge: Uint8Array = new Uint8Array(16);
      for (let i: number = 0; i < 16; i++) {
        challenge[i] = i + 1;
      }
      let thrown: boolean = false;
      try {
        await postQueryAssetPromise(challenge);
        await postQueryAssetPromise(challenge);
      } catch (error) {
        thrown = true;
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(thrown), 'false');
      expect(thrown).assertFalse();
      const after: Map<string, string>[] = await queryAssetPromise('', '');
      expect(after instanceof Array).assertTrue();
      const empty: Uint8Array = await preQueryAssetPromise('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', empty.length, 0);
      expect(empty.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0327 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYAUTH_0328
     * @tc.name testKeyAuth0328
     * @tc.desc 非法值：queryAuth 不存在账号返回空 Map 且无 secret 键
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyAuth0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0328 begin');
      const result: Map<string, string> = await queryAuthAssetPromise('uAuth0328_not_exist',
        new Uint8Array(0), new Uint8Array(0));
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.size, 0);
      expect(result.size).assertEqual(0);
      expect(result.has('secret')).assertFalse();
      expect(result.has('alias')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0328 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYAUTH_0329
     * @tc.name testKeyAuth0329
     * @tc.desc 组合值：preQuery 空账号与存在账号结果类型一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyAuth0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0329 begin');
      const alias: string = 'uAuth0329';
      await addAssetPromise(alias, 'pwd0329', 'l1');
      let thrown: boolean = false;
      let empty: Uint8Array = new Uint8Array(0);
      let saved: Uint8Array = new Uint8Array(0);
      try {
        empty = await preQueryAssetPromise('');
        saved = await preQueryAssetPromise(alias);
      } catch (error) {
        thrown = true;
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(thrown), 'false');
      expect(thrown).assertFalse();
      expect(empty instanceof Uint8Array).assertTrue();
      expect(saved instanceof Uint8Array).assertTrue();
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0329 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYAUTH_0330
     * @tc.name testKeyAuth0330
     * @tc.desc 状态值：删除后 preQuery 不抛异常且返回空挑战
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyAuth0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0330 begin');
      const alias: string = 'uAuth0330';
      await addAssetPromise(alias, 'pwd0330', 'l1');
      await removeAssetPromise(alias, '');
      let thrown: boolean = false;
      let challenge: Uint8Array = new Uint8Array(0);
      try {
        challenge = await preQueryAssetPromise(alias);
      } catch (error) {
        thrown = true;
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(thrown), 'false');
      expect(thrown).assertFalse();
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', challenge.length, 0);
      expect(challenge.length).assertEqual(0);
      expect(challenge instanceof Uint8Array).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAuth0330 end');
    });
  });
}


