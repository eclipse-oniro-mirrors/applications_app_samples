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
import AVSessionManager from '@ohos.multimedia.avsession';
import { hilog } from '@kit.PerformanceAnalysisKit';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function mediaControllerSessionTestPart05() {
  describe('MediaControllerSessionPart05', () => {
    /**
     * @tc.name   com.samples.mediacontroller_Session_0273
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0273
     * @tc.desc   Verify JSON deep structure variant 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0273', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0273 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '33');
      payload.set('text', 'deep-033');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('text'), String('deep-033'));
      expect(payload.get('text')).assertEqual('deep-033');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0273 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0274
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0274
     * @tc.desc   Verify JSON deep structure variant 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0274', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0274 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '34');
      payload.set('text', 'deep-034');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('text'), String('deep-034'));
      expect(payload.get('text')).assertEqual('deep-034');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0274 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0275
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0275
     * @tc.desc   Verify JSON deep structure variant 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0275', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0275 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '35');
      payload.set('text', 'deep-035');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('text'), String('deep-035'));
      expect(payload.get('text')).assertEqual('deep-035');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0275 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0276
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0276
     * @tc.desc   Verify JSON deep structure variant 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0276', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0276 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '36');
      payload.set('text', 'deep-036');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('text'), String('deep-036'));
      expect(payload.get('text')).assertEqual('deep-036');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0276 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0277
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0277
     * @tc.desc   Verify JSON deep structure variant 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0277', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0277 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '37');
      payload.set('text', 'deep-037');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('text'), String('deep-037'));
      expect(payload.get('text')).assertEqual('deep-037');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0277 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0278
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0278
     * @tc.desc   Verify JSON deep structure variant 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0278', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0278 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '38');
      payload.set('text', 'deep-038');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('text'), String('deep-038'));
      expect(payload.get('text')).assertEqual('deep-038');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0278 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0279
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0279
     * @tc.desc   Verify JSON deep structure variant 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0279', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0279 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '39');
      payload.set('text', 'deep-039');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('text'), String('deep-039'));
      expect(payload.get('text')).assertEqual('deep-039');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0279 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0280
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0280
     * @tc.desc   Verify JSON deep structure variant 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0280 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '40');
      payload.set('text', 'deep-040');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('text'), String('deep-040'));
      expect(payload.get('text')).assertEqual('deep-040');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0280 end');
    })
  })
}
