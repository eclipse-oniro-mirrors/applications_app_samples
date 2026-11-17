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

export default function mediaControllerPlaybackTestPart04() {
  describe('MediaControllerPlaybackPart04', () => {
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0237
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0237
     * @tc.desc   Verify playback map bulk variant 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0237 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-037-01', 371);
      map.set('playback-037-02', 372);
      map.set('playback-037-03', 373);
      map.set('playback-037-04', 374);
      map.set('playback-037-05', 375);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-037-05')).assertEqual(375);
      map.delete('playback-037-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0237 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0238
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0238
     * @tc.desc   Verify playback map bulk variant 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0238 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-038-01', 381);
      map.set('playback-038-02', 382);
      map.set('playback-038-03', 383);
      map.set('playback-038-04', 384);
      map.set('playback-038-05', 385);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-038-05')).assertEqual(385);
      map.delete('playback-038-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0238 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0239
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0239
     * @tc.desc   Verify playback map bulk variant 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0239 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-039-01', 391);
      map.set('playback-039-02', 392);
      map.set('playback-039-03', 393);
      map.set('playback-039-04', 394);
      map.set('playback-039-05', 395);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-039-05')).assertEqual(395);
      map.delete('playback-039-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0239 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0240
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0240
     * @tc.desc   Verify playback map bulk variant 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0240 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-040-01', 401);
      map.set('playback-040-02', 402);
      map.set('playback-040-03', 403);
      map.set('playback-040-04', 404);
      map.set('playback-040-05', 405);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-040-05')).assertEqual(405);
      map.delete('playback-040-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0240 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0241
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0241
     * @tc.desc   Verify playback map bulk variant 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0241 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-041-01', 411);
      map.set('playback-041-02', 412);
      map.set('playback-041-03', 413);
      map.set('playback-041-04', 414);
      map.set('playback-041-05', 415);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-041-05')).assertEqual(415);
      map.delete('playback-041-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0241 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0242
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0242
     * @tc.desc   Verify playback map bulk variant 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0242 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-042-01', 421);
      map.set('playback-042-02', 422);
      map.set('playback-042-03', 423);
      map.set('playback-042-04', 424);
      map.set('playback-042-05', 425);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-042-05')).assertEqual(425);
      map.delete('playback-042-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0242 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0243
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0243
     * @tc.desc   Verify playback map bulk variant 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0243 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-043-01', 431);
      map.set('playback-043-02', 432);
      map.set('playback-043-03', 433);
      map.set('playback-043-04', 434);
      map.set('playback-043-05', 435);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-043-05')).assertEqual(435);
      map.delete('playback-043-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0243 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0244
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0244
     * @tc.desc   Verify playback map bulk variant 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0244 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-044-01', 441);
      map.set('playback-044-02', 442);
      map.set('playback-044-03', 443);
      map.set('playback-044-04', 444);
      map.set('playback-044-05', 445);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-044-05')).assertEqual(445);
      map.delete('playback-044-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0244 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0245
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0245
     * @tc.desc   Verify playback map bulk variant 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0245 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-045-01', 451);
      map.set('playback-045-02', 452);
      map.set('playback-045-03', 453);
      map.set('playback-045-04', 454);
      map.set('playback-045-05', 455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-045-05')).assertEqual(455);
      map.delete('playback-045-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0245 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0246
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0246
     * @tc.desc   Verify playback map bulk variant 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0246 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-046-01', 461);
      map.set('playback-046-02', 462);
      map.set('playback-046-03', 463);
      map.set('playback-046-04', 464);
      map.set('playback-046-05', 465);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-046-05')).assertEqual(465);
      map.delete('playback-046-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0246 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0247
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0247
     * @tc.desc   Verify playback map bulk variant 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0247 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-047-01', 471);
      map.set('playback-047-02', 472);
      map.set('playback-047-03', 473);
      map.set('playback-047-04', 474);
      map.set('playback-047-05', 475);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-047-05')).assertEqual(475);
      map.delete('playback-047-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0247 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0248
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0248
     * @tc.desc   Verify playback map bulk variant 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0248 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-048-01', 481);
      map.set('playback-048-02', 482);
      map.set('playback-048-03', 483);
      map.set('playback-048-04', 484);
      map.set('playback-048-05', 485);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-048-05')).assertEqual(485);
      map.delete('playback-048-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0248 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0249
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0249
     * @tc.desc   Verify playback map bulk variant 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0249 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-049-01', 491);
      map.set('playback-049-02', 492);
      map.set('playback-049-03', 493);
      map.set('playback-049-04', 494);
      map.set('playback-049-05', 495);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-049-05')).assertEqual(495);
      map.delete('playback-049-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0249 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0250
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0250
     * @tc.desc   Verify playback map bulk variant 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0250 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-050-01', 501);
      map.set('playback-050-02', 502);
      map.set('playback-050-03', 503);
      map.set('playback-050-04', 504);
      map.set('playback-050-05', 505);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-050-05')).assertEqual(505);
      map.delete('playback-050-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0250 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0251
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0251
     * @tc.desc   Verify playback map bulk variant 51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0251 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-051-01', 511);
      map.set('playback-051-02', 512);
      map.set('playback-051-03', 513);
      map.set('playback-051-04', 514);
      map.set('playback-051-05', 515);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-051-05')).assertEqual(515);
      map.delete('playback-051-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0251 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0252
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0252
     * @tc.desc   Verify playback map bulk variant 52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0252 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-052-01', 521);
      map.set('playback-052-02', 522);
      map.set('playback-052-03', 523);
      map.set('playback-052-04', 524);
      map.set('playback-052-05', 525);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-052-05')).assertEqual(525);
      map.delete('playback-052-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0252 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0253
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0253
     * @tc.desc   Verify playback map bulk variant 53.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0253 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-053-01', 531);
      map.set('playback-053-02', 532);
      map.set('playback-053-03', 533);
      map.set('playback-053-04', 534);
      map.set('playback-053-05', 535);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-053-05')).assertEqual(535);
      map.delete('playback-053-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0253 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0254
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0254
     * @tc.desc   Verify playback map bulk variant 54.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0254', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0254 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-054-01', 541);
      map.set('playback-054-02', 542);
      map.set('playback-054-03', 543);
      map.set('playback-054-04', 544);
      map.set('playback-054-05', 545);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-054-05')).assertEqual(545);
      map.delete('playback-054-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0254 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0255
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0255
     * @tc.desc   Verify playback map bulk variant 55.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0255 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-055-01', 551);
      map.set('playback-055-02', 552);
      map.set('playback-055-03', 553);
      map.set('playback-055-04', 554);
      map.set('playback-055-05', 555);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-055-05')).assertEqual(555);
      map.delete('playback-055-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0255 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0256
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0256
     * @tc.desc   Verify playback map bulk variant 56.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0256 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-056-01', 561);
      map.set('playback-056-02', 562);
      map.set('playback-056-03', 563);
      map.set('playback-056-04', 564);
      map.set('playback-056-05', 565);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-056-05')).assertEqual(565);
      map.delete('playback-056-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0256 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0257
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0257
     * @tc.desc   Verify playback map bulk variant 57.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0257', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0257 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-057-01', 571);
      map.set('playback-057-02', 572);
      map.set('playback-057-03', 573);
      map.set('playback-057-04', 574);
      map.set('playback-057-05', 575);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-057-05')).assertEqual(575);
      map.delete('playback-057-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0257 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0258
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0258
     * @tc.desc   Verify playback map bulk variant 58.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0258 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-058-01', 581);
      map.set('playback-058-02', 582);
      map.set('playback-058-03', 583);
      map.set('playback-058-04', 584);
      map.set('playback-058-05', 585);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-058-05')).assertEqual(585);
      map.delete('playback-058-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0258 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0259
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0259
     * @tc.desc   Verify playback map bulk variant 59.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0259 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-059-01', 591);
      map.set('playback-059-02', 592);
      map.set('playback-059-03', 593);
      map.set('playback-059-04', 594);
      map.set('playback-059-05', 595);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-059-05')).assertEqual(595);
      map.delete('playback-059-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0259 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0260
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0260
     * @tc.desc   Verify playback map bulk variant 60.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0260 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-060-01', 601);
      map.set('playback-060-02', 602);
      map.set('playback-060-03', 603);
      map.set('playback-060-04', 604);
      map.set('playback-060-05', 605);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-060-05')).assertEqual(605);
      map.delete('playback-060-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0260 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0261
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0261
     * @tc.desc   Verify playback JSON variant 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0261 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '1');
      payload.set('title', 'playback-001');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('title'), String('playback-001'));
      expect(payload.get('title')).assertEqual('playback-001');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0261 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0262
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0262
     * @tc.desc   Verify playback JSON variant 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0262 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '2');
      payload.set('title', 'playback-002');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('title'), String('playback-002'));
      expect(payload.get('title')).assertEqual('playback-002');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0262 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0263
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0263
     * @tc.desc   Verify playback JSON variant 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0263 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '3');
      payload.set('title', 'playback-003');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('title'), String('playback-003'));
      expect(payload.get('title')).assertEqual('playback-003');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0263 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0264
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0264
     * @tc.desc   Verify playback JSON variant 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0264 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '4');
      payload.set('title', 'playback-004');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('title'), String('playback-004'));
      expect(payload.get('title')).assertEqual('playback-004');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0264 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0265
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0265
     * @tc.desc   Verify playback JSON variant 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0265', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0265 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '5');
      payload.set('title', 'playback-005');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('title'), String('playback-005'));
      expect(payload.get('title')).assertEqual('playback-005');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0265 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0266
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0266
     * @tc.desc   Verify playback JSON variant 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0266 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '6');
      payload.set('title', 'playback-006');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('title'), String('playback-006'));
      expect(payload.get('title')).assertEqual('playback-006');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0266 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0267
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0267
     * @tc.desc   Verify playback JSON variant 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0267 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '7');
      payload.set('title', 'playback-007');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('title'), String('playback-007'));
      expect(payload.get('title')).assertEqual('playback-007');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0267 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0268
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0268
     * @tc.desc   Verify playback JSON variant 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0268', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0268 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '8');
      payload.set('title', 'playback-008');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('title'), String('playback-008'));
      expect(payload.get('title')).assertEqual('playback-008');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0268 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0269
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0269
     * @tc.desc   Verify playback JSON variant 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0269 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '9');
      payload.set('title', 'playback-009');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('title'), String('playback-009'));
      expect(payload.get('title')).assertEqual('playback-009');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0269 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0270
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0270
     * @tc.desc   Verify playback JSON variant 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0270 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '10');
      payload.set('title', 'playback-010');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('title'), String('playback-010'));
      expect(payload.get('title')).assertEqual('playback-010');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0270 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0271
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0271
     * @tc.desc   Verify playback JSON variant 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0271', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0271 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '11');
      payload.set('title', 'playback-011');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('title'), String('playback-011'));
      expect(payload.get('title')).assertEqual('playback-011');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0271 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0272
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0272
     * @tc.desc   Verify playback JSON variant 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0272', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0272 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '12');
      payload.set('title', 'playback-012');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('title'), String('playback-012'));
      expect(payload.get('title')).assertEqual('playback-012');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0272 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0273
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0273
     * @tc.desc   Verify playback JSON variant 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0273', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0273 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '13');
      payload.set('title', 'playback-013');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('title'), String('playback-013'));
      expect(payload.get('title')).assertEqual('playback-013');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0273 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0274
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0274
     * @tc.desc   Verify playback JSON variant 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0274', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0274 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '14');
      payload.set('title', 'playback-014');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('title'), String('playback-014'));
      expect(payload.get('title')).assertEqual('playback-014');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0274 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0275
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0275
     * @tc.desc   Verify playback JSON variant 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0275', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0275 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '15');
      payload.set('title', 'playback-015');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('title'), String('playback-015'));
      expect(payload.get('title')).assertEqual('playback-015');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0275 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0276
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0276
     * @tc.desc   Verify playback JSON variant 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0276', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0276 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '16');
      payload.set('title', 'playback-016');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('title'), String('playback-016'));
      expect(payload.get('title')).assertEqual('playback-016');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0276 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0277
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0277
     * @tc.desc   Verify playback JSON variant 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0277', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0277 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '17');
      payload.set('title', 'playback-017');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('title'), String('playback-017'));
      expect(payload.get('title')).assertEqual('playback-017');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0277 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0278
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0278
     * @tc.desc   Verify playback JSON variant 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0278', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0278 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '18');
      payload.set('title', 'playback-018');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('title'), String('playback-018'));
      expect(payload.get('title')).assertEqual('playback-018');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0278 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0279
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0279
     * @tc.desc   Verify playback JSON variant 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0279', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0279 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '19');
      payload.set('title', 'playback-019');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('title'), String('playback-019'));
      expect(payload.get('title')).assertEqual('playback-019');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0279 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0280
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0280
     * @tc.desc   Verify playback JSON variant 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0280 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '20');
      payload.set('title', 'playback-020');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('title'), String('playback-020'));
      expect(payload.get('title')).assertEqual('playback-020');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0280 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0281
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0281
     * @tc.desc   Verify playback JSON variant 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0281', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0281 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '21');
      payload.set('title', 'playback-021');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('title'), String('playback-021'));
      expect(payload.get('title')).assertEqual('playback-021');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0281 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0282
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0282
     * @tc.desc   Verify playback JSON variant 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0282', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0282 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '22');
      payload.set('title', 'playback-022');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('title'), String('playback-022'));
      expect(payload.get('title')).assertEqual('playback-022');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0282 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0283
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0283
     * @tc.desc   Verify playback JSON variant 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0283', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0283 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '23');
      payload.set('title', 'playback-023');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('title'), String('playback-023'));
      expect(payload.get('title')).assertEqual('playback-023');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0283 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0284
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0284
     * @tc.desc   Verify playback JSON variant 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0284', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0284 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '24');
      payload.set('title', 'playback-024');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('title'), String('playback-024'));
      expect(payload.get('title')).assertEqual('playback-024');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0284 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0285
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0285
     * @tc.desc   Verify playback JSON variant 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0285', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0285 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '25');
      payload.set('title', 'playback-025');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('title'), String('playback-025'));
      expect(payload.get('title')).assertEqual('playback-025');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0285 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0286
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0286
     * @tc.desc   Verify playback JSON variant 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0286', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0286 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '26');
      payload.set('title', 'playback-026');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('title'), String('playback-026'));
      expect(payload.get('title')).assertEqual('playback-026');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0286 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0287
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0287
     * @tc.desc   Verify playback JSON variant 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0287', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0287 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '27');
      payload.set('title', 'playback-027');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('title'), String('playback-027'));
      expect(payload.get('title')).assertEqual('playback-027');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0287 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0288
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0288
     * @tc.desc   Verify playback JSON variant 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0288', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0288 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '28');
      payload.set('title', 'playback-028');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('title'), String('playback-028'));
      expect(payload.get('title')).assertEqual('playback-028');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0288 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0289
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0289
     * @tc.desc   Verify playback JSON variant 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0289', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0289 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '29');
      payload.set('title', 'playback-029');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('title'), String('playback-029'));
      expect(payload.get('title')).assertEqual('playback-029');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0289 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0290
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0290
     * @tc.desc   Verify playback JSON variant 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0290 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '30');
      payload.set('title', 'playback-030');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('title'), String('playback-030'));
      expect(payload.get('title')).assertEqual('playback-030');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0290 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0291
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0291
     * @tc.desc   Verify playback JSON variant 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0291', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0291 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '31');
      payload.set('title', 'playback-031');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('title'), String('playback-031'));
      expect(payload.get('title')).assertEqual('playback-031');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0291 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0292
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0292
     * @tc.desc   Verify playback JSON variant 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0292', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0292 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '32');
      payload.set('title', 'playback-032');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('title'), String('playback-032'));
      expect(payload.get('title')).assertEqual('playback-032');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0292 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0293
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0293
     * @tc.desc   Verify playback JSON variant 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0293', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0293 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '33');
      payload.set('title', 'playback-033');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('title'), String('playback-033'));
      expect(payload.get('title')).assertEqual('playback-033');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0293 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0294
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0294
     * @tc.desc   Verify playback JSON variant 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0294', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0294 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '34');
      payload.set('title', 'playback-034');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('title'), String('playback-034'));
      expect(payload.get('title')).assertEqual('playback-034');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0294 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0295
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0295
     * @tc.desc   Verify playback JSON variant 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0295', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0295 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '35');
      payload.set('title', 'playback-035');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('title'), String('playback-035'));
      expect(payload.get('title')).assertEqual('playback-035');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0295 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0296
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0296
     * @tc.desc   Verify playback JSON variant 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0296', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0296 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '36');
      payload.set('title', 'playback-036');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('title'), String('playback-036'));
      expect(payload.get('title')).assertEqual('playback-036');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0296 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0297
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0297
     * @tc.desc   Verify playback JSON variant 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0297', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0297 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '37');
      payload.set('title', 'playback-037');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('title'), String('playback-037'));
      expect(payload.get('title')).assertEqual('playback-037');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0297 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0298
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0298
     * @tc.desc   Verify playback JSON variant 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0298', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0298 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '38');
      payload.set('title', 'playback-038');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('title'), String('playback-038'));
      expect(payload.get('title')).assertEqual('playback-038');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0298 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0299
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0299
     * @tc.desc   Verify playback JSON variant 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0299', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0299 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '39');
      payload.set('title', 'playback-039');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('title'), String('playback-039'));
      expect(payload.get('title')).assertEqual('playback-039');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0299 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0300
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0300
     * @tc.desc   Verify playback JSON variant 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0300 begin');
      const payload: Map<string, string> = new Map();
      payload.set('id', '40');
      payload.set('title', 'playback-040');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('title'), String('playback-040'));
      expect(payload.get('title')).assertEqual('playback-040');
      expect(payload.size).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0300 end');
    })
  })
}
