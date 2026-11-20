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
import { ScanSessionRecorder } from '../../../main/ets/scan/model/ScanSessionRecorder';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ScanNapiInterfaceDemo]';

export default function scanSessionRealTest() {
  describe('ScanSessionReal', () => {
    /**
     * @tc.number SUB_SCAN_SESSION_02_0001
     * @tc.name testSessionReal0001
     * @tc.desc append over capacity drops the oldest events
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testSessionReal0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionReal0001 begin');
      const recorder: ScanSessionRecorder = ScanSessionRecorder.make(ScanSessionRecorder.fill(150, 'e'));
      expect(recorder.count()).assertEqual(100);
      expect(recorder.first()).assertEqual('e50');
      expect(recorder.last()).assertEqual('e149');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionReal0001 end');
    });

    /**
     * @tc.number SUB_SCAN_SESSION_02_0002
     * @tc.name testSessionReal0002
     * @tc.desc clear empties the recorder
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testSessionReal0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionReal0002 begin');
      const recorder: ScanSessionRecorder = ScanSessionRecorder.make(['a', 'b', 'c']);
      expect(recorder.count()).assertEqual(3);
      recorder.clear();
      expect(recorder.count()).assertEqual(0);
      expect(recorder.first()).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionReal0002 end');
    });

    /**
     * @tc.number SUB_SCAN_SESSION_02_0003
     * @tc.name testSessionReal0003
     * @tc.desc make builds a recorder from an event array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testSessionReal0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionReal0003 begin');
      const recorder: ScanSessionRecorder = ScanSessionRecorder.make(['boot', 'found', 'open']);
      expect(recorder.count()).assertEqual(3);
      expect(recorder.first()).assertEqual('boot');
      expect(recorder.contains('found')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionReal0003 end');
    });

    /**
     * @tc.number SUB_SCAN_SESSION_02_0004
     * @tc.name testSessionReal0004
     * @tc.desc toArray returns a copy of the window
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testSessionReal0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionReal0004 begin');
      const recorder: ScanSessionRecorder = ScanSessionRecorder.make(ScanSessionRecorder.fill(101, 'e'));
      const copy: string[] = recorder.toArray();
      expect(copy.length).assertEqual(100);
      copy.push('tail');
      expect(recorder.count()).assertEqual(100);
      expect(recorder.contains('tail')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionReal0004 end');
    });

    /**
     * @tc.number SUB_SCAN_SESSION_02_0005
     * @tc.name testSessionReal0005
     * @tc.desc summary prints count and edge events
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testSessionReal0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionReal0005 begin');
      const recorder: ScanSessionRecorder = ScanSessionRecorder.make(['x', 'y']);
      expect(recorder.summary()).assertEqual('count=2 first=x last=y');
      expect(ScanSessionRecorder.make([]).summary()).assertEqual('count=0 first= last=');
      expect(recorder.append('z')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionReal0005 end');
    });

    /**
     * @tc.number SUB_SCAN_SESSION_02_0006
     * @tc.name testSessionReal0006
     * @tc.desc fill generates prefixed placeholders
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testSessionReal0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionReal0006 begin');
      const events: string[] = ScanSessionRecorder.fill(3, 'q');
      expect(events.length).assertEqual(3);
      expect(events[0]).assertEqual('q0');
      expect(events[2]).assertEqual('q2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionReal0006 end');
    });
  });
}
