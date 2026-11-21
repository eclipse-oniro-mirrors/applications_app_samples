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
import { CommonEventPublisher, PublishOptions, PublishRequest } from '../../../main/ets/feature/CommonEventPublisher';
import { CommonEventConstants } from '../../../main/ets/util/Constants';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function publishOptionsVolume01Test() {
  describe('PublishOptionsVolume01Test', () => {

    /**
     * @tc.name   testPublishOptions0001
     * @tc.number SUB_CCER_PUBOPT_01_0001
     * @tc.desc   省略事件名时数据 InApp 组装为默认事件名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishOptions0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0001 begin');
      const bigData: string = 'x'.repeat(65537);
      const maxData: string = 'x'.repeat(65536);

      const options: PublishOptions = { data: 'InApp', sourceCode: 1002 };
      const request: PublishRequest = CommonEventPublisher.buildRequest(options);
      const result: string = request.eventName;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(CommonEventConstants.EVENT_NAME));
      expect(result).assertEqual(CommonEventConstants.EVENT_NAME);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.code === 1002));
      expect(request.publishData.code === 1002).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.isOrdered === false));
      expect(request.publishData.isOrdered === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(request.publishData.data), String('InApp'));
      expect(request.publishData.data).assertEqual('InApp');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0001 end');
    })

    /**
     * @tc.name   testPublishOptions0002
     * @tc.number SUB_CCER_PUBOPT_01_0002
     * @tc.desc   省略事件名时数据 OutApp 组装为默认事件名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishOptions0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0002 begin');
      const bigData: string = 'x'.repeat(65537);
      const maxData: string = 'x'.repeat(65536);

      const options: PublishOptions = { data: 'OutApp', sourceCode: 1001, ordered: true };
      const request: PublishRequest = CommonEventPublisher.buildRequest(options);
      const result: string = request.eventName;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(CommonEventConstants.EVENT_NAME));
      expect(result).assertEqual(CommonEventConstants.EVENT_NAME);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.code === 1001));
      expect(request.publishData.code === 1001).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.isOrdered === true));
      expect(request.publishData.isOrdered === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(request.publishData.data), String('OutApp'));
      expect(request.publishData.data).assertEqual('OutApp');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0002 end');
    })

    /**
     * @tc.name   testPublishOptions0003
     * @tc.number SUB_CCER_PUBOPT_01_0003
     * @tc.desc   省略事件名时数据 Custom 文本 组装为默认事件名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishOptions0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0003 begin');
      const bigData: string = 'x'.repeat(65537);
      const maxData: string = 'x'.repeat(65536);

      const options: PublishOptions = { data: 'Custom 文本', sourceCode: 999 };
      const request: PublishRequest = CommonEventPublisher.buildRequest(options);
      const result: string = request.eventName;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(CommonEventConstants.EVENT_NAME));
      expect(result).assertEqual(CommonEventConstants.EVENT_NAME);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.code === 999));
      expect(request.publishData.code === 999).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.isOrdered === false));
      expect(request.publishData.isOrdered === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(request.publishData.data), String('Custom 文本'));
      expect(request.publishData.data).assertEqual('Custom 文本');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0003 end');
    })

    /**
     * @tc.name   testPublishOptions0004
     * @tc.number SUB_CCER_PUBOPT_01_0004
     * @tc.desc   省略事件名时空数据请求 组装为默认事件名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishOptions0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0004 begin');
      const bigData: string = 'x'.repeat(65537);
      const maxData: string = 'x'.repeat(65536);

      const options: PublishOptions = { data: '', sourceCode: 0 };
      const request: PublishRequest = CommonEventPublisher.buildRequest(options);
      const result: string = request.eventName;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(CommonEventConstants.EVENT_NAME));
      expect(result).assertEqual(CommonEventConstants.EVENT_NAME);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.code === 0));
      expect(request.publishData.code === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.isOrdered === false));
      expect(request.publishData.isOrdered === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(request.publishData.data), String(''));
      expect(request.publishData.data).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0004 end');
    })

    /**
     * @tc.name   testPublishOptions0005
     * @tc.number SUB_CCER_PUBOPT_01_0005
     * @tc.desc   省略事件名时数据 OutApp 组装为默认事件名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishOptions0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0005 begin');
      const bigData: string = 'x'.repeat(65537);
      const maxData: string = 'x'.repeat(65536);

      const options: PublishOptions = { data: 'OutApp', sourceCode: -1, ordered: false };
      const request: PublishRequest = CommonEventPublisher.buildRequest(options);
      const result: string = request.eventName;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(CommonEventConstants.EVENT_NAME));
      expect(result).assertEqual(CommonEventConstants.EVENT_NAME);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.code === -1));
      expect(request.publishData.code === -1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.isOrdered === false));
      expect(request.publishData.isOrdered === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(request.publishData.data), String('OutApp'));
      expect(request.publishData.data).assertEqual('OutApp');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0005 end');
    })

    /**
     * @tc.name   testPublishOptions0006
     * @tc.number SUB_CCER_PUBOPT_01_0006
     * @tc.desc   省略事件名时数据 InApp 组装为默认事件名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishOptions0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0006 begin');
      const bigData: string = 'x'.repeat(65537);
      const maxData: string = 'x'.repeat(65536);

      const options: PublishOptions = { data: 'InApp', sourceCode: 1, ordered: true };
      const request: PublishRequest = CommonEventPublisher.buildRequest(options);
      const result: string = request.eventName;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(CommonEventConstants.EVENT_NAME));
      expect(result).assertEqual(CommonEventConstants.EVENT_NAME);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.code === 1));
      expect(request.publishData.code === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.isOrdered === true));
      expect(request.publishData.isOrdered === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(request.publishData.data), String('InApp'));
      expect(request.publishData.data).assertEqual('InApp');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0006 end');
    })

    /**
     * @tc.name   testPublishOptions0007
     * @tc.number SUB_CCER_PUBOPT_01_0007
     * @tc.desc   省略事件名时数据 OutApp 组装为默认事件名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishOptions0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0007 begin');
      const bigData: string = 'x'.repeat(65537);
      const maxData: string = 'x'.repeat(65536);

      const options: PublishOptions = { data: 'OutApp', sourceCode: 2048 };
      const request: PublishRequest = CommonEventPublisher.buildRequest(options);
      const result: string = request.eventName;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(CommonEventConstants.EVENT_NAME));
      expect(result).assertEqual(CommonEventConstants.EVENT_NAME);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.code === 2048));
      expect(request.publishData.code === 2048).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.isOrdered === false));
      expect(request.publishData.isOrdered === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(request.publishData.data), String('OutApp'));
      expect(request.publishData.data).assertEqual('OutApp');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0007 end');
    })

    /**
     * @tc.name   testPublishOptions0008
     * @tc.number SUB_CCER_PUBOPT_01_0008
     * @tc.desc   省略事件名时数据 InApp 组装为默认事件名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishOptions0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0008 begin');
      const bigData: string = 'x'.repeat(65537);
      const maxData: string = 'x'.repeat(65536);

      const options: PublishOptions = { data: 'InApp', sourceCode: 7, ordered: false };
      const request: PublishRequest = CommonEventPublisher.buildRequest(options);
      const result: string = request.eventName;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(CommonEventConstants.EVENT_NAME));
      expect(result).assertEqual(CommonEventConstants.EVENT_NAME);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.code === 7));
      expect(request.publishData.code === 7).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.isOrdered === false));
      expect(request.publishData.isOrdered === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(request.publishData.data), String('InApp'));
      expect(request.publishData.data).assertEqual('InApp');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0008 end');
    })

    /**
     * @tc.name   testPublishOptions0009
     * @tc.number SUB_CCER_PUBOPT_01_0009
     * @tc.desc   省略事件名时数据 InApp 组装为默认事件名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishOptions0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0009 begin');
      const bigData: string = 'x'.repeat(65537);
      const maxData: string = 'x'.repeat(65536);

      const options: PublishOptions = { data: 'InApp', sourceCode: 42, ordered: true };
      const request: PublishRequest = CommonEventPublisher.buildRequest(options);
      const result: string = request.eventName;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(CommonEventConstants.EVENT_NAME));
      expect(result).assertEqual(CommonEventConstants.EVENT_NAME);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.code === 42));
      expect(request.publishData.code === 42).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.isOrdered === true));
      expect(request.publishData.isOrdered === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(request.publishData.data), String('InApp'));
      expect(request.publishData.data).assertEqual('InApp');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0009 end');
    })

    /**
     * @tc.name   testPublishOptions0010
     * @tc.number SUB_CCER_PUBOPT_01_0010
     * @tc.desc   自定义点分事件名组装时事件名原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishOptions0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0010 begin');
      const bigData: string = 'x'.repeat(65537);
      const maxData: string = 'x'.repeat(65536);

      const options: PublishOptions = { data: 'InApp', sourceCode: 1002, eventName: 'custom.event.name' };
      const request: PublishRequest = CommonEventPublisher.buildRequest(options);
      const result: string = request.eventName;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('custom.event.name'));
      expect(result).assertEqual('custom.event.name');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.data === 'InApp'));
      expect(request.publishData.data === 'InApp').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.isOrdered === false));
      expect(request.publishData.isOrdered === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0010 end');
    })

    /**
     * @tc.name   testPublishOptions0011
     * @tc.number SUB_CCER_PUBOPT_01_0011
     * @tc.desc   默认事件名原样传入组装时事件名原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishOptions0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0011 begin');
      const bigData: string = 'x'.repeat(65537);
      const maxData: string = 'x'.repeat(65536);

      const options: PublishOptions = { data: 'InApp', sourceCode: 1002, eventName: 'Acts_CommonEvent_Test' };
      const request: PublishRequest = CommonEventPublisher.buildRequest(options);
      const result: string = request.eventName;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('Acts_CommonEvent_Test'));
      expect(result).assertEqual('Acts_CommonEvent_Test');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.data === 'InApp'));
      expect(request.publishData.data === 'InApp').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.isOrdered === false));
      expect(request.publishData.isOrdered === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0011 end');
    })

    /**
     * @tc.name   testPublishOptions0012
     * @tc.number SUB_CCER_PUBOPT_01_0012
     * @tc.desc   单字符事件名组装时事件名原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishOptions0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0012 begin');
      const bigData: string = 'x'.repeat(65537);
      const maxData: string = 'x'.repeat(65536);

      const options: PublishOptions = { data: 'InApp', sourceCode: 1002, eventName: 'a' };
      const request: PublishRequest = CommonEventPublisher.buildRequest(options);
      const result: string = request.eventName;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('a'));
      expect(result).assertEqual('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.data === 'InApp'));
      expect(request.publishData.data === 'InApp').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.isOrdered === false));
      expect(request.publishData.isOrdered === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0012 end');
    })

    /**
     * @tc.name   testPublishOptions0013
     * @tc.number SUB_CCER_PUBOPT_01_0013
     * @tc.desc   中文事件名组装时事件名原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishOptions0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0013 begin');
      const bigData: string = 'x'.repeat(65537);
      const maxData: string = 'x'.repeat(65536);

      const options: PublishOptions = { data: 'InApp', sourceCode: 1002, eventName: '中文名' };
      const request: PublishRequest = CommonEventPublisher.buildRequest(options);
      const result: string = request.eventName;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('中文名'));
      expect(result).assertEqual('中文名');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.data === 'InApp'));
      expect(request.publishData.data === 'InApp').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.isOrdered === false));
      expect(request.publishData.isOrdered === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0013 end');
    })

    /**
     * @tc.name   testPublishOptions0014
     * @tc.number SUB_CCER_PUBOPT_01_0014
     * @tc.desc   内部空格事件名组装时事件名原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishOptions0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0014 begin');
      const bigData: string = 'x'.repeat(65537);
      const maxData: string = 'x'.repeat(65536);

      const options: PublishOptions = { data: 'InApp', sourceCode: 1002, eventName: 'name with inner spaces' };
      const request: PublishRequest = CommonEventPublisher.buildRequest(options);
      const result: string = request.eventName;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('name with inner spaces'));
      expect(result).assertEqual('name with inner spaces');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.data === 'InApp'));
      expect(request.publishData.data === 'InApp').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.isOrdered === false));
      expect(request.publishData.isOrdered === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0014 end');
    })

    /**
     * @tc.name   testPublishOptions0015
     * @tc.number SUB_CCER_PUBOPT_01_0015
     * @tc.desc   含制表符事件名组装时事件名原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishOptions0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0015 begin');
      const bigData: string = 'x'.repeat(65537);
      const maxData: string = 'x'.repeat(65536);

      const options: PublishOptions = { data: 'InApp', sourceCode: 1002, eventName: 'tab\tname' };
      const request: PublishRequest = CommonEventPublisher.buildRequest(options);
      const result: string = request.eventName;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('tab\tname'));
      expect(result).assertEqual('tab\tname');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.data === 'InApp'));
      expect(request.publishData.data === 'InApp').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.isOrdered === false));
      expect(request.publishData.isOrdered === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0015 end');
    })

    /**
     * @tc.name   testPublishOptions0016
     * @tc.number SUB_CCER_PUBOPT_01_0016
     * @tc.desc   另一测试事件名组装时事件名原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishOptions0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0016 begin');
      const bigData: string = 'x'.repeat(65537);
      const maxData: string = 'x'.repeat(65536);

      const options: PublishOptions = { data: 'InApp', sourceCode: 1002, eventName: 'Acts_Another_Test' };
      const request: PublishRequest = CommonEventPublisher.buildRequest(options);
      const result: string = request.eventName;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('Acts_Another_Test'));
      expect(result).assertEqual('Acts_Another_Test');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.data === 'InApp'));
      expect(request.publishData.data === 'InApp').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.isOrdered === false));
      expect(request.publishData.isOrdered === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0016 end');
    })

    /**
     * @tc.name   testPublishOptions0017
     * @tc.number SUB_CCER_PUBOPT_01_0017
     * @tc.desc   空事件名在组装阶段不拦截而由发布前校验处理
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishOptions0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0017 begin');
      const bigData: string = 'x'.repeat(65537);
      const maxData: string = 'x'.repeat(65536);

      const options: PublishOptions = { data: 'InApp', sourceCode: 1002, eventName: '' };
      const request: PublishRequest = CommonEventPublisher.buildRequest(options);
      const result: string = request.eventName;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.code === 1002));
      expect(request.publishData.code === 1002).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(request.publishData.data), String('InApp'));
      expect(request.publishData.data).assertEqual('InApp');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0017 end');
    })

    /**
     * @tc.name   testPublishOptions0018
     * @tc.number SUB_CCER_PUBOPT_01_0018
     * @tc.desc   纯空格事件名在组装阶段不拦截而由发布前校验处理
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishOptions0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0018 begin');
      const bigData: string = 'x'.repeat(65537);
      const maxData: string = 'x'.repeat(65536);

      const options: PublishOptions = { data: 'InApp', sourceCode: 1002, eventName: ' ' };
      const request: PublishRequest = CommonEventPublisher.buildRequest(options);
      const result: string = request.eventName;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(' '));
      expect(result).assertEqual(' ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.code === 1002));
      expect(request.publishData.code === 1002).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(request.publishData.data), String('InApp'));
      expect(request.publishData.data).assertEqual('InApp');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0018 end');
    })

    /**
     * @tc.name   testPublishOptions0019
     * @tc.number SUB_CCER_PUBOPT_01_0019
     * @tc.desc   省略有序参数时组装为无序事件
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishOptions0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0019 begin');
      const bigData: string = 'x'.repeat(65537);
      const maxData: string = 'x'.repeat(65536);

      const options: PublishOptions = { data: 'InApp', sourceCode: 1002 };
      const request: PublishRequest = CommonEventPublisher.buildRequest(options);
      const result: string = String(request.publishData.isOrdered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(request.eventName === CommonEventConstants.EVENT_NAME));
      expect(request.eventName === CommonEventConstants.EVENT_NAME).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(request.publishData.data), String('InApp'));
      expect(request.publishData.data).assertEqual('InApp');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0019 end');
    })

    /**
     * @tc.name   testPublishOptions0020
     * @tc.number SUB_CCER_PUBOPT_01_0020
     * @tc.desc   显式有序参数组装为有序事件
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishOptions0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0020 begin');
      const bigData: string = 'x'.repeat(65537);
      const maxData: string = 'x'.repeat(65536);

      const options: PublishOptions = { data: 'InApp', sourceCode: 1002, ordered: true };
      const request: PublishRequest = CommonEventPublisher.buildRequest(options);
      const result: string = String(request.publishData.isOrdered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(request.eventName === CommonEventConstants.EVENT_NAME));
      expect(request.eventName === CommonEventConstants.EVENT_NAME).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(request.publishData.data), String('InApp'));
      expect(request.publishData.data).assertEqual('InApp');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0020 end');
    })

    /**
     * @tc.name   testPublishOptions0021
     * @tc.number SUB_CCER_PUBOPT_01_0021
     * @tc.desc   显式无序参数组装为无序事件
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishOptions0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0021 begin');
      const bigData: string = 'x'.repeat(65537);
      const maxData: string = 'x'.repeat(65536);

      const options: PublishOptions = { data: 'InApp', sourceCode: 1002, ordered: false };
      const request: PublishRequest = CommonEventPublisher.buildRequest(options);
      const result: string = String(request.publishData.isOrdered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(request.eventName === CommonEventConstants.EVENT_NAME));
      expect(request.eventName === CommonEventConstants.EVENT_NAME).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(request.publishData.data), String('InApp'));
      expect(request.publishData.data).assertEqual('InApp');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0021 end');
    })

    /**
     * @tc.name   testPublishOptions0022
     * @tc.number SUB_CCER_PUBOPT_01_0022
     * @tc.desc   来源码 0 组装时原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishOptions0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0022 begin');
      const bigData: string = 'x'.repeat(65537);
      const maxData: string = 'x'.repeat(65536);

      const options: PublishOptions = { data: 'InApp', sourceCode: 0 };
      const request: PublishRequest = CommonEventPublisher.buildRequest(options);
      const result: string = String(request.publishData.code);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(result).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.code === 0));
      expect(request.publishData.code === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(request.eventName === CommonEventConstants.EVENT_NAME));
      expect(request.eventName === CommonEventConstants.EVENT_NAME).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0022 end');
    })

    /**
     * @tc.name   testPublishOptions0023
     * @tc.number SUB_CCER_PUBOPT_01_0023
     * @tc.desc   来源码 1 组装时原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishOptions0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0023 begin');
      const bigData: string = 'x'.repeat(65537);
      const maxData: string = 'x'.repeat(65536);

      const options: PublishOptions = { data: 'InApp', sourceCode: 1 };
      const request: PublishRequest = CommonEventPublisher.buildRequest(options);
      const result: string = String(request.publishData.code);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1'));
      expect(result).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.code === 1));
      expect(request.publishData.code === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(request.eventName === CommonEventConstants.EVENT_NAME));
      expect(request.eventName === CommonEventConstants.EVENT_NAME).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0023 end');
    })

    /**
     * @tc.name   testPublishOptions0024
     * @tc.number SUB_CCER_PUBOPT_01_0024
     * @tc.desc   来源码 -1 组装时原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishOptions0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0024 begin');
      const bigData: string = 'x'.repeat(65537);
      const maxData: string = 'x'.repeat(65536);

      const options: PublishOptions = { data: 'InApp', sourceCode: -1 };
      const request: PublishRequest = CommonEventPublisher.buildRequest(options);
      const result: string = String(request.publishData.code);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('-1'));
      expect(result).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.code === -1));
      expect(request.publishData.code === -1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(request.eventName === CommonEventConstants.EVENT_NAME));
      expect(request.eventName === CommonEventConstants.EVENT_NAME).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0024 end');
    })

    /**
     * @tc.name   testPublishOptions0025
     * @tc.number SUB_CCER_PUBOPT_01_0025
     * @tc.desc   来源码 1001 组装时原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishOptions0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0025 begin');
      const bigData: string = 'x'.repeat(65537);
      const maxData: string = 'x'.repeat(65536);

      const options: PublishOptions = { data: 'InApp', sourceCode: 1001 };
      const request: PublishRequest = CommonEventPublisher.buildRequest(options);
      const result: string = String(request.publishData.code);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1001'));
      expect(result).assertEqual('1001');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.code === 1001));
      expect(request.publishData.code === 1001).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(request.eventName === CommonEventConstants.EVENT_NAME));
      expect(request.eventName === CommonEventConstants.EVENT_NAME).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0025 end');
    })

    /**
     * @tc.name   testPublishOptions0026
     * @tc.number SUB_CCER_PUBOPT_01_0026
     * @tc.desc   来源码 1002 组装时原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishOptions0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0026 begin');
      const bigData: string = 'x'.repeat(65537);
      const maxData: string = 'x'.repeat(65536);

      const options: PublishOptions = { data: 'InApp', sourceCode: 1002 };
      const request: PublishRequest = CommonEventPublisher.buildRequest(options);
      const result: string = String(request.publishData.code);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1002'));
      expect(result).assertEqual('1002');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.code === 1002));
      expect(request.publishData.code === 1002).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(request.eventName === CommonEventConstants.EVENT_NAME));
      expect(request.eventName === CommonEventConstants.EVENT_NAME).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0026 end');
    })

    /**
     * @tc.name   testPublishOptions0027
     * @tc.number SUB_CCER_PUBOPT_01_0027
     * @tc.desc   来源码 999 组装时原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishOptions0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0027 begin');
      const bigData: string = 'x'.repeat(65537);
      const maxData: string = 'x'.repeat(65536);

      const options: PublishOptions = { data: 'InApp', sourceCode: 999 };
      const request: PublishRequest = CommonEventPublisher.buildRequest(options);
      const result: string = String(request.publishData.code);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('999'));
      expect(result).assertEqual('999');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.code === 999));
      expect(request.publishData.code === 999).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(request.eventName === CommonEventConstants.EVENT_NAME));
      expect(request.eventName === CommonEventConstants.EVENT_NAME).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0027 end');
    })

    /**
     * @tc.name   testPublishOptions0028
     * @tc.number SUB_CCER_PUBOPT_01_0028
     * @tc.desc   来源码 2048 组装时原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishOptions0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0028 begin');
      const bigData: string = 'x'.repeat(65537);
      const maxData: string = 'x'.repeat(65536);

      const options: PublishOptions = { data: 'InApp', sourceCode: 2048 };
      const request: PublishRequest = CommonEventPublisher.buildRequest(options);
      const result: string = String(request.publishData.code);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2048'));
      expect(result).assertEqual('2048');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.code === 2048));
      expect(request.publishData.code === 2048).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(request.eventName === CommonEventConstants.EVENT_NAME));
      expect(request.eventName === CommonEventConstants.EVENT_NAME).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0028 end');
    })

    /**
     * @tc.name   testPublishOptions0029
     * @tc.number SUB_CCER_PUBOPT_01_0029
     * @tc.desc   来源码 42 组装时原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishOptions0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0029 begin');
      const bigData: string = 'x'.repeat(65537);
      const maxData: string = 'x'.repeat(65536);

      const options: PublishOptions = { data: 'InApp', sourceCode: 42 };
      const request: PublishRequest = CommonEventPublisher.buildRequest(options);
      const result: string = String(request.publishData.code);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('42'));
      expect(result).assertEqual('42');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.code === 42));
      expect(request.publishData.code === 42).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(request.eventName === CommonEventConstants.EVENT_NAME));
      expect(request.eventName === CommonEventConstants.EVENT_NAME).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0029 end');
    })

    /**
     * @tc.name   testPublishOptions0030
     * @tc.number SUB_CCER_PUBOPT_01_0030
     * @tc.desc   来源码 1000000 组装时原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishOptions0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0030 begin');
      const bigData: string = 'x'.repeat(65537);
      const maxData: string = 'x'.repeat(65536);

      const options: PublishOptions = { data: 'InApp', sourceCode: 1000000 };
      const request: PublishRequest = CommonEventPublisher.buildRequest(options);
      const result: string = String(request.publishData.code);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1000000'));
      expect(result).assertEqual('1000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.code === 1000000));
      expect(request.publishData.code === 1000000).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(request.eventName === CommonEventConstants.EVENT_NAME));
      expect(request.eventName === CommonEventConstants.EVENT_NAME).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0030 end');
    })

    /**
     * @tc.name   testPublishOptions0031
     * @tc.number SUB_CCER_PUBOPT_01_0031
     * @tc.desc   来源码 9007199254740992 组装时原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishOptions0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0031 begin');
      const bigData: string = 'x'.repeat(65537);
      const maxData: string = 'x'.repeat(65536);

      const options: PublishOptions = { data: 'InApp', sourceCode: 9007199254740992 };
      const request: PublishRequest = CommonEventPublisher.buildRequest(options);
      const result: string = String(request.publishData.code);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('9007199254740992'));
      expect(result).assertEqual('9007199254740992');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.code === 9007199254740992));
      expect(request.publishData.code === 9007199254740992).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(request.eventName === CommonEventConstants.EVENT_NAME));
      expect(request.eventName === CommonEventConstants.EVENT_NAME).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0031 end');
    })

    /**
     * @tc.name   testPublishOptions0032
     * @tc.number SUB_CCER_PUBOPT_01_0032
     * @tc.desc   应用内数据组装时逐字透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishOptions0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0032 begin');
      const bigData: string = 'x'.repeat(65537);
      const maxData: string = 'x'.repeat(65536);

      const options: PublishOptions = { data: 'InApp', sourceCode: 1002 };
      const request: PublishRequest = CommonEventPublisher.buildRequest(options);
      const result: string = request.publishData.data ?? '';
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('InApp'));
      expect(result).assertEqual('InApp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.data === result));
      expect(request.publishData.data === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(request.publishData.code)), String('1002'));
      expect(String(request.publishData.code)).assertEqual('1002');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0032 end');
    })

    /**
     * @tc.name   testPublishOptions0033
     * @tc.number SUB_CCER_PUBOPT_01_0033
     * @tc.desc   应用外数据组装时逐字透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishOptions0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0033 begin');
      const bigData: string = 'x'.repeat(65537);
      const maxData: string = 'x'.repeat(65536);

      const options: PublishOptions = { data: 'OutApp', sourceCode: 1002 };
      const request: PublishRequest = CommonEventPublisher.buildRequest(options);
      const result: string = request.publishData.data ?? '';
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('OutApp'));
      expect(result).assertEqual('OutApp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.data === result));
      expect(request.publishData.data === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(request.publishData.code)), String('1002'));
      expect(String(request.publishData.code)).assertEqual('1002');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0033 end');
    })

    /**
     * @tc.name   testPublishOptions0034
     * @tc.number SUB_CCER_PUBOPT_01_0034
     * @tc.desc   空数据组装时逐字透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishOptions0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0034 begin');
      const bigData: string = 'x'.repeat(65537);
      const maxData: string = 'x'.repeat(65536);

      const options: PublishOptions = { data: '', sourceCode: 1002 };
      const request: PublishRequest = CommonEventPublisher.buildRequest(options);
      const result: string = request.publishData.data ?? '';
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.data === result));
      expect(request.publishData.data === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(request.publishData.code)), String('1002'));
      expect(String(request.publishData.code)).assertEqual('1002');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0034 end');
    })

    /**
     * @tc.name   testPublishOptions0035
     * @tc.number SUB_CCER_PUBOPT_01_0035
     * @tc.desc   引号数据组装时逐字透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishOptions0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0035 begin');
      const bigData: string = 'x'.repeat(65537);
      const maxData: string = 'x'.repeat(65536);

      const options: PublishOptions = { data: 'say "hello"', sourceCode: 1002 };
      const request: PublishRequest = CommonEventPublisher.buildRequest(options);
      const result: string = request.publishData.data ?? '';
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('say "hello"'));
      expect(result).assertEqual('say "hello"');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.data === result));
      expect(request.publishData.data === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(request.publishData.code)), String('1002'));
      expect(String(request.publishData.code)).assertEqual('1002');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0035 end');
    })

    /**
     * @tc.name   testPublishOptions0036
     * @tc.number SUB_CCER_PUBOPT_01_0036
     * @tc.desc   反斜杠数据组装时逐字透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishOptions0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0036 begin');
      const bigData: string = 'x'.repeat(65537);
      const maxData: string = 'x'.repeat(65536);

      const options: PublishOptions = { data: 'back\\slash', sourceCode: 1002 };
      const request: PublishRequest = CommonEventPublisher.buildRequest(options);
      const result: string = request.publishData.data ?? '';
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('back\\slash'));
      expect(result).assertEqual('back\\slash');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.data === result));
      expect(request.publishData.data === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(request.publishData.code)), String('1002'));
      expect(String(request.publishData.code)).assertEqual('1002');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0036 end');
    })

    /**
     * @tc.name   testPublishOptions0037
     * @tc.number SUB_CCER_PUBOPT_01_0037
     * @tc.desc   换行数据组装时逐字透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishOptions0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0037 begin');
      const bigData: string = 'x'.repeat(65537);
      const maxData: string = 'x'.repeat(65536);

      const options: PublishOptions = { data: 'line1\nline2', sourceCode: 1002 };
      const request: PublishRequest = CommonEventPublisher.buildRequest(options);
      const result: string = request.publishData.data ?? '';
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('line1\nline2'));
      expect(result).assertEqual('line1\nline2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.data === result));
      expect(request.publishData.data === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(request.publishData.code)), String('1002'));
      expect(String(request.publishData.code)).assertEqual('1002');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0037 end');
    })

    /**
     * @tc.name   testPublishOptions0038
     * @tc.number SUB_CCER_PUBOPT_01_0038
     * @tc.desc   中英混合数据组装时逐字透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishOptions0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0038 begin');
      const bigData: string = 'x'.repeat(65537);
      const maxData: string = 'x'.repeat(65536);

      const options: PublishOptions = { data: '中英 mixed', sourceCode: 1002 };
      const request: PublishRequest = CommonEventPublisher.buildRequest(options);
      const result: string = request.publishData.data ?? '';
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('中英 mixed'));
      expect(result).assertEqual('中英 mixed');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.data === result));
      expect(request.publishData.data === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(request.publishData.code)), String('1002'));
      expect(String(request.publishData.code)).assertEqual('1002');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0038 end');
    })

    /**
     * @tc.name   testPublishOptions0039
     * @tc.number SUB_CCER_PUBOPT_01_0039
     * @tc.desc   表情符号数据组装时逐字透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishOptions0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0039 begin');
      const bigData: string = 'x'.repeat(65537);
      const maxData: string = 'x'.repeat(65536);

      const options: PublishOptions = { data: '🚀 emoji', sourceCode: 1002 };
      const request: PublishRequest = CommonEventPublisher.buildRequest(options);
      const result: string = request.publishData.data ?? '';
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('🚀 emoji'));
      expect(result).assertEqual('🚀 emoji');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.data === result));
      expect(request.publishData.data === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(request.publishData.code)), String('1002'));
      expect(String(request.publishData.code)).assertEqual('1002');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0039 end');
    })

    /**
     * @tc.name   testPublishOptions0040
     * @tc.number SUB_CCER_PUBOPT_01_0040
     * @tc.desc   带空格数据组装时逐字透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishOptions0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0040 begin');
      const bigData: string = 'x'.repeat(65537);
      const maxData: string = 'x'.repeat(65536);

      const options: PublishOptions = { data: 'a b c', sourceCode: 1002 };
      const request: PublishRequest = CommonEventPublisher.buildRequest(options);
      const result: string = request.publishData.data ?? '';
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('a b c'));
      expect(result).assertEqual('a b c');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.data === result));
      expect(request.publishData.data === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(request.publishData.code)), String('1002'));
      expect(String(request.publishData.code)).assertEqual('1002');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0040 end');
    })

    /**
     * @tc.name   testPublishOptions0041
     * @tc.number SUB_CCER_PUBOPT_01_0041
     * @tc.desc   键值对数据组装时逐字透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishOptions0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0041 begin');
      const bigData: string = 'x'.repeat(65537);
      const maxData: string = 'x'.repeat(65536);

      const options: PublishOptions = { data: 'key=value', sourceCode: 1002 };
      const request: PublishRequest = CommonEventPublisher.buildRequest(options);
      const result: string = request.publishData.data ?? '';
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('key=value'));
      expect(result).assertEqual('key=value');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.data === result));
      expect(request.publishData.data === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(request.publishData.code)), String('1002'));
      expect(String(request.publishData.code)).assertEqual('1002');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0041 end');
    })

    /**
     * @tc.name   testPublishOptions0042
     * @tc.number SUB_CCER_PUBOPT_01_0042
     * @tc.desc   数字文本数据组装时逐字透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishOptions0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0042 begin');
      const bigData: string = 'x'.repeat(65537);
      const maxData: string = 'x'.repeat(65536);

      const options: PublishOptions = { data: '127', sourceCode: 1002 };
      const request: PublishRequest = CommonEventPublisher.buildRequest(options);
      const result: string = request.publishData.data ?? '';
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('127'));
      expect(result).assertEqual('127');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.data === result));
      expect(request.publishData.data === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(request.publishData.code)), String('1002'));
      expect(String(request.publishData.code)).assertEqual('1002');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0042 end');
    })

    /**
     * @tc.name   testPublishOptions0043
     * @tc.number SUB_CCER_PUBOPT_01_0043
     * @tc.desc   空事件名的请求走发布链路时给出空名校验原因
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishOptions0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0043 begin');
      const bigData: string = 'x'.repeat(65537);
      const maxData: string = 'x'.repeat(65536);

      const options: PublishOptions = { data: 'InApp', sourceCode: 1002, eventName: '' };
      const request: PublishRequest = CommonEventPublisher.buildRequest(options);
      const result: string = CommonEventPublisher.validatePublishRequest(request.eventName, request.publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('The common event name must not be empty.'));
      expect(result).assertEqual('The common event name must not be empty.');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.data === 'InApp'));
      expect(request.publishData.data === 'InApp').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0043 end');
    })

    /**
     * @tc.name   testPublishOptions0044
     * @tc.number SUB_CCER_PUBOPT_01_0044
     * @tc.desc   首部空格事件名走发布链路时给出首尾空格校验原因
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishOptions0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0044 begin');
      const bigData: string = 'x'.repeat(65537);
      const maxData: string = 'x'.repeat(65536);

      const options: PublishOptions = { data: 'x', sourceCode: 1, eventName: ' a' };
      const request: PublishRequest = CommonEventPublisher.buildRequest(options);
      const result: string = CommonEventPublisher.validatePublishRequest(request.eventName, request.publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('The common event name must not start or end with spaces.'));
      expect(result).assertEqual('The common event name must not start or end with spaces.');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.data === 'x'));
      expect(request.publishData.data === 'x').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0044 end');
    })

    /**
     * @tc.name   testPublishOptions0045
     * @tc.number SUB_CCER_PUBOPT_01_0045
     * @tc.desc   尾部空格事件名走发布链路时给出首尾空格校验原因
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishOptions0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0045 begin');
      const bigData: string = 'x'.repeat(65537);
      const maxData: string = 'x'.repeat(65536);

      const options: PublishOptions = { data: 'x', sourceCode: 1, eventName: 'a ' };
      const request: PublishRequest = CommonEventPublisher.buildRequest(options);
      const result: string = CommonEventPublisher.validatePublishRequest(request.eventName, request.publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('The common event name must not start or end with spaces.'));
      expect(result).assertEqual('The common event name must not start or end with spaces.');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.data === 'x'));
      expect(request.publishData.data === 'x').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0045 end');
    })

    /**
     * @tc.name   testPublishOptions0046
     * @tc.number SUB_CCER_PUBOPT_01_0046
     * @tc.desc   超过 64 KB 的数据走发布链路时给出长度校验原因
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishOptions0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0046 begin');
      const bigData: string = 'x'.repeat(65537);
      const maxData: string = 'x'.repeat(65536);

      const options: PublishOptions = { data: bigData, sourceCode: 1, eventName: 'big' };
      const request: PublishRequest = CommonEventPublisher.buildRequest(options);
      const result: string = CommonEventPublisher.validatePublishRequest(request.eventName, request.publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('The event data must not exceed 64 KB.'));
      expect(result).assertEqual('The event data must not exceed 64 KB.');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(bigData.length === 65537));
      expect(bigData.length === 65537).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String((request.publishData.data ?? '').length === 65537));
      expect((request.publishData.data ?? '').length === 65537).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0046 end');
    })

    /**
     * @tc.name   testPublishOptions0047
     * @tc.number SUB_CCER_PUBOPT_01_0047
     * @tc.desc   恰为 64 KB 的数据走发布链路时校验通过
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishOptions0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0047 begin');
      const bigData: string = 'x'.repeat(65537);
      const maxData: string = 'x'.repeat(65536);

      const options: PublishOptions = { data: maxData, sourceCode: 1, eventName: 'max' };
      const request: PublishRequest = CommonEventPublisher.buildRequest(options);
      const result: string = CommonEventPublisher.validatePublishRequest(request.eventName, request.publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(maxData.length === 65536));
      expect(maxData.length === 65536).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.eventName === 'max'));
      expect(request.eventName === 'max').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0047 end');
    })

    /**
     * @tc.name   testPublishOptions0048
     * @tc.number SUB_CCER_PUBOPT_01_0048
     * @tc.desc   事件名校验原因优先于数据长度原因
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishOptions0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0048 begin');
      const bigData: string = 'x'.repeat(65537);
      const maxData: string = 'x'.repeat(65536);

      const options: PublishOptions = { data: bigData, sourceCode: 1, eventName: '' };
      const request: PublishRequest = CommonEventPublisher.buildRequest(options);
      const result: string = CommonEventPublisher.validatePublishRequest(request.eventName, request.publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('The common event name must not be empty.'));
      expect(result).assertEqual('The common event name must not be empty.');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(bigData.length === 65537));
      expect(bigData.length === 65537).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result !== 'The event data must not exceed 64 KB.'));
      expect(result !== 'The event data must not exceed 64 KB.').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0048 end');
    })

    /**
     * @tc.name   testPublishOptions0049
     * @tc.number SUB_CCER_PUBOPT_01_0049
     * @tc.desc   合法默认请求走发布链路时校验通过
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishOptions0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0049 begin');
      const bigData: string = 'x'.repeat(65537);
      const maxData: string = 'x'.repeat(65536);

      const options: PublishOptions = { data: 'InApp', sourceCode: 1002 };
      const request: PublishRequest = CommonEventPublisher.buildRequest(options);
      const result: string = CommonEventPublisher.validatePublishRequest(request.eventName, request.publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(request.eventName === CommonEventConstants.EVENT_NAME));
      expect(request.eventName === CommonEventConstants.EVENT_NAME).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(request.publishData.isOrdered === false));
      expect(request.publishData.isOrdered === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0049 end');
    })

    /**
     * @tc.name   testPublishOptions0050
     * @tc.number SUB_CCER_PUBOPT_01_0050
     * @tc.desc   一百二十七字符长事件名组装时原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishOptions0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0050 begin');
      const bigData: string = 'x'.repeat(65537);
      const maxData: string = 'x'.repeat(65536);
      let longName: string = ''; for (let i: number = 0; i < 127; i++) { longName += 'n'; }
      const options: PublishOptions = { data: 'InApp', sourceCode: 1002, eventName: longName };
      const request: PublishRequest = CommonEventPublisher.buildRequest(options);
      const result: string = request.eventName;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(longName));
      expect(result).assertEqual(longName);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(longName.length === 127));
      expect(longName.length === 127).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(request.publishData.data), String('InApp'));
      expect(request.publishData.data).assertEqual('InApp');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0050 end');
    })

    /**
     * @tc.name   testPublishOptions0051
     * @tc.number SUB_CCER_PUBOPT_01_0051
     * @tc.desc   四字段齐备的自定义请求逐项组装
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishOptions0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0051 begin');
      const bigData: string = 'x'.repeat(65537);
      const maxData: string = 'x'.repeat(65536);

      const options: PublishOptions = { data: 'Custom 数据', sourceCode: 1003, eventName: 'anchor', ordered: true };
      const request: PublishRequest = CommonEventPublisher.buildRequest(options);
      const result: string = request.eventName;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('anchor'));
      expect(result).assertEqual('anchor');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(request.publishData.code)), String('1003'));
      expect(String(request.publishData.code)).assertEqual('1003');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(request.publishData.isOrdered === true && request.publishData.data === 'Custom 数据'));
      expect(request.publishData.isOrdered === true && request.publishData.data === 'Custom 数据').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishOptions0051 end');
    })

  })
}
