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
import { ResourceUtils } from '../../../../main/ets/utils/ResourceUtils';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ResourceManager]';

export default function resourceUtilsB64V23Test() {
  describe('ResourceUtilsB64V23Test', () => {

    /**
     * @tc.name   testResourceUtilsB64V230001
     * @tc.number SUB_RESMGR_UTILS23_0001
     * @tc.desc   3 字节的载荷编码为 4 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230001 begin');
      const body: string = 'A'.repeat(4);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3));
      expect(result).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(3)), String(4));
      expect(ResourceUtils.expectedBase64Length(3)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230001 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230002
     * @tc.number SUB_RESMGR_UTILS23_0002
     * @tc.desc   6 字节的载荷编码为 8 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230002 begin');
      const body: string = 'A'.repeat(8);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6));
      expect(result).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(6)), String(8));
      expect(ResourceUtils.expectedBase64Length(6)).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230002 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230003
     * @tc.number SUB_RESMGR_UTILS23_0003
     * @tc.desc   9 字节的载荷编码为 12 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230003 begin');
      const body: string = 'A'.repeat(12);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(9));
      expect(result).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(9)), String(12));
      expect(ResourceUtils.expectedBase64Length(9)).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230003 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230004
     * @tc.number SUB_RESMGR_UTILS23_0004
     * @tc.desc   12 字节的载荷编码为 16 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230004 begin');
      const body: string = 'A'.repeat(16);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(12));
      expect(result).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(12)), String(16));
      expect(ResourceUtils.expectedBase64Length(12)).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230004 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230005
     * @tc.number SUB_RESMGR_UTILS23_0005
     * @tc.desc   15 字节的载荷编码为 20 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230005 begin');
      const body: string = 'A'.repeat(20);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(15));
      expect(result).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(15)), String(20));
      expect(ResourceUtils.expectedBase64Length(15)).assertEqual(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230005 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230006
     * @tc.number SUB_RESMGR_UTILS23_0006
     * @tc.desc   18 字节的载荷编码为 24 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230006 begin');
      const body: string = 'A'.repeat(24);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(18));
      expect(result).assertEqual(18);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(18)), String(24));
      expect(ResourceUtils.expectedBase64Length(18)).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230006 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230007
     * @tc.number SUB_RESMGR_UTILS23_0007
     * @tc.desc   21 字节的载荷编码为 28 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230007 begin');
      const body: string = 'A'.repeat(28);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(21));
      expect(result).assertEqual(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(21)), String(28));
      expect(ResourceUtils.expectedBase64Length(21)).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230007 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230008
     * @tc.number SUB_RESMGR_UTILS23_0008
     * @tc.desc   24 字节的载荷编码为 32 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230008 begin');
      const body: string = 'A'.repeat(32);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(24));
      expect(result).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(24)), String(32));
      expect(ResourceUtils.expectedBase64Length(24)).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230008 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230009
     * @tc.number SUB_RESMGR_UTILS23_0009
     * @tc.desc   27 字节的载荷编码为 36 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230009 begin');
      const body: string = 'A'.repeat(36);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(27));
      expect(result).assertEqual(27);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(27)), String(36));
      expect(ResourceUtils.expectedBase64Length(27)).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230009 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230010
     * @tc.number SUB_RESMGR_UTILS23_0010
     * @tc.desc   30 字节的载荷编码为 40 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230010 begin');
      const body: string = 'A'.repeat(40);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(30));
      expect(result).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(30)), String(40));
      expect(ResourceUtils.expectedBase64Length(30)).assertEqual(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230010 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230011
     * @tc.number SUB_RESMGR_UTILS23_0011
     * @tc.desc   33 字节的载荷编码为 44 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230011 begin');
      const body: string = 'A'.repeat(44);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(33));
      expect(result).assertEqual(33);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(33)), String(44));
      expect(ResourceUtils.expectedBase64Length(33)).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230011 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230012
     * @tc.number SUB_RESMGR_UTILS23_0012
     * @tc.desc   36 字节的载荷编码为 48 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230012 begin');
      const body: string = 'A'.repeat(48);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(36));
      expect(result).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(36)), String(48));
      expect(ResourceUtils.expectedBase64Length(36)).assertEqual(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230012 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230013
     * @tc.number SUB_RESMGR_UTILS23_0013
     * @tc.desc   39 字节的载荷编码为 52 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230013 begin');
      const body: string = 'A'.repeat(52);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(39));
      expect(result).assertEqual(39);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(39)), String(52));
      expect(ResourceUtils.expectedBase64Length(39)).assertEqual(52);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230013 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230014
     * @tc.number SUB_RESMGR_UTILS23_0014
     * @tc.desc   42 字节的载荷编码为 56 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230014 begin');
      const body: string = 'A'.repeat(56);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(42));
      expect(result).assertEqual(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(42)), String(56));
      expect(ResourceUtils.expectedBase64Length(42)).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230014 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230015
     * @tc.number SUB_RESMGR_UTILS23_0015
     * @tc.desc   45 字节的载荷编码为 60 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230015 begin');
      const body: string = 'A'.repeat(60);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(45));
      expect(result).assertEqual(45);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(45)), String(60));
      expect(ResourceUtils.expectedBase64Length(45)).assertEqual(60);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230015 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230016
     * @tc.number SUB_RESMGR_UTILS23_0016
     * @tc.desc   48 字节的载荷编码为 64 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230016 begin');
      const body: string = 'A'.repeat(64);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(48));
      expect(result).assertEqual(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(48)), String(64));
      expect(ResourceUtils.expectedBase64Length(48)).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230016 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230017
     * @tc.number SUB_RESMGR_UTILS23_0017
     * @tc.desc   51 字节的载荷编码为 68 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230017 begin');
      const body: string = 'A'.repeat(68);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(51));
      expect(result).assertEqual(51);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(51)), String(68));
      expect(ResourceUtils.expectedBase64Length(51)).assertEqual(68);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230017 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230018
     * @tc.number SUB_RESMGR_UTILS23_0018
     * @tc.desc   54 字节的载荷编码为 72 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230018 begin');
      const body: string = 'A'.repeat(72);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(54));
      expect(result).assertEqual(54);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(54)), String(72));
      expect(ResourceUtils.expectedBase64Length(54)).assertEqual(72);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230018 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230019
     * @tc.number SUB_RESMGR_UTILS23_0019
     * @tc.desc   57 字节的载荷编码为 76 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230019 begin');
      const body: string = 'A'.repeat(76);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(57));
      expect(result).assertEqual(57);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(57)), String(76));
      expect(ResourceUtils.expectedBase64Length(57)).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230019 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230020
     * @tc.number SUB_RESMGR_UTILS23_0020
     * @tc.desc   60 字节的载荷编码为 80 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230020 begin');
      const body: string = 'A'.repeat(80);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(60));
      expect(result).assertEqual(60);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(60)), String(80));
      expect(ResourceUtils.expectedBase64Length(60)).assertEqual(80);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230020 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230021
     * @tc.number SUB_RESMGR_UTILS23_0021
     * @tc.desc   63 字节的载荷编码为 84 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230021 begin');
      const body: string = 'A'.repeat(84);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(63));
      expect(result).assertEqual(63);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(63)), String(84));
      expect(ResourceUtils.expectedBase64Length(63)).assertEqual(84);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230021 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230022
     * @tc.number SUB_RESMGR_UTILS23_0022
     * @tc.desc   66 字节的载荷编码为 88 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230022 begin');
      const body: string = 'A'.repeat(88);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(66));
      expect(result).assertEqual(66);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(66)), String(88));
      expect(ResourceUtils.expectedBase64Length(66)).assertEqual(88);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230022 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230023
     * @tc.number SUB_RESMGR_UTILS23_0023
     * @tc.desc   69 字节的载荷编码为 92 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230023 begin');
      const body: string = 'A'.repeat(92);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(69));
      expect(result).assertEqual(69);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(69)), String(92));
      expect(ResourceUtils.expectedBase64Length(69)).assertEqual(92);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230023 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230024
     * @tc.number SUB_RESMGR_UTILS23_0024
     * @tc.desc   72 字节的载荷编码为 96 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230024 begin');
      const body: string = 'A'.repeat(96);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(72));
      expect(result).assertEqual(72);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(72)), String(96));
      expect(ResourceUtils.expectedBase64Length(72)).assertEqual(96);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230024 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230025
     * @tc.number SUB_RESMGR_UTILS23_0025
     * @tc.desc   75 字节的载荷编码为 100 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230025 begin');
      const body: string = 'A'.repeat(100);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(75));
      expect(result).assertEqual(75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(75)), String(100));
      expect(ResourceUtils.expectedBase64Length(75)).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230025 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230026
     * @tc.number SUB_RESMGR_UTILS23_0026
     * @tc.desc   78 字节的载荷编码为 104 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230026 begin');
      const body: string = 'A'.repeat(104);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(78));
      expect(result).assertEqual(78);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(78)), String(104));
      expect(ResourceUtils.expectedBase64Length(78)).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230026 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230027
     * @tc.number SUB_RESMGR_UTILS23_0027
     * @tc.desc   81 字节的载荷编码为 108 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230027 begin');
      const body: string = 'A'.repeat(108);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(81));
      expect(result).assertEqual(81);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(81)), String(108));
      expect(ResourceUtils.expectedBase64Length(81)).assertEqual(108);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230027 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230028
     * @tc.number SUB_RESMGR_UTILS23_0028
     * @tc.desc   84 字节的载荷编码为 112 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230028 begin');
      const body: string = 'A'.repeat(112);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(84));
      expect(result).assertEqual(84);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(84)), String(112));
      expect(ResourceUtils.expectedBase64Length(84)).assertEqual(112);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230028 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230029
     * @tc.number SUB_RESMGR_UTILS23_0029
     * @tc.desc   87 字节的载荷编码为 116 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230029 begin');
      const body: string = 'A'.repeat(116);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(87));
      expect(result).assertEqual(87);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(87)), String(116));
      expect(ResourceUtils.expectedBase64Length(87)).assertEqual(116);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230029 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230030
     * @tc.number SUB_RESMGR_UTILS23_0030
     * @tc.desc   90 字节的载荷编码为 120 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230030 begin');
      const body: string = 'A'.repeat(120);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(90));
      expect(result).assertEqual(90);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(90)), String(120));
      expect(ResourceUtils.expectedBase64Length(90)).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230030 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230031
     * @tc.number SUB_RESMGR_UTILS23_0031
     * @tc.desc   93 字节的载荷编码为 124 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230031 begin');
      const body: string = 'A'.repeat(124);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(93));
      expect(result).assertEqual(93);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(93)), String(124));
      expect(ResourceUtils.expectedBase64Length(93)).assertEqual(124);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230031 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230032
     * @tc.number SUB_RESMGR_UTILS23_0032
     * @tc.desc   96 字节的载荷编码为 128 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230032 begin');
      const body: string = 'A'.repeat(128);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(96));
      expect(result).assertEqual(96);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(96)), String(128));
      expect(ResourceUtils.expectedBase64Length(96)).assertEqual(128);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230032 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230033
     * @tc.number SUB_RESMGR_UTILS23_0033
     * @tc.desc   99 字节的载荷编码为 132 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230033 begin');
      const body: string = 'A'.repeat(132);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(99));
      expect(result).assertEqual(99);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(99)), String(132));
      expect(ResourceUtils.expectedBase64Length(99)).assertEqual(132);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230033 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230034
     * @tc.number SUB_RESMGR_UTILS23_0034
     * @tc.desc   102 字节的载荷编码为 136 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230034 begin');
      const body: string = 'A'.repeat(136);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(102));
      expect(result).assertEqual(102);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(102)), String(136));
      expect(ResourceUtils.expectedBase64Length(102)).assertEqual(136);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230034 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230035
     * @tc.number SUB_RESMGR_UTILS23_0035
     * @tc.desc   105 字节的载荷编码为 140 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230035 begin');
      const body: string = 'A'.repeat(140);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(105));
      expect(result).assertEqual(105);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(105)), String(140));
      expect(ResourceUtils.expectedBase64Length(105)).assertEqual(140);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230035 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230036
     * @tc.number SUB_RESMGR_UTILS23_0036
     * @tc.desc   108 字节的载荷编码为 144 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230036 begin');
      const body: string = 'A'.repeat(144);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(108));
      expect(result).assertEqual(108);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(108)), String(144));
      expect(ResourceUtils.expectedBase64Length(108)).assertEqual(144);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230036 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230037
     * @tc.number SUB_RESMGR_UTILS23_0037
     * @tc.desc   111 字节的载荷编码为 148 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230037 begin');
      const body: string = 'A'.repeat(148);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(111));
      expect(result).assertEqual(111);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(111)), String(148));
      expect(ResourceUtils.expectedBase64Length(111)).assertEqual(148);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230037 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230038
     * @tc.number SUB_RESMGR_UTILS23_0038
     * @tc.desc   114 字节的载荷编码为 152 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230038 begin');
      const body: string = 'A'.repeat(152);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(114));
      expect(result).assertEqual(114);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(114)), String(152));
      expect(ResourceUtils.expectedBase64Length(114)).assertEqual(152);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230038 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230039
     * @tc.number SUB_RESMGR_UTILS23_0039
     * @tc.desc   117 字节的载荷编码为 156 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230039 begin');
      const body: string = 'A'.repeat(156);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(117));
      expect(result).assertEqual(117);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(117)), String(156));
      expect(ResourceUtils.expectedBase64Length(117)).assertEqual(156);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230039 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230040
     * @tc.number SUB_RESMGR_UTILS23_0040
     * @tc.desc   120 字节的载荷编码为 160 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230040 begin');
      const body: string = 'A'.repeat(160);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(120));
      expect(result).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(120)), String(160));
      expect(ResourceUtils.expectedBase64Length(120)).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230040 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230041
     * @tc.number SUB_RESMGR_UTILS23_0041
     * @tc.desc   123 字节的载荷编码为 164 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230041 begin');
      const body: string = 'A'.repeat(164);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(123));
      expect(result).assertEqual(123);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(123)), String(164));
      expect(ResourceUtils.expectedBase64Length(123)).assertEqual(164);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230041 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230042
     * @tc.number SUB_RESMGR_UTILS23_0042
     * @tc.desc   126 字节的载荷编码为 168 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230042 begin');
      const body: string = 'A'.repeat(168);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(126));
      expect(result).assertEqual(126);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(126)), String(168));
      expect(ResourceUtils.expectedBase64Length(126)).assertEqual(168);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230042 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230043
     * @tc.number SUB_RESMGR_UTILS23_0043
     * @tc.desc   129 字节的载荷编码为 172 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230043 begin');
      const body: string = 'A'.repeat(172);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(129));
      expect(result).assertEqual(129);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(129)), String(172));
      expect(ResourceUtils.expectedBase64Length(129)).assertEqual(172);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230043 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230044
     * @tc.number SUB_RESMGR_UTILS23_0044
     * @tc.desc   132 字节的载荷编码为 176 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230044 begin');
      const body: string = 'A'.repeat(176);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(132));
      expect(result).assertEqual(132);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(132)), String(176));
      expect(ResourceUtils.expectedBase64Length(132)).assertEqual(176);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230044 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230045
     * @tc.number SUB_RESMGR_UTILS23_0045
     * @tc.desc   135 字节的载荷编码为 180 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230045 begin');
      const body: string = 'A'.repeat(180);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(135));
      expect(result).assertEqual(135);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(135)), String(180));
      expect(ResourceUtils.expectedBase64Length(135)).assertEqual(180);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230045 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230046
     * @tc.number SUB_RESMGR_UTILS23_0046
     * @tc.desc   138 字节的载荷编码为 184 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230046 begin');
      const body: string = 'A'.repeat(184);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(138));
      expect(result).assertEqual(138);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(138)), String(184));
      expect(ResourceUtils.expectedBase64Length(138)).assertEqual(184);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230046 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230047
     * @tc.number SUB_RESMGR_UTILS23_0047
     * @tc.desc   141 字节的载荷编码为 188 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230047 begin');
      const body: string = 'A'.repeat(188);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(141));
      expect(result).assertEqual(141);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(141)), String(188));
      expect(ResourceUtils.expectedBase64Length(141)).assertEqual(188);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230047 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230048
     * @tc.number SUB_RESMGR_UTILS23_0048
     * @tc.desc   144 字节的载荷编码为 192 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230048 begin');
      const body: string = 'A'.repeat(192);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(144));
      expect(result).assertEqual(144);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(144)), String(192));
      expect(ResourceUtils.expectedBase64Length(144)).assertEqual(192);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230048 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230049
     * @tc.number SUB_RESMGR_UTILS23_0049
     * @tc.desc   147 字节的载荷编码为 196 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230049 begin');
      const body: string = 'A'.repeat(196);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(147));
      expect(result).assertEqual(147);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(147)), String(196));
      expect(ResourceUtils.expectedBase64Length(147)).assertEqual(196);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230049 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230050
     * @tc.number SUB_RESMGR_UTILS23_0050
     * @tc.desc   150 字节的载荷编码为 200 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230050 begin');
      const body: string = 'A'.repeat(200);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(150));
      expect(result).assertEqual(150);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(150)), String(200));
      expect(ResourceUtils.expectedBase64Length(150)).assertEqual(200);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230050 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230051
     * @tc.number SUB_RESMGR_UTILS23_0051
     * @tc.desc   153 字节的载荷编码为 204 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230051 begin');
      const body: string = 'A'.repeat(204);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(153));
      expect(result).assertEqual(153);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(153)), String(204));
      expect(ResourceUtils.expectedBase64Length(153)).assertEqual(204);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230051 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230052
     * @tc.number SUB_RESMGR_UTILS23_0052
     * @tc.desc   156 字节的载荷编码为 208 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230052 begin');
      const body: string = 'A'.repeat(208);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(156));
      expect(result).assertEqual(156);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(156)), String(208));
      expect(ResourceUtils.expectedBase64Length(156)).assertEqual(208);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230052 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230053
     * @tc.number SUB_RESMGR_UTILS23_0053
     * @tc.desc   159 字节的载荷编码为 212 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230053 begin');
      const body: string = 'A'.repeat(212);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(159));
      expect(result).assertEqual(159);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(159)), String(212));
      expect(ResourceUtils.expectedBase64Length(159)).assertEqual(212);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230053 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230054
     * @tc.number SUB_RESMGR_UTILS23_0054
     * @tc.desc   162 字节的载荷编码为 216 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230054 begin');
      const body: string = 'A'.repeat(216);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(162));
      expect(result).assertEqual(162);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(162)), String(216));
      expect(ResourceUtils.expectedBase64Length(162)).assertEqual(216);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230054 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230055
     * @tc.number SUB_RESMGR_UTILS23_0055
     * @tc.desc   165 字节的载荷编码为 220 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230055 begin');
      const body: string = 'A'.repeat(220);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(165));
      expect(result).assertEqual(165);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(165)), String(220));
      expect(ResourceUtils.expectedBase64Length(165)).assertEqual(220);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230055 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230056
     * @tc.number SUB_RESMGR_UTILS23_0056
     * @tc.desc   168 字节的载荷编码为 224 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230056 begin');
      const body: string = 'A'.repeat(224);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(168));
      expect(result).assertEqual(168);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(168)), String(224));
      expect(ResourceUtils.expectedBase64Length(168)).assertEqual(224);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230056 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230057
     * @tc.number SUB_RESMGR_UTILS23_0057
     * @tc.desc   171 字节的载荷编码为 228 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230057 begin');
      const body: string = 'A'.repeat(228);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(171));
      expect(result).assertEqual(171);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(171)), String(228));
      expect(ResourceUtils.expectedBase64Length(171)).assertEqual(228);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230057 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230058
     * @tc.number SUB_RESMGR_UTILS23_0058
     * @tc.desc   174 字节的载荷编码为 232 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230058 begin');
      const body: string = 'A'.repeat(232);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(174));
      expect(result).assertEqual(174);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(174)), String(232));
      expect(ResourceUtils.expectedBase64Length(174)).assertEqual(232);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230058 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230059
     * @tc.number SUB_RESMGR_UTILS23_0059
     * @tc.desc   177 字节的载荷编码为 236 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230059 begin');
      const body: string = 'A'.repeat(236);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(177));
      expect(result).assertEqual(177);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(177)), String(236));
      expect(ResourceUtils.expectedBase64Length(177)).assertEqual(236);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230059 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230060
     * @tc.number SUB_RESMGR_UTILS23_0060
     * @tc.desc   180 字节的载荷编码为 240 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230060 begin');
      const body: string = 'A'.repeat(240);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(180));
      expect(result).assertEqual(180);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(180)), String(240));
      expect(ResourceUtils.expectedBase64Length(180)).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230060 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230061
     * @tc.number SUB_RESMGR_UTILS23_0061
     * @tc.desc   183 字节的载荷编码为 244 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230061 begin');
      const body: string = 'A'.repeat(244);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(183));
      expect(result).assertEqual(183);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(183)), String(244));
      expect(ResourceUtils.expectedBase64Length(183)).assertEqual(244);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230061 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230062
     * @tc.number SUB_RESMGR_UTILS23_0062
     * @tc.desc   186 字节的载荷编码为 248 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230062 begin');
      const body: string = 'A'.repeat(248);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(186));
      expect(result).assertEqual(186);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(186)), String(248));
      expect(ResourceUtils.expectedBase64Length(186)).assertEqual(248);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230062 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230063
     * @tc.number SUB_RESMGR_UTILS23_0063
     * @tc.desc   189 字节的载荷编码为 252 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230063 begin');
      const body: string = 'A'.repeat(252);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(189));
      expect(result).assertEqual(189);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(189)), String(252));
      expect(ResourceUtils.expectedBase64Length(189)).assertEqual(252);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230063 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230064
     * @tc.number SUB_RESMGR_UTILS23_0064
     * @tc.desc   192 字节的载荷编码为 256 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230064 begin');
      const body: string = 'A'.repeat(256);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(192));
      expect(result).assertEqual(192);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(192)), String(256));
      expect(ResourceUtils.expectedBase64Length(192)).assertEqual(256);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230064 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230065
     * @tc.number SUB_RESMGR_UTILS23_0065
     * @tc.desc   195 字节的载荷编码为 260 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230065 begin');
      const body: string = 'A'.repeat(260);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(195));
      expect(result).assertEqual(195);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(195)), String(260));
      expect(ResourceUtils.expectedBase64Length(195)).assertEqual(260);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230065 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230066
     * @tc.number SUB_RESMGR_UTILS23_0066
     * @tc.desc   198 字节的载荷编码为 264 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230066 begin');
      const body: string = 'A'.repeat(264);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(198));
      expect(result).assertEqual(198);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(198)), String(264));
      expect(ResourceUtils.expectedBase64Length(198)).assertEqual(264);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230066 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230067
     * @tc.number SUB_RESMGR_UTILS23_0067
     * @tc.desc   201 字节的载荷编码为 268 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230067 begin');
      const body: string = 'A'.repeat(268);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(201));
      expect(result).assertEqual(201);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(201)), String(268));
      expect(ResourceUtils.expectedBase64Length(201)).assertEqual(268);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230067 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230068
     * @tc.number SUB_RESMGR_UTILS23_0068
     * @tc.desc   204 字节的载荷编码为 272 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230068 begin');
      const body: string = 'A'.repeat(272);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(204));
      expect(result).assertEqual(204);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(204)), String(272));
      expect(ResourceUtils.expectedBase64Length(204)).assertEqual(272);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230068 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230069
     * @tc.number SUB_RESMGR_UTILS23_0069
     * @tc.desc   207 字节的载荷编码为 276 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230069 begin');
      const body: string = 'A'.repeat(276);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(207));
      expect(result).assertEqual(207);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(207)), String(276));
      expect(ResourceUtils.expectedBase64Length(207)).assertEqual(276);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230069 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230070
     * @tc.number SUB_RESMGR_UTILS23_0070
     * @tc.desc   210 字节的载荷编码为 280 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230070 begin');
      const body: string = 'A'.repeat(280);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(210));
      expect(result).assertEqual(210);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(210)), String(280));
      expect(ResourceUtils.expectedBase64Length(210)).assertEqual(280);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230070 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230071
     * @tc.number SUB_RESMGR_UTILS23_0071
     * @tc.desc   213 字节的载荷编码为 284 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230071 begin');
      const body: string = 'A'.repeat(284);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(213));
      expect(result).assertEqual(213);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(213)), String(284));
      expect(ResourceUtils.expectedBase64Length(213)).assertEqual(284);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230071 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230072
     * @tc.number SUB_RESMGR_UTILS23_0072
     * @tc.desc   216 字节的载荷编码为 288 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230072 begin');
      const body: string = 'A'.repeat(288);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(216));
      expect(result).assertEqual(216);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(216)), String(288));
      expect(ResourceUtils.expectedBase64Length(216)).assertEqual(288);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230072 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230073
     * @tc.number SUB_RESMGR_UTILS23_0073
     * @tc.desc   219 字节的载荷编码为 292 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230073 begin');
      const body: string = 'A'.repeat(292);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(219));
      expect(result).assertEqual(219);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(219)), String(292));
      expect(ResourceUtils.expectedBase64Length(219)).assertEqual(292);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230073 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230074
     * @tc.number SUB_RESMGR_UTILS23_0074
     * @tc.desc   222 字节的载荷编码为 296 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230074 begin');
      const body: string = 'A'.repeat(296);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(222));
      expect(result).assertEqual(222);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(222)), String(296));
      expect(ResourceUtils.expectedBase64Length(222)).assertEqual(296);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230074 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230075
     * @tc.number SUB_RESMGR_UTILS23_0075
     * @tc.desc   225 字节的载荷编码为 300 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230075 begin');
      const body: string = 'A'.repeat(300);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(225));
      expect(result).assertEqual(225);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(225)), String(300));
      expect(ResourceUtils.expectedBase64Length(225)).assertEqual(300);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230075 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230076
     * @tc.number SUB_RESMGR_UTILS23_0076
     * @tc.desc   228 字节的载荷编码为 304 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230076 begin');
      const body: string = 'A'.repeat(304);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(228));
      expect(result).assertEqual(228);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(228)), String(304));
      expect(ResourceUtils.expectedBase64Length(228)).assertEqual(304);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230076 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230077
     * @tc.number SUB_RESMGR_UTILS23_0077
     * @tc.desc   231 字节的载荷编码为 308 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230077 begin');
      const body: string = 'A'.repeat(308);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(231));
      expect(result).assertEqual(231);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(231)), String(308));
      expect(ResourceUtils.expectedBase64Length(231)).assertEqual(308);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230077 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230078
     * @tc.number SUB_RESMGR_UTILS23_0078
     * @tc.desc   234 字节的载荷编码为 312 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230078 begin');
      const body: string = 'A'.repeat(312);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(234));
      expect(result).assertEqual(234);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(234)), String(312));
      expect(ResourceUtils.expectedBase64Length(234)).assertEqual(312);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230078 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230079
     * @tc.number SUB_RESMGR_UTILS23_0079
     * @tc.desc   237 字节的载荷编码为 316 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230079 begin');
      const body: string = 'A'.repeat(316);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(237));
      expect(result).assertEqual(237);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(237)), String(316));
      expect(ResourceUtils.expectedBase64Length(237)).assertEqual(316);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230079 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230080
     * @tc.number SUB_RESMGR_UTILS23_0080
     * @tc.desc   240 字节的载荷编码为 320 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230080 begin');
      const body: string = 'A'.repeat(320);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(240)), String(320));
      expect(ResourceUtils.expectedBase64Length(240)).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230080 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230081
     * @tc.number SUB_RESMGR_UTILS23_0081
     * @tc.desc   243 字节的载荷编码为 324 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230081 begin');
      const body: string = 'A'.repeat(324);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(243));
      expect(result).assertEqual(243);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(243)), String(324));
      expect(ResourceUtils.expectedBase64Length(243)).assertEqual(324);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230081 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230082
     * @tc.number SUB_RESMGR_UTILS23_0082
     * @tc.desc   246 字节的载荷编码为 328 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230082 begin');
      const body: string = 'A'.repeat(328);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(246));
      expect(result).assertEqual(246);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(246)), String(328));
      expect(ResourceUtils.expectedBase64Length(246)).assertEqual(328);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230082 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230083
     * @tc.number SUB_RESMGR_UTILS23_0083
     * @tc.desc   249 字节的载荷编码为 332 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230083 begin');
      const body: string = 'A'.repeat(332);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(249));
      expect(result).assertEqual(249);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(249)), String(332));
      expect(ResourceUtils.expectedBase64Length(249)).assertEqual(332);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230083 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230084
     * @tc.number SUB_RESMGR_UTILS23_0084
     * @tc.desc   252 字节的载荷编码为 336 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230084 begin');
      const body: string = 'A'.repeat(336);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(252));
      expect(result).assertEqual(252);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(252)), String(336));
      expect(ResourceUtils.expectedBase64Length(252)).assertEqual(336);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230084 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230085
     * @tc.number SUB_RESMGR_UTILS23_0085
     * @tc.desc   255 字节的载荷编码为 340 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230085 begin');
      const body: string = 'A'.repeat(340);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(255));
      expect(result).assertEqual(255);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(255)), String(340));
      expect(ResourceUtils.expectedBase64Length(255)).assertEqual(340);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230085 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230086
     * @tc.number SUB_RESMGR_UTILS23_0086
     * @tc.desc   258 字节的载荷编码为 344 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230086 begin');
      const body: string = 'A'.repeat(344);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(258));
      expect(result).assertEqual(258);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(258)), String(344));
      expect(ResourceUtils.expectedBase64Length(258)).assertEqual(344);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230086 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230087
     * @tc.number SUB_RESMGR_UTILS23_0087
     * @tc.desc   261 字节的载荷编码为 348 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230087 begin');
      const body: string = 'A'.repeat(348);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(261));
      expect(result).assertEqual(261);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(261)), String(348));
      expect(ResourceUtils.expectedBase64Length(261)).assertEqual(348);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230087 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230088
     * @tc.number SUB_RESMGR_UTILS23_0088
     * @tc.desc   264 字节的载荷编码为 352 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230088 begin');
      const body: string = 'A'.repeat(352);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(264));
      expect(result).assertEqual(264);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(264)), String(352));
      expect(ResourceUtils.expectedBase64Length(264)).assertEqual(352);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230088 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230089
     * @tc.number SUB_RESMGR_UTILS23_0089
     * @tc.desc   267 字节的载荷编码为 356 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230089 begin');
      const body: string = 'A'.repeat(356);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(267));
      expect(result).assertEqual(267);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(267)), String(356));
      expect(ResourceUtils.expectedBase64Length(267)).assertEqual(356);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230089 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230090
     * @tc.number SUB_RESMGR_UTILS23_0090
     * @tc.desc   270 字节的载荷编码为 360 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230090 begin');
      const body: string = 'A'.repeat(360);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(270));
      expect(result).assertEqual(270);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(270)), String(360));
      expect(ResourceUtils.expectedBase64Length(270)).assertEqual(360);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230090 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230091
     * @tc.number SUB_RESMGR_UTILS23_0091
     * @tc.desc   273 字节的载荷编码为 364 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230091 begin');
      const body: string = 'A'.repeat(364);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(273));
      expect(result).assertEqual(273);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(273)), String(364));
      expect(ResourceUtils.expectedBase64Length(273)).assertEqual(364);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230091 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230092
     * @tc.number SUB_RESMGR_UTILS23_0092
     * @tc.desc   276 字节的载荷编码为 368 个字符并能反算回原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230092 begin');
      const body: string = 'A'.repeat(368);
      const result: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(276));
      expect(result).assertEqual(276);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.expectedBase64Length(276)), String(368));
      expect(ResourceUtils.expectedBase64Length(276)).assertEqual(368);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result % ResourceUtils.BASE64_GROUP_BYTES === 0));
      expect(result % ResourceUtils.BASE64_GROUP_BYTES === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230092 end');
    })

    /**
     * @tc.name   testResourceUtilsB64V230093
     * @tc.number SUB_RESMGR_UTILS23_0093
     * @tc.desc   长度非 4 倍数与空串返回 -1，合法填充串扣两次填充
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsB64V230093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230093 begin');
      const broken: number = ResourceUtils.decodedByteLength('QUJDRA=');
      const empty: number = ResourceUtils.decodedByteLength('');
      const padded: number = ResourceUtils.decodedByteLength('QUJDRA==');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d/%{public}d/%{public}d expected=-1/-1/4',
        broken, empty, padded);
      expect(broken).assertEqual(-1);
      expect(empty).assertEqual(-1);
      expect(padded).assertEqual(4);
      expect(padded === broken).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsB64V230093 end');
    })
  })
}
