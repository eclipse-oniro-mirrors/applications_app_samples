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
import { StatusLabel } from '../../../main/ets/util/Constants';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function statusLabelVolume01Test() {
  describe('StatusLabelVolume01Test', () => {

    /**
     * @tc.name   testStatusLabel0001
     * @tc.number SUB_CCER_STKEY_01_0001
     * @tc.desc   镜像常量 STATUS_SUBSCRIBED 映射到已订阅文案键
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStatusLabel0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0001 begin');
      const cycle: string[] = [];

      const result: string = StatusLabel.of(StatusLabel.STATUS_SUBSCRIBED);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(StatusLabel.SUBSCRIBED_KEY));
      expect(result).assertEqual(StatusLabel.SUBSCRIBED_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === StatusLabel.SUBSCRIBED_KEY));
      expect(result === StatusLabel.SUBSCRIBED_KEY).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(StatusLabel.READY_KEY !== result));
      expect(StatusLabel.READY_KEY !== result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(StatusLabel.of(StatusLabel.STATUS_SUBSCRIBED) === result));
      expect(StatusLabel.of(StatusLabel.STATUS_SUBSCRIBED) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0001 end');
    })

    /**
     * @tc.name   testStatusLabel0002
     * @tc.number SUB_CCER_STKEY_01_0002
     * @tc.desc   镜像常量 STATUS_SUBSCRIBED 的取值为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStatusLabel0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0002 begin');
      const cycle: string[] = [];

      const result: string = String(StatusLabel.STATUS_SUBSCRIBED);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1'));
      expect(result).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number(result) === 1));
      expect(Number(result) === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(StatusLabel.of(StatusLabel.STATUS_SUBSCRIBED) === StatusLabel.SUBSCRIBED_KEY));
      expect(StatusLabel.of(StatusLabel.STATUS_SUBSCRIBED) === StatusLabel.SUBSCRIBED_KEY).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 1));
      expect(result.length === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0002 end');
    })

    /**
     * @tc.name   testStatusLabel0003
     * @tc.number SUB_CCER_STKEY_01_0003
     * @tc.desc   镜像常量 STATUS_SUBSCRIBE_FAILED 映射到订阅失败文案键
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStatusLabel0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0003 begin');
      const cycle: string[] = [];

      const result: string = StatusLabel.of(StatusLabel.STATUS_SUBSCRIBE_FAILED);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(StatusLabel.SUBSCRIBE_FAILED_KEY));
      expect(result).assertEqual(StatusLabel.SUBSCRIBE_FAILED_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === StatusLabel.SUBSCRIBE_FAILED_KEY));
      expect(result === StatusLabel.SUBSCRIBE_FAILED_KEY).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(StatusLabel.READY_KEY !== result));
      expect(StatusLabel.READY_KEY !== result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(StatusLabel.of(StatusLabel.STATUS_SUBSCRIBE_FAILED) === result));
      expect(StatusLabel.of(StatusLabel.STATUS_SUBSCRIBE_FAILED) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0003 end');
    })

    /**
     * @tc.name   testStatusLabel0004
     * @tc.number SUB_CCER_STKEY_01_0004
     * @tc.desc   镜像常量 STATUS_SUBSCRIBE_FAILED 的取值为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStatusLabel0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0004 begin');
      const cycle: string[] = [];

      const result: string = String(StatusLabel.STATUS_SUBSCRIBE_FAILED);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2'));
      expect(result).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number(result) === 2));
      expect(Number(result) === 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(StatusLabel.of(StatusLabel.STATUS_SUBSCRIBE_FAILED) === StatusLabel.SUBSCRIBE_FAILED_KEY));
      expect(StatusLabel.of(StatusLabel.STATUS_SUBSCRIBE_FAILED) === StatusLabel.SUBSCRIBE_FAILED_KEY).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 1));
      expect(result.length === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0004 end');
    })

    /**
     * @tc.name   testStatusLabel0005
     * @tc.number SUB_CCER_STKEY_01_0005
     * @tc.desc   镜像常量 STATUS_UNSUBSCRIBED 映射到已退订文案键
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStatusLabel0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0005 begin');
      const cycle: string[] = [];

      const result: string = StatusLabel.of(StatusLabel.STATUS_UNSUBSCRIBED);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(StatusLabel.UNSUBSCRIBED_KEY));
      expect(result).assertEqual(StatusLabel.UNSUBSCRIBED_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === StatusLabel.UNSUBSCRIBED_KEY));
      expect(result === StatusLabel.UNSUBSCRIBED_KEY).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(StatusLabel.READY_KEY !== result));
      expect(StatusLabel.READY_KEY !== result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(StatusLabel.of(StatusLabel.STATUS_UNSUBSCRIBED) === result));
      expect(StatusLabel.of(StatusLabel.STATUS_UNSUBSCRIBED) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0005 end');
    })

    /**
     * @tc.name   testStatusLabel0006
     * @tc.number SUB_CCER_STKEY_01_0006
     * @tc.desc   镜像常量 STATUS_UNSUBSCRIBED 的取值为 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStatusLabel0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0006 begin');
      const cycle: string[] = [];

      const result: string = String(StatusLabel.STATUS_UNSUBSCRIBED);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('3'));
      expect(result).assertEqual('3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number(result) === 3));
      expect(Number(result) === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(StatusLabel.of(StatusLabel.STATUS_UNSUBSCRIBED) === StatusLabel.UNSUBSCRIBED_KEY));
      expect(StatusLabel.of(StatusLabel.STATUS_UNSUBSCRIBED) === StatusLabel.UNSUBSCRIBED_KEY).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 1));
      expect(result.length === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0006 end');
    })

    /**
     * @tc.name   testStatusLabel0007
     * @tc.number SUB_CCER_STKEY_01_0007
     * @tc.desc   镜像常量 STATUS_PUBLISHING 映射到发布中文案键
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStatusLabel0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0007 begin');
      const cycle: string[] = [];

      const result: string = StatusLabel.of(StatusLabel.STATUS_PUBLISHING);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(StatusLabel.PUBLISHING_KEY));
      expect(result).assertEqual(StatusLabel.PUBLISHING_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === StatusLabel.PUBLISHING_KEY));
      expect(result === StatusLabel.PUBLISHING_KEY).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(StatusLabel.READY_KEY !== result));
      expect(StatusLabel.READY_KEY !== result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(StatusLabel.of(StatusLabel.STATUS_PUBLISHING) === result));
      expect(StatusLabel.of(StatusLabel.STATUS_PUBLISHING) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0007 end');
    })

    /**
     * @tc.name   testStatusLabel0008
     * @tc.number SUB_CCER_STKEY_01_0008
     * @tc.desc   镜像常量 STATUS_PUBLISHING 的取值为 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStatusLabel0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0008 begin');
      const cycle: string[] = [];

      const result: string = String(StatusLabel.STATUS_PUBLISHING);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('4'));
      expect(result).assertEqual('4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number(result) === 4));
      expect(Number(result) === 4).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(StatusLabel.of(StatusLabel.STATUS_PUBLISHING) === StatusLabel.PUBLISHING_KEY));
      expect(StatusLabel.of(StatusLabel.STATUS_PUBLISHING) === StatusLabel.PUBLISHING_KEY).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 1));
      expect(result.length === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0008 end');
    })

    /**
     * @tc.name   testStatusLabel0009
     * @tc.number SUB_CCER_STKEY_01_0009
     * @tc.desc   镜像常量 STATUS_PUBLISH_SUCCESS 映射到发布成功文案键
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStatusLabel0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0009 begin');
      const cycle: string[] = [];

      const result: string = StatusLabel.of(StatusLabel.STATUS_PUBLISH_SUCCESS);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(StatusLabel.PUBLISH_SUCCESS_KEY));
      expect(result).assertEqual(StatusLabel.PUBLISH_SUCCESS_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === StatusLabel.PUBLISH_SUCCESS_KEY));
      expect(result === StatusLabel.PUBLISH_SUCCESS_KEY).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(StatusLabel.READY_KEY !== result));
      expect(StatusLabel.READY_KEY !== result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(StatusLabel.of(StatusLabel.STATUS_PUBLISH_SUCCESS) === result));
      expect(StatusLabel.of(StatusLabel.STATUS_PUBLISH_SUCCESS) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0009 end');
    })

    /**
     * @tc.name   testStatusLabel0010
     * @tc.number SUB_CCER_STKEY_01_0010
     * @tc.desc   镜像常量 STATUS_PUBLISH_SUCCESS 的取值为 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStatusLabel0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0010 begin');
      const cycle: string[] = [];

      const result: string = String(StatusLabel.STATUS_PUBLISH_SUCCESS);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('5'));
      expect(result).assertEqual('5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number(result) === 5));
      expect(Number(result) === 5).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(StatusLabel.of(StatusLabel.STATUS_PUBLISH_SUCCESS) === StatusLabel.PUBLISH_SUCCESS_KEY));
      expect(StatusLabel.of(StatusLabel.STATUS_PUBLISH_SUCCESS) === StatusLabel.PUBLISH_SUCCESS_KEY).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 1));
      expect(result.length === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0010 end');
    })

    /**
     * @tc.name   testStatusLabel0011
     * @tc.number SUB_CCER_STKEY_01_0011
     * @tc.desc   镜像常量 STATUS_PUBLISH_FAILED 映射到发布失败文案键
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStatusLabel0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0011 begin');
      const cycle: string[] = [];

      const result: string = StatusLabel.of(StatusLabel.STATUS_PUBLISH_FAILED);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(StatusLabel.PUBLISH_FAILED_KEY));
      expect(result).assertEqual(StatusLabel.PUBLISH_FAILED_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === StatusLabel.PUBLISH_FAILED_KEY));
      expect(result === StatusLabel.PUBLISH_FAILED_KEY).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(StatusLabel.READY_KEY !== result));
      expect(StatusLabel.READY_KEY !== result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(StatusLabel.of(StatusLabel.STATUS_PUBLISH_FAILED) === result));
      expect(StatusLabel.of(StatusLabel.STATUS_PUBLISH_FAILED) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0011 end');
    })

    /**
     * @tc.name   testStatusLabel0012
     * @tc.number SUB_CCER_STKEY_01_0012
     * @tc.desc   镜像常量 STATUS_PUBLISH_FAILED 的取值为 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStatusLabel0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0012 begin');
      const cycle: string[] = [];

      const result: string = String(StatusLabel.STATUS_PUBLISH_FAILED);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('6'));
      expect(result).assertEqual('6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number(result) === 6));
      expect(Number(result) === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(StatusLabel.of(StatusLabel.STATUS_PUBLISH_FAILED) === StatusLabel.PUBLISH_FAILED_KEY));
      expect(StatusLabel.of(StatusLabel.STATUS_PUBLISH_FAILED) === StatusLabel.PUBLISH_FAILED_KEY).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 1));
      expect(result.length === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0012 end');
    })

    /**
     * @tc.name   testStatusLabel0013
     * @tc.number SUB_CCER_STKEY_01_0013
     * @tc.desc   镜像常量 STATUS_EVENT_RECEIVED 映射到已接收事件文案键
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStatusLabel0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0013 begin');
      const cycle: string[] = [];

      const result: string = StatusLabel.of(StatusLabel.STATUS_EVENT_RECEIVED);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(StatusLabel.EVENT_RECEIVED_KEY));
      expect(result).assertEqual(StatusLabel.EVENT_RECEIVED_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === StatusLabel.EVENT_RECEIVED_KEY));
      expect(result === StatusLabel.EVENT_RECEIVED_KEY).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(StatusLabel.READY_KEY !== result));
      expect(StatusLabel.READY_KEY !== result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(StatusLabel.of(StatusLabel.STATUS_EVENT_RECEIVED) === result));
      expect(StatusLabel.of(StatusLabel.STATUS_EVENT_RECEIVED) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0013 end');
    })

    /**
     * @tc.name   testStatusLabel0014
     * @tc.number SUB_CCER_STKEY_01_0014
     * @tc.desc   镜像常量 STATUS_EVENT_RECEIVED 的取值为 7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStatusLabel0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0014 begin');
      const cycle: string[] = [];

      const result: string = String(StatusLabel.STATUS_EVENT_RECEIVED);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('7'));
      expect(result).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number(result) === 7));
      expect(Number(result) === 7).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(StatusLabel.of(StatusLabel.STATUS_EVENT_RECEIVED) === StatusLabel.EVENT_RECEIVED_KEY));
      expect(StatusLabel.of(StatusLabel.STATUS_EVENT_RECEIVED) === StatusLabel.EVENT_RECEIVED_KEY).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 1));
      expect(result.length === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0014 end');
    })

    /**
     * @tc.name   testStatusLabel0015
     * @tc.number SUB_CCER_STKEY_01_0015
     * @tc.desc   镜像常量 STATUS_CLEARED 映射到已清空文案键
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStatusLabel0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0015 begin');
      const cycle: string[] = [];

      const result: string = StatusLabel.of(StatusLabel.STATUS_CLEARED);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(StatusLabel.CLEARED_KEY));
      expect(result).assertEqual(StatusLabel.CLEARED_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === StatusLabel.CLEARED_KEY));
      expect(result === StatusLabel.CLEARED_KEY).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(StatusLabel.READY_KEY !== result));
      expect(StatusLabel.READY_KEY !== result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(StatusLabel.of(StatusLabel.STATUS_CLEARED) === result));
      expect(StatusLabel.of(StatusLabel.STATUS_CLEARED) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0015 end');
    })

    /**
     * @tc.name   testStatusLabel0016
     * @tc.number SUB_CCER_STKEY_01_0016
     * @tc.desc   镜像常量 STATUS_CLEARED 的取值为 8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStatusLabel0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0016 begin');
      const cycle: string[] = [];

      const result: string = String(StatusLabel.STATUS_CLEARED);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('8'));
      expect(result).assertEqual('8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number(result) === 8));
      expect(Number(result) === 8).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(StatusLabel.of(StatusLabel.STATUS_CLEARED) === StatusLabel.CLEARED_KEY));
      expect(StatusLabel.of(StatusLabel.STATUS_CLEARED) === StatusLabel.CLEARED_KEY).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 1));
      expect(result.length === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0016 end');
    })

    /**
     * @tc.name   testStatusLabel0017
     * @tc.number SUB_CCER_STKEY_01_0017
     * @tc.desc   零值状态回退为就绪文案键
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStatusLabel0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0017 begin');
      const cycle: string[] = [];

      const result: string = StatusLabel.of(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(StatusLabel.READY_KEY));
      expect(result).assertEqual(StatusLabel.READY_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(StatusLabel.of(0) === StatusLabel.READY_KEY));
      expect(StatusLabel.of(0) === StatusLabel.READY_KEY).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === StatusLabel.READY_KEY));
      expect(result === StatusLabel.READY_KEY).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(StatusLabel.SUBSCRIBED_KEY !== result));
      expect(StatusLabel.SUBSCRIBED_KEY !== result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0017 end');
    })

    /**
     * @tc.name   testStatusLabel0018
     * @tc.number SUB_CCER_STKEY_01_0018
     * @tc.desc   负一状态回退为就绪文案键
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStatusLabel0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0018 begin');
      const cycle: string[] = [];

      const result: string = StatusLabel.of(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(StatusLabel.READY_KEY));
      expect(result).assertEqual(StatusLabel.READY_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(StatusLabel.of(-1) === StatusLabel.READY_KEY));
      expect(StatusLabel.of(-1) === StatusLabel.READY_KEY).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === StatusLabel.READY_KEY));
      expect(result === StatusLabel.READY_KEY).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(StatusLabel.SUBSCRIBED_KEY !== result));
      expect(StatusLabel.SUBSCRIBED_KEY !== result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0018 end');
    })

    /**
     * @tc.name   testStatusLabel0019
     * @tc.number SUB_CCER_STKEY_01_0019
     * @tc.desc   紧邻上界的状态回退为就绪文案键
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStatusLabel0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0019 begin');
      const cycle: string[] = [];

      const result: string = StatusLabel.of(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(StatusLabel.READY_KEY));
      expect(result).assertEqual(StatusLabel.READY_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(StatusLabel.of(9) === StatusLabel.READY_KEY));
      expect(StatusLabel.of(9) === StatusLabel.READY_KEY).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === StatusLabel.READY_KEY));
      expect(result === StatusLabel.READY_KEY).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(StatusLabel.SUBSCRIBED_KEY !== result));
      expect(StatusLabel.SUBSCRIBED_KEY !== result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0019 end');
    })

    /**
     * @tc.name   testStatusLabel0020
     * @tc.number SUB_CCER_STKEY_01_0020
     * @tc.desc   越过上界的状态回退为就绪文案键
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStatusLabel0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0020 begin');
      const cycle: string[] = [];

      const result: string = StatusLabel.of(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(StatusLabel.READY_KEY));
      expect(result).assertEqual(StatusLabel.READY_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(StatusLabel.of(10) === StatusLabel.READY_KEY));
      expect(StatusLabel.of(10) === StatusLabel.READY_KEY).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === StatusLabel.READY_KEY));
      expect(result === StatusLabel.READY_KEY).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(StatusLabel.SUBSCRIBED_KEY !== result));
      expect(StatusLabel.SUBSCRIBED_KEY !== result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0020 end');
    })

    /**
     * @tc.name   testStatusLabel0021
     * @tc.number SUB_CCER_STKEY_01_0021
     * @tc.desc   较大状态值回退为就绪文案键
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStatusLabel0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0021 begin');
      const cycle: string[] = [];

      const result: string = StatusLabel.of(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(StatusLabel.READY_KEY));
      expect(result).assertEqual(StatusLabel.READY_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(StatusLabel.of(100) === StatusLabel.READY_KEY));
      expect(StatusLabel.of(100) === StatusLabel.READY_KEY).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === StatusLabel.READY_KEY));
      expect(result === StatusLabel.READY_KEY).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(StatusLabel.SUBSCRIBED_KEY !== result));
      expect(StatusLabel.SUBSCRIBED_KEY !== result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0021 end');
    })

    /**
     * @tc.name   testStatusLabel0022
     * @tc.number SUB_CCER_STKEY_01_0022
     * @tc.desc   较大负状态值回退为就绪文案键
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStatusLabel0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0022 begin');
      const cycle: string[] = [];

      const result: string = StatusLabel.of(-100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(StatusLabel.READY_KEY));
      expect(result).assertEqual(StatusLabel.READY_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(StatusLabel.of(-100) === StatusLabel.READY_KEY));
      expect(StatusLabel.of(-100) === StatusLabel.READY_KEY).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === StatusLabel.READY_KEY));
      expect(result === StatusLabel.READY_KEY).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(StatusLabel.SUBSCRIBED_KEY !== result));
      expect(StatusLabel.SUBSCRIBED_KEY !== result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0022 end');
    })

    /**
     * @tc.name   testStatusLabel0023
     * @tc.number SUB_CCER_STKEY_01_0023
     * @tc.desc   小数状态回退为就绪文案键
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStatusLabel0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0023 begin');
      const cycle: string[] = [];

      const result: string = StatusLabel.of(1.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(StatusLabel.READY_KEY));
      expect(result).assertEqual(StatusLabel.READY_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(StatusLabel.of(1.5) === StatusLabel.READY_KEY));
      expect(StatusLabel.of(1.5) === StatusLabel.READY_KEY).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === StatusLabel.READY_KEY));
      expect(result === StatusLabel.READY_KEY).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(StatusLabel.SUBSCRIBED_KEY !== result));
      expect(StatusLabel.SUBSCRIBED_KEY !== result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0023 end');
    })

    /**
     * @tc.name   testStatusLabel0024
     * @tc.number SUB_CCER_STKEY_01_0024
     * @tc.desc   三位数状态回退为就绪文案键
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStatusLabel0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0024 begin');
      const cycle: string[] = [];

      const result: string = StatusLabel.of(999);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(StatusLabel.READY_KEY));
      expect(result).assertEqual(StatusLabel.READY_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(StatusLabel.of(999) === StatusLabel.READY_KEY));
      expect(StatusLabel.of(999) === StatusLabel.READY_KEY).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === StatusLabel.READY_KEY));
      expect(result === StatusLabel.READY_KEY).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(StatusLabel.SUBSCRIBED_KEY !== result));
      expect(StatusLabel.SUBSCRIBED_KEY !== result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0024 end');
    })

    /**
     * @tc.name   testStatusLabel0025
     * @tc.number SUB_CCER_STKEY_01_0025
     * @tc.desc   幂次状态值回退为就绪文案键
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStatusLabel0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0025 begin');
      const cycle: string[] = [];

      const result: string = StatusLabel.of(1024);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(StatusLabel.READY_KEY));
      expect(result).assertEqual(StatusLabel.READY_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(StatusLabel.of(1024) === StatusLabel.READY_KEY));
      expect(StatusLabel.of(1024) === StatusLabel.READY_KEY).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === StatusLabel.READY_KEY));
      expect(result === StatusLabel.READY_KEY).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(StatusLabel.SUBSCRIBED_KEY !== result));
      expect(StatusLabel.SUBSCRIBED_KEY !== result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0025 end');
    })

    /**
     * @tc.name   testStatusLabel0026
     * @tc.number SUB_CCER_STKEY_01_0026
     * @tc.desc   三十二位上界外状态回退为就绪文案键
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStatusLabel0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0026 begin');
      const cycle: string[] = [];

      const result: string = StatusLabel.of(2147483648);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(StatusLabel.READY_KEY));
      expect(result).assertEqual(StatusLabel.READY_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(StatusLabel.of(2147483648) === StatusLabel.READY_KEY));
      expect(StatusLabel.of(2147483648) === StatusLabel.READY_KEY).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === StatusLabel.READY_KEY));
      expect(result === StatusLabel.READY_KEY).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(StatusLabel.SUBSCRIBED_KEY !== result));
      expect(StatusLabel.SUBSCRIBED_KEY !== result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0026 end');
    })

    /**
     * @tc.name   testStatusLabel0027
     * @tc.number SUB_CCER_STKEY_01_0027
     * @tc.desc   最大安全整数状态回退为就绪文案键
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStatusLabel0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0027 begin');
      const cycle: string[] = [];

      const result: string = StatusLabel.of(9007199254740992);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(StatusLabel.READY_KEY));
      expect(result).assertEqual(StatusLabel.READY_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(StatusLabel.of(9007199254740992) === StatusLabel.READY_KEY));
      expect(StatusLabel.of(9007199254740992) === StatusLabel.READY_KEY).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === StatusLabel.READY_KEY));
      expect(result === StatusLabel.READY_KEY).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(StatusLabel.SUBSCRIBED_KEY !== result));
      expect(StatusLabel.SUBSCRIBED_KEY !== result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0027 end');
    })

    /**
     * @tc.name   testStatusLabel0028
     * @tc.number SUB_CCER_STKEY_01_0028
     * @tc.desc   非数值状态回退为就绪文案键
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStatusLabel0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0028 begin');
      const cycle: string[] = [];

      const result: string = StatusLabel.of(Number.NaN);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(StatusLabel.READY_KEY));
      expect(result).assertEqual(StatusLabel.READY_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(StatusLabel.of(Number.NaN) === StatusLabel.READY_KEY));
      expect(StatusLabel.of(Number.NaN) === StatusLabel.READY_KEY).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === StatusLabel.READY_KEY));
      expect(result === StatusLabel.READY_KEY).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(StatusLabel.SUBSCRIBED_KEY !== result));
      expect(StatusLabel.SUBSCRIBED_KEY !== result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0028 end');
    })

    /**
     * @tc.name   testStatusLabel0029
     * @tc.number SUB_CCER_STKEY_01_0029
     * @tc.desc   负零状态回退为就绪文案键
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStatusLabel0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0029 begin');
      const cycle: string[] = [];

      const result: string = StatusLabel.of(-0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(StatusLabel.READY_KEY));
      expect(result).assertEqual(StatusLabel.READY_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(StatusLabel.of(-0) === StatusLabel.READY_KEY));
      expect(StatusLabel.of(-0) === StatusLabel.READY_KEY).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === StatusLabel.READY_KEY));
      expect(result === StatusLabel.READY_KEY).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(StatusLabel.SUBSCRIBED_KEY !== result));
      expect(StatusLabel.SUBSCRIBED_KEY !== result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0029 end');
    })

    /**
     * @tc.name   testStatusLabel0030
     * @tc.number SUB_CCER_STKEY_01_0030
     * @tc.desc   状态文案键统一携带 status_ 前缀
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStatusLabel0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0030 begin');
      const cycle: string[] = [];

      const result: string = StatusLabel.PREFIX;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('status_'));
      expect(result).assertEqual('status_');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(StatusLabel.READY_KEY.indexOf(StatusLabel.PREFIX) === 0));
      expect(StatusLabel.READY_KEY.indexOf(StatusLabel.PREFIX) === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(StatusLabel.EVENT_RECEIVED_KEY.indexOf(StatusLabel.PREFIX) === 0));
      expect(StatusLabel.EVENT_RECEIVED_KEY.indexOf(StatusLabel.PREFIX) === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(StatusLabel.CLEARED_KEY.indexOf(StatusLabel.PREFIX) === 0));
      expect(StatusLabel.CLEARED_KEY.indexOf(StatusLabel.PREFIX) === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0030 end');
    })

    /**
     * @tc.name   testStatusLabel0031
     * @tc.number SUB_CCER_STKEY_01_0031
     * @tc.desc   状态生命周期五键依次取出且各不相同
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStatusLabel0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0031 begin');
      const cycle: string[] = [];
      cycle.push(StatusLabel.of(0)); cycle.push(StatusLabel.of(4)); cycle.push(StatusLabel.of(5));
        cycle.push(StatusLabel.of(7)); cycle.push(StatusLabel.of(8));
      const result: string = String(cycle.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('5'));
      expect(result).assertEqual('5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(cycle[0]), String(StatusLabel.READY_KEY));
      expect(cycle[0]).assertEqual(StatusLabel.READY_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(cycle[4]), String(StatusLabel.CLEARED_KEY));
      expect(cycle[4]).assertEqual(StatusLabel.CLEARED_KEY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(cycle[1] === StatusLabel.PUBLISHING_KEY && cycle[2] === StatusLabel.PUBLISH_SUCCESS_KEY));
      expect(cycle[1] === StatusLabel.PUBLISHING_KEY && cycle[2] === StatusLabel.PUBLISH_SUCCESS_KEY).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStatusLabel0031 end');
    })

  })
}
