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

export default function mediaControllerSessionTestPart04() {
  describe('MediaControllerSessionPart04', () => {
    /**
     * @tc.name   com.samples.mediacontroller_Session_0204
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0204
     * @tc.desc   Verify bulk Map variant 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0204 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-024-01', 2401);
      map.set('bulk-024-02', 2402);
      map.set('bulk-024-03', 2403);
      map.set('bulk-024-04', 2404);
      map.set('bulk-024-05', 2405);
      map.set('bulk-024-06', 2406);
      map.set('bulk-024-07', 2407);
      map.set('bulk-024-08', 2408);
      map.set('bulk-024-09', 2409);
      map.set('bulk-024-10', 2410);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-024-10')).assertEqual(2410);
      map.delete('bulk-024-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0204 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0205
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0205
     * @tc.desc   Verify bulk Map variant 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0205 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-025-01', 2501);
      map.set('bulk-025-02', 2502);
      map.set('bulk-025-03', 2503);
      map.set('bulk-025-04', 2504);
      map.set('bulk-025-05', 2505);
      map.set('bulk-025-06', 2506);
      map.set('bulk-025-07', 2507);
      map.set('bulk-025-08', 2508);
      map.set('bulk-025-09', 2509);
      map.set('bulk-025-10', 2510);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-025-10')).assertEqual(2510);
      map.delete('bulk-025-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0205 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0206
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0206
     * @tc.desc   Verify bulk Map variant 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0206 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-026-01', 2601);
      map.set('bulk-026-02', 2602);
      map.set('bulk-026-03', 2603);
      map.set('bulk-026-04', 2604);
      map.set('bulk-026-05', 2605);
      map.set('bulk-026-06', 2606);
      map.set('bulk-026-07', 2607);
      map.set('bulk-026-08', 2608);
      map.set('bulk-026-09', 2609);
      map.set('bulk-026-10', 2610);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-026-10')).assertEqual(2610);
      map.delete('bulk-026-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0206 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0207
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0207
     * @tc.desc   Verify bulk Map variant 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0207 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-027-01', 2701);
      map.set('bulk-027-02', 2702);
      map.set('bulk-027-03', 2703);
      map.set('bulk-027-04', 2704);
      map.set('bulk-027-05', 2705);
      map.set('bulk-027-06', 2706);
      map.set('bulk-027-07', 2707);
      map.set('bulk-027-08', 2708);
      map.set('bulk-027-09', 2709);
      map.set('bulk-027-10', 2710);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-027-10')).assertEqual(2710);
      map.delete('bulk-027-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0207 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0208
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0208
     * @tc.desc   Verify bulk Map variant 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0208 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-028-01', 2801);
      map.set('bulk-028-02', 2802);
      map.set('bulk-028-03', 2803);
      map.set('bulk-028-04', 2804);
      map.set('bulk-028-05', 2805);
      map.set('bulk-028-06', 2806);
      map.set('bulk-028-07', 2807);
      map.set('bulk-028-08', 2808);
      map.set('bulk-028-09', 2809);
      map.set('bulk-028-10', 2810);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-028-10')).assertEqual(2810);
      map.delete('bulk-028-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0208 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0209
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0209
     * @tc.desc   Verify bulk Map variant 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0209 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-029-01', 2901);
      map.set('bulk-029-02', 2902);
      map.set('bulk-029-03', 2903);
      map.set('bulk-029-04', 2904);
      map.set('bulk-029-05', 2905);
      map.set('bulk-029-06', 2906);
      map.set('bulk-029-07', 2907);
      map.set('bulk-029-08', 2908);
      map.set('bulk-029-09', 2909);
      map.set('bulk-029-10', 2910);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-029-10')).assertEqual(2910);
      map.delete('bulk-029-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0209 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0210
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0210
     * @tc.desc   Verify bulk Map variant 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0210 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-030-01', 3001);
      map.set('bulk-030-02', 3002);
      map.set('bulk-030-03', 3003);
      map.set('bulk-030-04', 3004);
      map.set('bulk-030-05', 3005);
      map.set('bulk-030-06', 3006);
      map.set('bulk-030-07', 3007);
      map.set('bulk-030-08', 3008);
      map.set('bulk-030-09', 3009);
      map.set('bulk-030-10', 3010);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-030-10')).assertEqual(3010);
      map.delete('bulk-030-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0210 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0211
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0211
     * @tc.desc   Verify bulk Map variant 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0211 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-031-01', 3101);
      map.set('bulk-031-02', 3102);
      map.set('bulk-031-03', 3103);
      map.set('bulk-031-04', 3104);
      map.set('bulk-031-05', 3105);
      map.set('bulk-031-06', 3106);
      map.set('bulk-031-07', 3107);
      map.set('bulk-031-08', 3108);
      map.set('bulk-031-09', 3109);
      map.set('bulk-031-10', 3110);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-031-10')).assertEqual(3110);
      map.delete('bulk-031-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0211 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0212
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0212
     * @tc.desc   Verify bulk Map variant 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0212 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-032-01', 3201);
      map.set('bulk-032-02', 3202);
      map.set('bulk-032-03', 3203);
      map.set('bulk-032-04', 3204);
      map.set('bulk-032-05', 3205);
      map.set('bulk-032-06', 3206);
      map.set('bulk-032-07', 3207);
      map.set('bulk-032-08', 3208);
      map.set('bulk-032-09', 3209);
      map.set('bulk-032-10', 3210);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-032-10')).assertEqual(3210);
      map.delete('bulk-032-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0212 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0213
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0213
     * @tc.desc   Verify bulk Map variant 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0213 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-033-01', 3301);
      map.set('bulk-033-02', 3302);
      map.set('bulk-033-03', 3303);
      map.set('bulk-033-04', 3304);
      map.set('bulk-033-05', 3305);
      map.set('bulk-033-06', 3306);
      map.set('bulk-033-07', 3307);
      map.set('bulk-033-08', 3308);
      map.set('bulk-033-09', 3309);
      map.set('bulk-033-10', 3310);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-033-10')).assertEqual(3310);
      map.delete('bulk-033-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0213 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0214
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0214
     * @tc.desc   Verify bulk Map variant 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0214 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-034-01', 3401);
      map.set('bulk-034-02', 3402);
      map.set('bulk-034-03', 3403);
      map.set('bulk-034-04', 3404);
      map.set('bulk-034-05', 3405);
      map.set('bulk-034-06', 3406);
      map.set('bulk-034-07', 3407);
      map.set('bulk-034-08', 3408);
      map.set('bulk-034-09', 3409);
      map.set('bulk-034-10', 3410);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-034-10')).assertEqual(3410);
      map.delete('bulk-034-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0214 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0215
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0215
     * @tc.desc   Verify bulk Map variant 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0215 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-035-01', 3501);
      map.set('bulk-035-02', 3502);
      map.set('bulk-035-03', 3503);
      map.set('bulk-035-04', 3504);
      map.set('bulk-035-05', 3505);
      map.set('bulk-035-06', 3506);
      map.set('bulk-035-07', 3507);
      map.set('bulk-035-08', 3508);
      map.set('bulk-035-09', 3509);
      map.set('bulk-035-10', 3510);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-035-10')).assertEqual(3510);
      map.delete('bulk-035-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0215 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0216
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0216
     * @tc.desc   Verify bulk Map variant 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0216 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-036-01', 3601);
      map.set('bulk-036-02', 3602);
      map.set('bulk-036-03', 3603);
      map.set('bulk-036-04', 3604);
      map.set('bulk-036-05', 3605);
      map.set('bulk-036-06', 3606);
      map.set('bulk-036-07', 3607);
      map.set('bulk-036-08', 3608);
      map.set('bulk-036-09', 3609);
      map.set('bulk-036-10', 3610);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-036-10')).assertEqual(3610);
      map.delete('bulk-036-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0216 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0217
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0217
     * @tc.desc   Verify bulk Map variant 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0217 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-037-01', 3701);
      map.set('bulk-037-02', 3702);
      map.set('bulk-037-03', 3703);
      map.set('bulk-037-04', 3704);
      map.set('bulk-037-05', 3705);
      map.set('bulk-037-06', 3706);
      map.set('bulk-037-07', 3707);
      map.set('bulk-037-08', 3708);
      map.set('bulk-037-09', 3709);
      map.set('bulk-037-10', 3710);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-037-10')).assertEqual(3710);
      map.delete('bulk-037-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0217 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0218
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0218
     * @tc.desc   Verify bulk Map variant 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0218 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-038-01', 3801);
      map.set('bulk-038-02', 3802);
      map.set('bulk-038-03', 3803);
      map.set('bulk-038-04', 3804);
      map.set('bulk-038-05', 3805);
      map.set('bulk-038-06', 3806);
      map.set('bulk-038-07', 3807);
      map.set('bulk-038-08', 3808);
      map.set('bulk-038-09', 3809);
      map.set('bulk-038-10', 3810);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-038-10')).assertEqual(3810);
      map.delete('bulk-038-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0218 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0219
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0219
     * @tc.desc   Verify bulk Map variant 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0219 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-039-01', 3901);
      map.set('bulk-039-02', 3902);
      map.set('bulk-039-03', 3903);
      map.set('bulk-039-04', 3904);
      map.set('bulk-039-05', 3905);
      map.set('bulk-039-06', 3906);
      map.set('bulk-039-07', 3907);
      map.set('bulk-039-08', 3908);
      map.set('bulk-039-09', 3909);
      map.set('bulk-039-10', 3910);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-039-10')).assertEqual(3910);
      map.delete('bulk-039-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0219 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0220
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0220
     * @tc.desc   Verify bulk Map variant 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0220 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-040-01', 4001);
      map.set('bulk-040-02', 4002);
      map.set('bulk-040-03', 4003);
      map.set('bulk-040-04', 4004);
      map.set('bulk-040-05', 4005);
      map.set('bulk-040-06', 4006);
      map.set('bulk-040-07', 4007);
      map.set('bulk-040-08', 4008);
      map.set('bulk-040-09', 4009);
      map.set('bulk-040-10', 4010);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-040-10')).assertEqual(4010);
      map.delete('bulk-040-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0220 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0221
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0221
     * @tc.desc   Verify bulk Map variant 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0221 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-041-01', 4101);
      map.set('bulk-041-02', 4102);
      map.set('bulk-041-03', 4103);
      map.set('bulk-041-04', 4104);
      map.set('bulk-041-05', 4105);
      map.set('bulk-041-06', 4106);
      map.set('bulk-041-07', 4107);
      map.set('bulk-041-08', 4108);
      map.set('bulk-041-09', 4109);
      map.set('bulk-041-10', 4110);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-041-10')).assertEqual(4110);
      map.delete('bulk-041-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0221 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0222
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0222
     * @tc.desc   Verify bulk Map variant 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0222 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-042-01', 4201);
      map.set('bulk-042-02', 4202);
      map.set('bulk-042-03', 4203);
      map.set('bulk-042-04', 4204);
      map.set('bulk-042-05', 4205);
      map.set('bulk-042-06', 4206);
      map.set('bulk-042-07', 4207);
      map.set('bulk-042-08', 4208);
      map.set('bulk-042-09', 4209);
      map.set('bulk-042-10', 4210);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-042-10')).assertEqual(4210);
      map.delete('bulk-042-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0222 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0223
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0223
     * @tc.desc   Verify bulk Map variant 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0223 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-043-01', 4301);
      map.set('bulk-043-02', 4302);
      map.set('bulk-043-03', 4303);
      map.set('bulk-043-04', 4304);
      map.set('bulk-043-05', 4305);
      map.set('bulk-043-06', 4306);
      map.set('bulk-043-07', 4307);
      map.set('bulk-043-08', 4308);
      map.set('bulk-043-09', 4309);
      map.set('bulk-043-10', 4310);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-043-10')).assertEqual(4310);
      map.delete('bulk-043-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0223 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0224
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0224
     * @tc.desc   Verify bulk Map variant 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0224 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-044-01', 4401);
      map.set('bulk-044-02', 4402);
      map.set('bulk-044-03', 4403);
      map.set('bulk-044-04', 4404);
      map.set('bulk-044-05', 4405);
      map.set('bulk-044-06', 4406);
      map.set('bulk-044-07', 4407);
      map.set('bulk-044-08', 4408);
      map.set('bulk-044-09', 4409);
      map.set('bulk-044-10', 4410);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-044-10')).assertEqual(4410);
      map.delete('bulk-044-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0224 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0225
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0225
     * @tc.desc   Verify bulk Map variant 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0225 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-045-01', 4501);
      map.set('bulk-045-02', 4502);
      map.set('bulk-045-03', 4503);
      map.set('bulk-045-04', 4504);
      map.set('bulk-045-05', 4505);
      map.set('bulk-045-06', 4506);
      map.set('bulk-045-07', 4507);
      map.set('bulk-045-08', 4508);
      map.set('bulk-045-09', 4509);
      map.set('bulk-045-10', 4510);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-045-10')).assertEqual(4510);
      map.delete('bulk-045-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0225 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0226
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0226
     * @tc.desc   Verify bulk Map variant 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0226 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-046-01', 4601);
      map.set('bulk-046-02', 4602);
      map.set('bulk-046-03', 4603);
      map.set('bulk-046-04', 4604);
      map.set('bulk-046-05', 4605);
      map.set('bulk-046-06', 4606);
      map.set('bulk-046-07', 4607);
      map.set('bulk-046-08', 4608);
      map.set('bulk-046-09', 4609);
      map.set('bulk-046-10', 4610);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-046-10')).assertEqual(4610);
      map.delete('bulk-046-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0226 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0227
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0227
     * @tc.desc   Verify bulk Map variant 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0227 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-047-01', 4701);
      map.set('bulk-047-02', 4702);
      map.set('bulk-047-03', 4703);
      map.set('bulk-047-04', 4704);
      map.set('bulk-047-05', 4705);
      map.set('bulk-047-06', 4706);
      map.set('bulk-047-07', 4707);
      map.set('bulk-047-08', 4708);
      map.set('bulk-047-09', 4709);
      map.set('bulk-047-10', 4710);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-047-10')).assertEqual(4710);
      map.delete('bulk-047-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0227 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0228
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0228
     * @tc.desc   Verify bulk Map variant 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0228 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-048-01', 4801);
      map.set('bulk-048-02', 4802);
      map.set('bulk-048-03', 4803);
      map.set('bulk-048-04', 4804);
      map.set('bulk-048-05', 4805);
      map.set('bulk-048-06', 4806);
      map.set('bulk-048-07', 4807);
      map.set('bulk-048-08', 4808);
      map.set('bulk-048-09', 4809);
      map.set('bulk-048-10', 4810);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-048-10')).assertEqual(4810);
      map.delete('bulk-048-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0228 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0229
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0229
     * @tc.desc   Verify bulk Map variant 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0229 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-049-01', 4901);
      map.set('bulk-049-02', 4902);
      map.set('bulk-049-03', 4903);
      map.set('bulk-049-04', 4904);
      map.set('bulk-049-05', 4905);
      map.set('bulk-049-06', 4906);
      map.set('bulk-049-07', 4907);
      map.set('bulk-049-08', 4908);
      map.set('bulk-049-09', 4909);
      map.set('bulk-049-10', 4910);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-049-10')).assertEqual(4910);
      map.delete('bulk-049-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0229 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0230
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0230
     * @tc.desc   Verify bulk Map variant 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0230 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-050-01', 5001);
      map.set('bulk-050-02', 5002);
      map.set('bulk-050-03', 5003);
      map.set('bulk-050-04', 5004);
      map.set('bulk-050-05', 5005);
      map.set('bulk-050-06', 5006);
      map.set('bulk-050-07', 5007);
      map.set('bulk-050-08', 5008);
      map.set('bulk-050-09', 5009);
      map.set('bulk-050-10', 5010);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-050-10')).assertEqual(5010);
      map.delete('bulk-050-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0230 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0231
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0231
     * @tc.desc   Verify bulk Map variant 51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0231 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-051-01', 5101);
      map.set('bulk-051-02', 5102);
      map.set('bulk-051-03', 5103);
      map.set('bulk-051-04', 5104);
      map.set('bulk-051-05', 5105);
      map.set('bulk-051-06', 5106);
      map.set('bulk-051-07', 5107);
      map.set('bulk-051-08', 5108);
      map.set('bulk-051-09', 5109);
      map.set('bulk-051-10', 5110);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-051-10')).assertEqual(5110);
      map.delete('bulk-051-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0231 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0232
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0232
     * @tc.desc   Verify bulk Map variant 52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0232 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-052-01', 5201);
      map.set('bulk-052-02', 5202);
      map.set('bulk-052-03', 5203);
      map.set('bulk-052-04', 5204);
      map.set('bulk-052-05', 5205);
      map.set('bulk-052-06', 5206);
      map.set('bulk-052-07', 5207);
      map.set('bulk-052-08', 5208);
      map.set('bulk-052-09', 5209);
      map.set('bulk-052-10', 5210);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-052-10')).assertEqual(5210);
      map.delete('bulk-052-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0232 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0233
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0233
     * @tc.desc   Verify bulk Map variant 53.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0233 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-053-01', 5301);
      map.set('bulk-053-02', 5302);
      map.set('bulk-053-03', 5303);
      map.set('bulk-053-04', 5304);
      map.set('bulk-053-05', 5305);
      map.set('bulk-053-06', 5306);
      map.set('bulk-053-07', 5307);
      map.set('bulk-053-08', 5308);
      map.set('bulk-053-09', 5309);
      map.set('bulk-053-10', 5310);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-053-10')).assertEqual(5310);
      map.delete('bulk-053-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0233 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0234
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0234
     * @tc.desc   Verify bulk Map variant 54.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0234 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-054-01', 5401);
      map.set('bulk-054-02', 5402);
      map.set('bulk-054-03', 5403);
      map.set('bulk-054-04', 5404);
      map.set('bulk-054-05', 5405);
      map.set('bulk-054-06', 5406);
      map.set('bulk-054-07', 5407);
      map.set('bulk-054-08', 5408);
      map.set('bulk-054-09', 5409);
      map.set('bulk-054-10', 5410);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-054-10')).assertEqual(5410);
      map.delete('bulk-054-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0234 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0235
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0235
     * @tc.desc   Verify bulk Map variant 55.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0235 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-055-01', 5501);
      map.set('bulk-055-02', 5502);
      map.set('bulk-055-03', 5503);
      map.set('bulk-055-04', 5504);
      map.set('bulk-055-05', 5505);
      map.set('bulk-055-06', 5506);
      map.set('bulk-055-07', 5507);
      map.set('bulk-055-08', 5508);
      map.set('bulk-055-09', 5509);
      map.set('bulk-055-10', 5510);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-055-10')).assertEqual(5510);
      map.delete('bulk-055-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0235 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0236
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0236
     * @tc.desc   Verify bulk Map variant 56.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0236 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-056-01', 5601);
      map.set('bulk-056-02', 5602);
      map.set('bulk-056-03', 5603);
      map.set('bulk-056-04', 5604);
      map.set('bulk-056-05', 5605);
      map.set('bulk-056-06', 5606);
      map.set('bulk-056-07', 5607);
      map.set('bulk-056-08', 5608);
      map.set('bulk-056-09', 5609);
      map.set('bulk-056-10', 5610);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-056-10')).assertEqual(5610);
      map.delete('bulk-056-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0236 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0237
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0237
     * @tc.desc   Verify bulk Map variant 57.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0237 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-057-01', 5701);
      map.set('bulk-057-02', 5702);
      map.set('bulk-057-03', 5703);
      map.set('bulk-057-04', 5704);
      map.set('bulk-057-05', 5705);
      map.set('bulk-057-06', 5706);
      map.set('bulk-057-07', 5707);
      map.set('bulk-057-08', 5708);
      map.set('bulk-057-09', 5709);
      map.set('bulk-057-10', 5710);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-057-10')).assertEqual(5710);
      map.delete('bulk-057-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0237 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0238
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0238
     * @tc.desc   Verify bulk Map variant 58.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0238 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-058-01', 5801);
      map.set('bulk-058-02', 5802);
      map.set('bulk-058-03', 5803);
      map.set('bulk-058-04', 5804);
      map.set('bulk-058-05', 5805);
      map.set('bulk-058-06', 5806);
      map.set('bulk-058-07', 5807);
      map.set('bulk-058-08', 5808);
      map.set('bulk-058-09', 5809);
      map.set('bulk-058-10', 5810);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-058-10')).assertEqual(5810);
      map.delete('bulk-058-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0238 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0239
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0239
     * @tc.desc   Verify bulk Map variant 59.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0239 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-059-01', 5901);
      map.set('bulk-059-02', 5902);
      map.set('bulk-059-03', 5903);
      map.set('bulk-059-04', 5904);
      map.set('bulk-059-05', 5905);
      map.set('bulk-059-06', 5906);
      map.set('bulk-059-07', 5907);
      map.set('bulk-059-08', 5908);
      map.set('bulk-059-09', 5909);
      map.set('bulk-059-10', 5910);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-059-10')).assertEqual(5910);
      map.delete('bulk-059-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0239 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0240
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0240
     * @tc.desc   Verify bulk Map variant 60.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0240 begin');
      const map: Map<string, number> = new Map();
      map.set('bulk-060-01', 6001);
      map.set('bulk-060-02', 6002);
      map.set('bulk-060-03', 6003);
      map.set('bulk-060-04', 6004);
      map.set('bulk-060-05', 6005);
      map.set('bulk-060-06', 6006);
      map.set('bulk-060-07', 6007);
      map.set('bulk-060-08', 6008);
      map.set('bulk-060-09', 6009);
      map.set('bulk-060-10', 6010);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=10', map.size);
      expect(map.size).assertEqual(10);
      expect(map.get('bulk-060-10')).assertEqual(6010);
      map.delete('bulk-060-10');
      expect(map.size).assertEqual(9);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0240 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0241
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0241
     * @tc.desc   Verify JSON deep structure variant 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0241 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '1');
      payload.set('text', 'deep-001');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('text'), String('deep-001'));
      expect(payload.get('text')).assertEqual('deep-001');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0241 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0242
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0242
     * @tc.desc   Verify JSON deep structure variant 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0242 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '2');
      payload.set('text', 'deep-002');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('text'), String('deep-002'));
      expect(payload.get('text')).assertEqual('deep-002');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0242 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0243
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0243
     * @tc.desc   Verify JSON deep structure variant 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0243 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '3');
      payload.set('text', 'deep-003');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('text'), String('deep-003'));
      expect(payload.get('text')).assertEqual('deep-003');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0243 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0244
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0244
     * @tc.desc   Verify JSON deep structure variant 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0244 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '4');
      payload.set('text', 'deep-004');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('text'), String('deep-004'));
      expect(payload.get('text')).assertEqual('deep-004');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0244 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0245
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0245
     * @tc.desc   Verify JSON deep structure variant 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0245 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '5');
      payload.set('text', 'deep-005');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('text'), String('deep-005'));
      expect(payload.get('text')).assertEqual('deep-005');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0245 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0246
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0246
     * @tc.desc   Verify JSON deep structure variant 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0246 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '6');
      payload.set('text', 'deep-006');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('text'), String('deep-006'));
      expect(payload.get('text')).assertEqual('deep-006');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0246 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0247
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0247
     * @tc.desc   Verify JSON deep structure variant 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0247 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '7');
      payload.set('text', 'deep-007');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('text'), String('deep-007'));
      expect(payload.get('text')).assertEqual('deep-007');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0247 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0248
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0248
     * @tc.desc   Verify JSON deep structure variant 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0248 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '8');
      payload.set('text', 'deep-008');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('text'), String('deep-008'));
      expect(payload.get('text')).assertEqual('deep-008');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0248 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0249
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0249
     * @tc.desc   Verify JSON deep structure variant 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0249 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '9');
      payload.set('text', 'deep-009');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('text'), String('deep-009'));
      expect(payload.get('text')).assertEqual('deep-009');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0249 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0250
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0250
     * @tc.desc   Verify JSON deep structure variant 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0250 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '10');
      payload.set('text', 'deep-010');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('text'), String('deep-010'));
      expect(payload.get('text')).assertEqual('deep-010');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0250 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0251
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0251
     * @tc.desc   Verify JSON deep structure variant 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0251 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '11');
      payload.set('text', 'deep-011');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('text'), String('deep-011'));
      expect(payload.get('text')).assertEqual('deep-011');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0251 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0252
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0252
     * @tc.desc   Verify JSON deep structure variant 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0252 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '12');
      payload.set('text', 'deep-012');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('text'), String('deep-012'));
      expect(payload.get('text')).assertEqual('deep-012');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0252 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0253
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0253
     * @tc.desc   Verify JSON deep structure variant 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0253 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '13');
      payload.set('text', 'deep-013');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('text'), String('deep-013'));
      expect(payload.get('text')).assertEqual('deep-013');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0253 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0254
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0254
     * @tc.desc   Verify JSON deep structure variant 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0254', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0254 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '14');
      payload.set('text', 'deep-014');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('text'), String('deep-014'));
      expect(payload.get('text')).assertEqual('deep-014');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0254 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0255
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0255
     * @tc.desc   Verify JSON deep structure variant 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0255 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '15');
      payload.set('text', 'deep-015');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('text'), String('deep-015'));
      expect(payload.get('text')).assertEqual('deep-015');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0255 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0256
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0256
     * @tc.desc   Verify JSON deep structure variant 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0256 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '16');
      payload.set('text', 'deep-016');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('text'), String('deep-016'));
      expect(payload.get('text')).assertEqual('deep-016');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0256 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0257
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0257
     * @tc.desc   Verify JSON deep structure variant 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0257', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0257 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '17');
      payload.set('text', 'deep-017');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('text'), String('deep-017'));
      expect(payload.get('text')).assertEqual('deep-017');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0257 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0258
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0258
     * @tc.desc   Verify JSON deep structure variant 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0258 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '18');
      payload.set('text', 'deep-018');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('text'), String('deep-018'));
      expect(payload.get('text')).assertEqual('deep-018');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0258 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0259
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0259
     * @tc.desc   Verify JSON deep structure variant 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0259 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '19');
      payload.set('text', 'deep-019');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('text'), String('deep-019'));
      expect(payload.get('text')).assertEqual('deep-019');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0259 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0260
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0260
     * @tc.desc   Verify JSON deep structure variant 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0260 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '20');
      payload.set('text', 'deep-020');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('text'), String('deep-020'));
      expect(payload.get('text')).assertEqual('deep-020');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0260 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0261
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0261
     * @tc.desc   Verify JSON deep structure variant 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0261 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '21');
      payload.set('text', 'deep-021');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('text'), String('deep-021'));
      expect(payload.get('text')).assertEqual('deep-021');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0261 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0262
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0262
     * @tc.desc   Verify JSON deep structure variant 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0262 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '22');
      payload.set('text', 'deep-022');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('text'), String('deep-022'));
      expect(payload.get('text')).assertEqual('deep-022');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0262 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0263
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0263
     * @tc.desc   Verify JSON deep structure variant 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0263 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '23');
      payload.set('text', 'deep-023');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('text'), String('deep-023'));
      expect(payload.get('text')).assertEqual('deep-023');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0263 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0264
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0264
     * @tc.desc   Verify JSON deep structure variant 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0264 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '24');
      payload.set('text', 'deep-024');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('text'), String('deep-024'));
      expect(payload.get('text')).assertEqual('deep-024');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0264 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0265
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0265
     * @tc.desc   Verify JSON deep structure variant 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0265', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0265 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '25');
      payload.set('text', 'deep-025');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('text'), String('deep-025'));
      expect(payload.get('text')).assertEqual('deep-025');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0265 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0266
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0266
     * @tc.desc   Verify JSON deep structure variant 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0266 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '26');
      payload.set('text', 'deep-026');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('text'), String('deep-026'));
      expect(payload.get('text')).assertEqual('deep-026');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0266 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0267
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0267
     * @tc.desc   Verify JSON deep structure variant 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0267 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '27');
      payload.set('text', 'deep-027');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('text'), String('deep-027'));
      expect(payload.get('text')).assertEqual('deep-027');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0267 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0268
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0268
     * @tc.desc   Verify JSON deep structure variant 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0268', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0268 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '28');
      payload.set('text', 'deep-028');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('text'), String('deep-028'));
      expect(payload.get('text')).assertEqual('deep-028');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0268 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0269
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0269
     * @tc.desc   Verify JSON deep structure variant 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0269 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '29');
      payload.set('text', 'deep-029');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('text'), String('deep-029'));
      expect(payload.get('text')).assertEqual('deep-029');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0269 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0270
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0270
     * @tc.desc   Verify JSON deep structure variant 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0270 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '30');
      payload.set('text', 'deep-030');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('text'), String('deep-030'));
      expect(payload.get('text')).assertEqual('deep-030');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0270 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0271
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0271
     * @tc.desc   Verify JSON deep structure variant 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0271', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0271 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '31');
      payload.set('text', 'deep-031');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('text'), String('deep-031'));
      expect(payload.get('text')).assertEqual('deep-031');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0271 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Session_0272
     * @tc.number SUB_MEDIA_CONTROLLER_SESSION_0272
     * @tc.desc   Verify JSON deep structure variant 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Session_0272', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0272 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '32');
      payload.set('text', 'deep-032');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('text'), String('deep-032'));
      expect(payload.get('text')).assertEqual('deep-032');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Session_0272 end');
    })
  })
}
