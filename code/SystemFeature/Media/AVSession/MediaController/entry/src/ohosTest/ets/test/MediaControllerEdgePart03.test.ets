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

export default function mediaControllerEdgeTestPart03() {
  describe('MediaControllerEdgePart03', () => {
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0190
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0190
     * @tc.desc   Verify map overwrite and clear 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0190 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-030', 'first');
      map.set('edge-key-030', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-030')));
      expect(map.get('edge-key-030')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0190 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0191
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0191
     * @tc.desc   Verify map overwrite and clear 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0191 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-031', 'first');
      map.set('edge-key-031', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-031')));
      expect(map.get('edge-key-031')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0191 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0192
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0192
     * @tc.desc   Verify map overwrite and clear 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0192 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-032', 'first');
      map.set('edge-key-032', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-032')));
      expect(map.get('edge-key-032')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0192 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0193
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0193
     * @tc.desc   Verify map overwrite and clear 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0193 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-033', 'first');
      map.set('edge-key-033', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-033')));
      expect(map.get('edge-key-033')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0193 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0194
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0194
     * @tc.desc   Verify map overwrite and clear 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0194 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-034', 'first');
      map.set('edge-key-034', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-034')));
      expect(map.get('edge-key-034')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0194 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0195
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0195
     * @tc.desc   Verify map overwrite and clear 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0195 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-035', 'first');
      map.set('edge-key-035', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-035')));
      expect(map.get('edge-key-035')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0195 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0196
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0196
     * @tc.desc   Verify map overwrite and clear 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0196 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-036', 'first');
      map.set('edge-key-036', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-036')));
      expect(map.get('edge-key-036')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0196 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0197
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0197
     * @tc.desc   Verify map overwrite and clear 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0197 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-037', 'first');
      map.set('edge-key-037', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-037')));
      expect(map.get('edge-key-037')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0197 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0198
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0198
     * @tc.desc   Verify map overwrite and clear 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0198 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-038', 'first');
      map.set('edge-key-038', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-038')));
      expect(map.get('edge-key-038')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0198 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0199
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0199
     * @tc.desc   Verify map overwrite and clear 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0199 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-039', 'first');
      map.set('edge-key-039', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-039')));
      expect(map.get('edge-key-039')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0199 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0200
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0200
     * @tc.desc   Verify map overwrite and clear 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0200 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-040', 'first');
      map.set('edge-key-040', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-040')));
      expect(map.get('edge-key-040')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0200 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0201
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0201
     * @tc.desc   Verify map overwrite and clear 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0201 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-041', 'first');
      map.set('edge-key-041', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-041')));
      expect(map.get('edge-key-041')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0201 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0202
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0202
     * @tc.desc   Verify map overwrite and clear 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0202 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-042', 'first');
      map.set('edge-key-042', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-042')));
      expect(map.get('edge-key-042')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0202 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0203
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0203
     * @tc.desc   Verify map overwrite and clear 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0203 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-043', 'first');
      map.set('edge-key-043', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-043')));
      expect(map.get('edge-key-043')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0203 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0204
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0204
     * @tc.desc   Verify map overwrite and clear 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0204 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-044', 'first');
      map.set('edge-key-044', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-044')));
      expect(map.get('edge-key-044')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0204 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0205
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0205
     * @tc.desc   Verify map overwrite and clear 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0205 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-045', 'first');
      map.set('edge-key-045', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-045')));
      expect(map.get('edge-key-045')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0205 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0206
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0206
     * @tc.desc   Verify map overwrite and clear 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0206 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-046', 'first');
      map.set('edge-key-046', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-046')));
      expect(map.get('edge-key-046')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0206 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0207
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0207
     * @tc.desc   Verify map overwrite and clear 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0207 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-047', 'first');
      map.set('edge-key-047', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-047')));
      expect(map.get('edge-key-047')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0207 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0208
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0208
     * @tc.desc   Verify map overwrite and clear 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0208 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-048', 'first');
      map.set('edge-key-048', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-048')));
      expect(map.get('edge-key-048')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0208 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0209
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0209
     * @tc.desc   Verify map overwrite and clear 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0209 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-049', 'first');
      map.set('edge-key-049', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-049')));
      expect(map.get('edge-key-049')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0209 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0210
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0210
     * @tc.desc   Verify map overwrite and clear 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0210 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-050', 'first');
      map.set('edge-key-050', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-050')));
      expect(map.get('edge-key-050')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0210 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0211
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0211
     * @tc.desc   Verify map overwrite and clear 51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0211 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-051', 'first');
      map.set('edge-key-051', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-051')));
      expect(map.get('edge-key-051')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0211 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0212
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0212
     * @tc.desc   Verify map overwrite and clear 52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0212 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-052', 'first');
      map.set('edge-key-052', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-052')));
      expect(map.get('edge-key-052')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0212 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0213
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0213
     * @tc.desc   Verify map overwrite and clear 53.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0213 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-053', 'first');
      map.set('edge-key-053', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-053')));
      expect(map.get('edge-key-053')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0213 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0214
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0214
     * @tc.desc   Verify map overwrite and clear 54.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0214 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-054', 'first');
      map.set('edge-key-054', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-054')));
      expect(map.get('edge-key-054')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0214 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0215
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0215
     * @tc.desc   Verify map overwrite and clear 55.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0215 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-055', 'first');
      map.set('edge-key-055', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-055')));
      expect(map.get('edge-key-055')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0215 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0216
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0216
     * @tc.desc   Verify map overwrite and clear 56.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0216 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-056', 'first');
      map.set('edge-key-056', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-056')));
      expect(map.get('edge-key-056')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0216 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0217
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0217
     * @tc.desc   Verify map overwrite and clear 57.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0217 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-057', 'first');
      map.set('edge-key-057', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-057')));
      expect(map.get('edge-key-057')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0217 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0218
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0218
     * @tc.desc   Verify map overwrite and clear 58.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0218 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-058', 'first');
      map.set('edge-key-058', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-058')));
      expect(map.get('edge-key-058')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0218 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0219
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0219
     * @tc.desc   Verify map overwrite and clear 59.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0219 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-059', 'first');
      map.set('edge-key-059', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-059')));
      expect(map.get('edge-key-059')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0219 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0220
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0220
     * @tc.desc   Verify map overwrite and clear 60.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0220 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-060', 'first');
      map.set('edge-key-060', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-060')));
      expect(map.get('edge-key-060')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0220 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0221
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0221
     * @tc.desc   Verify JSON payload round trip 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0221 begin');
      const payload: Map<string, string> = new Map();
      payload.set('key', 'edge-json-001');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('key'), String('edge-json-001'));
      expect(payload.get('key')).assertEqual('edge-json-001');
      expect(payload.has('key')).assertTrue();
      expect(payload.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0221 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0222
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0222
     * @tc.desc   Verify JSON payload round trip 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0222 begin');
      const payload: Map<string, string> = new Map();
      payload.set('key', 'edge-json-002');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('key'), String('edge-json-002'));
      expect(payload.get('key')).assertEqual('edge-json-002');
      expect(payload.has('key')).assertTrue();
      expect(payload.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0222 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0223
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0223
     * @tc.desc   Verify JSON payload round trip 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0223 begin');
      const payload: Map<string, string> = new Map();
      payload.set('key', 'edge-json-003');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('key'), String('edge-json-003'));
      expect(payload.get('key')).assertEqual('edge-json-003');
      expect(payload.has('key')).assertTrue();
      expect(payload.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0223 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0224
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0224
     * @tc.desc   Verify JSON payload round trip 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0224 begin');
      const payload: Map<string, string> = new Map();
      payload.set('key', 'edge-json-004');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('key'), String('edge-json-004'));
      expect(payload.get('key')).assertEqual('edge-json-004');
      expect(payload.has('key')).assertTrue();
      expect(payload.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0224 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0225
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0225
     * @tc.desc   Verify JSON payload round trip 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0225 begin');
      const payload: Map<string, string> = new Map();
      payload.set('key', 'edge-json-005');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('key'), String('edge-json-005'));
      expect(payload.get('key')).assertEqual('edge-json-005');
      expect(payload.has('key')).assertTrue();
      expect(payload.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0225 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0226
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0226
     * @tc.desc   Verify JSON payload round trip 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0226 begin');
      const payload: Map<string, string> = new Map();
      payload.set('key', 'edge-json-006');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('key'), String('edge-json-006'));
      expect(payload.get('key')).assertEqual('edge-json-006');
      expect(payload.has('key')).assertTrue();
      expect(payload.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0226 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0227
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0227
     * @tc.desc   Verify JSON payload round trip 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0227 begin');
      const payload: Map<string, string> = new Map();
      payload.set('key', 'edge-json-007');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('key'), String('edge-json-007'));
      expect(payload.get('key')).assertEqual('edge-json-007');
      expect(payload.has('key')).assertTrue();
      expect(payload.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0227 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0228
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0228
     * @tc.desc   Verify JSON payload round trip 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0228 begin');
      const payload: Map<string, string> = new Map();
      payload.set('key', 'edge-json-008');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('key'), String('edge-json-008'));
      expect(payload.get('key')).assertEqual('edge-json-008');
      expect(payload.has('key')).assertTrue();
      expect(payload.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0228 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0229
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0229
     * @tc.desc   Verify JSON payload round trip 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0229 begin');
      const payload: Map<string, string> = new Map();
      payload.set('key', 'edge-json-009');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('key'), String('edge-json-009'));
      expect(payload.get('key')).assertEqual('edge-json-009');
      expect(payload.has('key')).assertTrue();
      expect(payload.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0229 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0230
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0230
     * @tc.desc   Verify JSON payload round trip 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0230 begin');
      const payload: Map<string, string> = new Map();
      payload.set('key', 'edge-json-010');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('key'), String('edge-json-010'));
      expect(payload.get('key')).assertEqual('edge-json-010');
      expect(payload.has('key')).assertTrue();
      expect(payload.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0230 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0231
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0231
     * @tc.desc   Verify JSON payload round trip 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0231 begin');
      const payload: Map<string, string> = new Map();
      payload.set('key', 'edge-json-011');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('key'), String('edge-json-011'));
      expect(payload.get('key')).assertEqual('edge-json-011');
      expect(payload.has('key')).assertTrue();
      expect(payload.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0231 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0232
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0232
     * @tc.desc   Verify JSON payload round trip 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0232 begin');
      const payload: Map<string, string> = new Map();
      payload.set('key', 'edge-json-012');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('key'), String('edge-json-012'));
      expect(payload.get('key')).assertEqual('edge-json-012');
      expect(payload.has('key')).assertTrue();
      expect(payload.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0232 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0233
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0233
     * @tc.desc   Verify JSON payload round trip 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0233 begin');
      const payload: Map<string, string> = new Map();
      payload.set('key', 'edge-json-013');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('key'), String('edge-json-013'));
      expect(payload.get('key')).assertEqual('edge-json-013');
      expect(payload.has('key')).assertTrue();
      expect(payload.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0233 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0234
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0234
     * @tc.desc   Verify JSON payload round trip 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0234 begin');
      const payload: Map<string, string> = new Map();
      payload.set('key', 'edge-json-014');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('key'), String('edge-json-014'));
      expect(payload.get('key')).assertEqual('edge-json-014');
      expect(payload.has('key')).assertTrue();
      expect(payload.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0234 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0235
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0235
     * @tc.desc   Verify JSON payload round trip 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0235 begin');
      const payload: Map<string, string> = new Map();
      payload.set('key', 'edge-json-015');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('key'), String('edge-json-015'));
      expect(payload.get('key')).assertEqual('edge-json-015');
      expect(payload.has('key')).assertTrue();
      expect(payload.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0235 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0236
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0236
     * @tc.desc   Verify JSON payload round trip 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0236 begin');
      const payload: Map<string, string> = new Map();
      payload.set('key', 'edge-json-016');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('key'), String('edge-json-016'));
      expect(payload.get('key')).assertEqual('edge-json-016');
      expect(payload.has('key')).assertTrue();
      expect(payload.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0236 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0237
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0237
     * @tc.desc   Verify JSON payload round trip 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0237 begin');
      const payload: Map<string, string> = new Map();
      payload.set('key', 'edge-json-017');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('key'), String('edge-json-017'));
      expect(payload.get('key')).assertEqual('edge-json-017');
      expect(payload.has('key')).assertTrue();
      expect(payload.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0237 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0238
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0238
     * @tc.desc   Verify JSON payload round trip 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0238 begin');
      const payload: Map<string, string> = new Map();
      payload.set('key', 'edge-json-018');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('key'), String('edge-json-018'));
      expect(payload.get('key')).assertEqual('edge-json-018');
      expect(payload.has('key')).assertTrue();
      expect(payload.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0238 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0239
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0239
     * @tc.desc   Verify JSON payload round trip 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0239 begin');
      const payload: Map<string, string> = new Map();
      payload.set('key', 'edge-json-019');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('key'), String('edge-json-019'));
      expect(payload.get('key')).assertEqual('edge-json-019');
      expect(payload.has('key')).assertTrue();
      expect(payload.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0239 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0240
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0240
     * @tc.desc   Verify JSON payload round trip 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0240 begin');
      const payload: Map<string, string> = new Map();
      payload.set('key', 'edge-json-020');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('key'), String('edge-json-020'));
      expect(payload.get('key')).assertEqual('edge-json-020');
      expect(payload.has('key')).assertTrue();
      expect(payload.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0240 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0241
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0241
     * @tc.desc   Verify JSON payload round trip 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0241 begin');
      const payload: Map<string, string> = new Map();
      payload.set('key', 'edge-json-021');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('key'), String('edge-json-021'));
      expect(payload.get('key')).assertEqual('edge-json-021');
      expect(payload.has('key')).assertTrue();
      expect(payload.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0241 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0242
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0242
     * @tc.desc   Verify JSON payload round trip 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0242 begin');
      const payload: Map<string, string> = new Map();
      payload.set('key', 'edge-json-022');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('key'), String('edge-json-022'));
      expect(payload.get('key')).assertEqual('edge-json-022');
      expect(payload.has('key')).assertTrue();
      expect(payload.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0242 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0243
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0243
     * @tc.desc   Verify JSON payload round trip 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0243 begin');
      const payload: Map<string, string> = new Map();
      payload.set('key', 'edge-json-023');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('key'), String('edge-json-023'));
      expect(payload.get('key')).assertEqual('edge-json-023');
      expect(payload.has('key')).assertTrue();
      expect(payload.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0243 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0244
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0244
     * @tc.desc   Verify JSON payload round trip 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0244 begin');
      const payload: Map<string, string> = new Map();
      payload.set('key', 'edge-json-024');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('key'), String('edge-json-024'));
      expect(payload.get('key')).assertEqual('edge-json-024');
      expect(payload.has('key')).assertTrue();
      expect(payload.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0244 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0245
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0245
     * @tc.desc   Verify JSON payload round trip 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0245 begin');
      const payload: Map<string, string> = new Map();
      payload.set('key', 'edge-json-025');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('key'), String('edge-json-025'));
      expect(payload.get('key')).assertEqual('edge-json-025');
      expect(payload.has('key')).assertTrue();
      expect(payload.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0245 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0246
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0246
     * @tc.desc   Verify JSON payload round trip 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0246 begin');
      const payload: Map<string, string> = new Map();
      payload.set('key', 'edge-json-026');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('key'), String('edge-json-026'));
      expect(payload.get('key')).assertEqual('edge-json-026');
      expect(payload.has('key')).assertTrue();
      expect(payload.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0246 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0247
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0247
     * @tc.desc   Verify JSON payload round trip 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0247 begin');
      const payload: Map<string, string> = new Map();
      payload.set('key', 'edge-json-027');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('key'), String('edge-json-027'));
      expect(payload.get('key')).assertEqual('edge-json-027');
      expect(payload.has('key')).assertTrue();
      expect(payload.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0247 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0248
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0248
     * @tc.desc   Verify JSON payload round trip 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0248 begin');
      const payload: Map<string, string> = new Map();
      payload.set('key', 'edge-json-028');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('key'), String('edge-json-028'));
      expect(payload.get('key')).assertEqual('edge-json-028');
      expect(payload.has('key')).assertTrue();
      expect(payload.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0248 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0249
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0249
     * @tc.desc   Verify JSON payload round trip 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0249 begin');
      const payload: Map<string, string> = new Map();
      payload.set('key', 'edge-json-029');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('key'), String('edge-json-029'));
      expect(payload.get('key')).assertEqual('edge-json-029');
      expect(payload.has('key')).assertTrue();
      expect(payload.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0249 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0250
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0250
     * @tc.desc   Verify JSON payload round trip 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0250 begin');
      const payload: Map<string, string> = new Map();
      payload.set('key', 'edge-json-030');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('key'), String('edge-json-030'));
      expect(payload.get('key')).assertEqual('edge-json-030');
      expect(payload.has('key')).assertTrue();
      expect(payload.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0250 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0251
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0251
     * @tc.desc   Verify JSON payload round trip 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0251 begin');
      const payload: Map<string, string> = new Map();
      payload.set('key', 'edge-json-031');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('key'), String('edge-json-031'));
      expect(payload.get('key')).assertEqual('edge-json-031');
      expect(payload.has('key')).assertTrue();
      expect(payload.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0251 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0252
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0252
     * @tc.desc   Verify JSON payload round trip 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0252 begin');
      const payload: Map<string, string> = new Map();
      payload.set('key', 'edge-json-032');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('key'), String('edge-json-032'));
      expect(payload.get('key')).assertEqual('edge-json-032');
      expect(payload.has('key')).assertTrue();
      expect(payload.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0252 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0253
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0253
     * @tc.desc   Verify JSON payload round trip 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0253 begin');
      const payload: Map<string, string> = new Map();
      payload.set('key', 'edge-json-033');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('key'), String('edge-json-033'));
      expect(payload.get('key')).assertEqual('edge-json-033');
      expect(payload.has('key')).assertTrue();
      expect(payload.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0253 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0254
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0254
     * @tc.desc   Verify JSON payload round trip 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0254', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0254 begin');
      const payload: Map<string, string> = new Map();
      payload.set('key', 'edge-json-034');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('key'), String('edge-json-034'));
      expect(payload.get('key')).assertEqual('edge-json-034');
      expect(payload.has('key')).assertTrue();
      expect(payload.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0254 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0255
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0255
     * @tc.desc   Verify JSON payload round trip 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0255 begin');
      const payload: Map<string, string> = new Map();
      payload.set('key', 'edge-json-035');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('key'), String('edge-json-035'));
      expect(payload.get('key')).assertEqual('edge-json-035');
      expect(payload.has('key')).assertTrue();
      expect(payload.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0255 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0256
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0256
     * @tc.desc   Verify JSON payload round trip 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0256 begin');
      const payload: Map<string, string> = new Map();
      payload.set('key', 'edge-json-036');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('key'), String('edge-json-036'));
      expect(payload.get('key')).assertEqual('edge-json-036');
      expect(payload.has('key')).assertTrue();
      expect(payload.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0256 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0257
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0257
     * @tc.desc   Verify JSON payload round trip 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0257', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0257 begin');
      const payload: Map<string, string> = new Map();
      payload.set('key', 'edge-json-037');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('key'), String('edge-json-037'));
      expect(payload.get('key')).assertEqual('edge-json-037');
      expect(payload.has('key')).assertTrue();
      expect(payload.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0257 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0258
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0258
     * @tc.desc   Verify JSON payload round trip 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0258 begin');
      const payload: Map<string, string> = new Map();
      payload.set('key', 'edge-json-038');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('key'), String('edge-json-038'));
      expect(payload.get('key')).assertEqual('edge-json-038');
      expect(payload.has('key')).assertTrue();
      expect(payload.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0258 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0259
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0259
     * @tc.desc   Verify JSON payload round trip 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0259 begin');
      const payload: Map<string, string> = new Map();
      payload.set('key', 'edge-json-039');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('key'), String('edge-json-039'));
      expect(payload.get('key')).assertEqual('edge-json-039');
      expect(payload.has('key')).assertTrue();
      expect(payload.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0259 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0260
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0260
     * @tc.desc   Verify JSON payload round trip 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0260 begin');
      const payload: Map<string, string> = new Map();
      payload.set('key', 'edge-json-040');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', payload.get('key'), String('edge-json-040'));
      expect(payload.get('key')).assertEqual('edge-json-040');
      expect(payload.has('key')).assertTrue();
      expect(payload.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0260 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0281
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0281
     * @tc.desc   Verify enum combination 1 (PREPARE/SINGLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0281', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0281 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_PREPARE;
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_SINGLE;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=%%{public}d', state, state);
      expect(state).assertEqual(AVSessionManager.PlaybackState.PLAYBACK_STATE_PREPARE);
      expect(mode).assertEqual(AVSessionManager.LoopMode.LOOP_MODE_SINGLE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0281 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0282
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0282
     * @tc.desc   Verify enum combination 2 (PLAY/LIST).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0282', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0282 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_PLAY;
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_LIST;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=%%{public}d', state, state);
      expect(state).assertEqual(AVSessionManager.PlaybackState.PLAYBACK_STATE_PLAY);
      expect(mode).assertEqual(AVSessionManager.LoopMode.LOOP_MODE_LIST);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0282 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0283
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0283
     * @tc.desc   Verify enum combination 3 (PAUSE/SHUFFLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0283', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0283 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_PAUSE;
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_SHUFFLE;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=%%{public}d', state, state);
      expect(state).assertEqual(AVSessionManager.PlaybackState.PLAYBACK_STATE_PAUSE);
      expect(mode).assertEqual(AVSessionManager.LoopMode.LOOP_MODE_SHUFFLE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0283 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0284
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0284
     * @tc.desc   Verify enum combination 4 (STOP/CUSTOM).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0284', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0284 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_STOP;
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_CUSTOM;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=%%{public}d', state, state);
      expect(state).assertEqual(AVSessionManager.PlaybackState.PLAYBACK_STATE_STOP);
      expect(mode).assertEqual(AVSessionManager.LoopMode.LOOP_MODE_CUSTOM);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0284 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0285
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0285
     * @tc.desc   Verify enum combination 5 (COMPLETED/SEQUENCE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0285', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0285 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_COMPLETED;
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_SEQUENCE;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=%%{public}d', state, state);
      expect(state).assertEqual(AVSessionManager.PlaybackState.PLAYBACK_STATE_COMPLETED);
      expect(mode).assertEqual(AVSessionManager.LoopMode.LOOP_MODE_SEQUENCE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0285 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0286
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0286
     * @tc.desc   Verify enum combination 6 (RELEASED/SINGLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0286', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0286 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_RELEASED;
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_SINGLE;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=%%{public}d', state, state);
      expect(state).assertEqual(AVSessionManager.PlaybackState.PLAYBACK_STATE_RELEASED);
      expect(mode).assertEqual(AVSessionManager.LoopMode.LOOP_MODE_SINGLE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0286 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0287
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0287
     * @tc.desc   Verify enum combination 7 (ERROR/LIST).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0287', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0287 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_ERROR;
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_LIST;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=%%{public}d', state, state);
      expect(state).assertEqual(AVSessionManager.PlaybackState.PLAYBACK_STATE_ERROR);
      expect(mode).assertEqual(AVSessionManager.LoopMode.LOOP_MODE_LIST);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0287 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0288
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0288
     * @tc.desc   Verify enum combination 8 (IDLE/SHUFFLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0288', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0288 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_IDLE;
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_SHUFFLE;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=%%{public}d', state, state);
      expect(state).assertEqual(AVSessionManager.PlaybackState.PLAYBACK_STATE_IDLE);
      expect(mode).assertEqual(AVSessionManager.LoopMode.LOOP_MODE_SHUFFLE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0288 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0289
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0289
     * @tc.desc   Verify enum combination 9 (BUFFERING/CUSTOM).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0289', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0289 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_BUFFERING;
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_CUSTOM;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=%%{public}d', state, state);
      expect(state).assertEqual(AVSessionManager.PlaybackState.PLAYBACK_STATE_BUFFERING);
      expect(mode).assertEqual(AVSessionManager.LoopMode.LOOP_MODE_CUSTOM);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0289 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0290
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0290
     * @tc.desc   Verify enum combination 10 (INITIAL/SEQUENCE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0290 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_INITIAL;
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_SEQUENCE;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=%%{public}d', state, state);
      expect(state).assertEqual(AVSessionManager.PlaybackState.PLAYBACK_STATE_INITIAL);
      expect(mode).assertEqual(AVSessionManager.LoopMode.LOOP_MODE_SEQUENCE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0290 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0291
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0291
     * @tc.desc   Verify enum combination 11 (PREPARE/SINGLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0291', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0291 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_PREPARE;
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_SINGLE;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=%%{public}d', state, state);
      expect(state).assertEqual(AVSessionManager.PlaybackState.PLAYBACK_STATE_PREPARE);
      expect(mode).assertEqual(AVSessionManager.LoopMode.LOOP_MODE_SINGLE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0291 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0292
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0292
     * @tc.desc   Verify enum combination 12 (PLAY/LIST).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0292', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0292 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_PLAY;
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_LIST;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=%%{public}d', state, state);
      expect(state).assertEqual(AVSessionManager.PlaybackState.PLAYBACK_STATE_PLAY);
      expect(mode).assertEqual(AVSessionManager.LoopMode.LOOP_MODE_LIST);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0292 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0293
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0293
     * @tc.desc   Verify enum combination 13 (PAUSE/SHUFFLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0293', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0293 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_PAUSE;
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_SHUFFLE;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=%%{public}d', state, state);
      expect(state).assertEqual(AVSessionManager.PlaybackState.PLAYBACK_STATE_PAUSE);
      expect(mode).assertEqual(AVSessionManager.LoopMode.LOOP_MODE_SHUFFLE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0293 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0294
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0294
     * @tc.desc   Verify enum combination 14 (STOP/CUSTOM).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0294', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0294 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_STOP;
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_CUSTOM;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=%%{public}d', state, state);
      expect(state).assertEqual(AVSessionManager.PlaybackState.PLAYBACK_STATE_STOP);
      expect(mode).assertEqual(AVSessionManager.LoopMode.LOOP_MODE_CUSTOM);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0294 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0295
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0295
     * @tc.desc   Verify enum combination 15 (COMPLETED/SEQUENCE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0295', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0295 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_COMPLETED;
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_SEQUENCE;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=%%{public}d', state, state);
      expect(state).assertEqual(AVSessionManager.PlaybackState.PLAYBACK_STATE_COMPLETED);
      expect(mode).assertEqual(AVSessionManager.LoopMode.LOOP_MODE_SEQUENCE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0295 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0296
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0296
     * @tc.desc   Verify enum combination 16 (RELEASED/SINGLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0296', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0296 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_RELEASED;
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_SINGLE;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=%%{public}d', state, state);
      expect(state).assertEqual(AVSessionManager.PlaybackState.PLAYBACK_STATE_RELEASED);
      expect(mode).assertEqual(AVSessionManager.LoopMode.LOOP_MODE_SINGLE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0296 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0297
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0297
     * @tc.desc   Verify enum combination 17 (ERROR/LIST).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0297', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0297 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_ERROR;
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_LIST;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=%%{public}d', state, state);
      expect(state).assertEqual(AVSessionManager.PlaybackState.PLAYBACK_STATE_ERROR);
      expect(mode).assertEqual(AVSessionManager.LoopMode.LOOP_MODE_LIST);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0297 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0298
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0298
     * @tc.desc   Verify enum combination 18 (IDLE/SHUFFLE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0298', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0298 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_IDLE;
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_SHUFFLE;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=%%{public}d', state, state);
      expect(state).assertEqual(AVSessionManager.PlaybackState.PLAYBACK_STATE_IDLE);
      expect(mode).assertEqual(AVSessionManager.LoopMode.LOOP_MODE_SHUFFLE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0298 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0299
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0299
     * @tc.desc   Verify enum combination 19 (BUFFERING/CUSTOM).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0299', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0299 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_BUFFERING;
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_CUSTOM;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=%%{public}d', state, state);
      expect(state).assertEqual(AVSessionManager.PlaybackState.PLAYBACK_STATE_BUFFERING);
      expect(mode).assertEqual(AVSessionManager.LoopMode.LOOP_MODE_CUSTOM);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0299 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0300
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0300
     * @tc.desc   Verify enum combination 20 (INITIAL/SEQUENCE).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0300 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_INITIAL;
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_SEQUENCE;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=%%{public}d', state, state);
      expect(state).assertEqual(AVSessionManager.PlaybackState.PLAYBACK_STATE_INITIAL);
      expect(mode).assertEqual(AVSessionManager.LoopMode.LOOP_MODE_SEQUENCE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0300 end');
    })
  })
}
