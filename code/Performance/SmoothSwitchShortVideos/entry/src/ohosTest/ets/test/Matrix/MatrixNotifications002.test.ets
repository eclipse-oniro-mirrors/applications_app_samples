/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it } from '@ohos/hypium';
import { NotificationVector, verifyNotification } from '../Shared/MatrixFixture';

export default function registerMatrixNotifications002(): void {
  describe('MatrixNotifications002', (): void => {
    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0001
     * @tc.name MatrixNotifications002_0001
     * @tc.desc Verify notifications input vector 1 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0001', 0, (): void => {
      const vector = new NotificationVector("RNNACrLCNArRLCAlrN", -1, "change:-1,reload,add:-1,change:-1,add:-1", "reload,reload,add:-1,change:-1,change:-1,add:-1");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0002
     * @tc.name MatrixNotifications002_0002
     * @tc.desc Verify notifications input vector 2 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0002', 0, (): void => {
      const vector = new NotificationVector("LRRACNrALNrNlrN", 1, "add:1,change:1,reload,add:1,reload,reload", "add:1,change:1,reload");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0003
     * @tc.name MatrixNotifications002_0003
     * @tc.desc Verify notifications input vector 3 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0003', 0, (): void => {
      const vector = new NotificationVector("RLACNlCNAlLRAClrN", 7, "add:7,change:7,reload,add:7,change:7", "add:7,change:7,reload,change:7,reload,add:7,add:7,change:7");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0004
     * @tc.name MatrixNotifications002_0004
     * @tc.desc Verify notifications input vector 4 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0004', 0, (): void => {
      const vector = new NotificationVector("LRRAACrRARAlClrN", 1024, "add:1024,add:1024,change:1024,add:1024,add:1024", "add:1024,add:1024,change:1024,add:1024,add:1024,change:1024");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0005
     * @tc.name MatrixNotifications002_0005
     * @tc.desc Verify notifications input vector 5 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0005', 0, (): void => {
      const vector = new NotificationVector("LRRAACrRAACLNrNlrN", 2, "add:2,add:2,change:2,add:2,add:2,change:2,reload,reload", "add:2,add:2,change:2,add:2,add:2,change:2,reload");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0006
     * @tc.name MatrixNotifications002_0006
     * @tc.desc Verify notifications input vector 6 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0006', 0, (): void => {
      const vector = new NotificationVector("LRACAClrLNAClLRAClrN", -2, "add:-2,change:-2,add:-2,change:-2,reload,add:-2,change:-2,add:-2,change:-2", "add:-2,change:-2,add:-2,change:-2,add:-2,change:-2");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0007
     * @tc.name MatrixNotifications002_0007
     * @tc.desc Verify notifications input vector 7 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0007', 0, (): void => {
      const vector = new NotificationVector("LRCCArRAAClLRAClrN", -1, "change:-1,change:-1,add:-1,add:-1,add:-1,change:-1,add:-1,change:-1", "change:-1,change:-1,add:-1,add:-1,add:-1,change:-1,add:-1,change:-1");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0008
     * @tc.name MatrixNotifications002_0008
     * @tc.desc Verify notifications input vector 8 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0008', 0, (): void => {
      const vector = new NotificationVector("LRRAAClrLCLNrNlrN", -2, "add:-2,add:-2,change:-2,change:-2,reload,reload", "add:-2,add:-2,change:-2");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0009
     * @tc.name MatrixNotifications002_0009
     * @tc.desc Verify notifications input vector 9 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0009', 0, (): void => {
      const vector = new NotificationVector("RLACNrRAACLNrNlrN", 31, "add:31,change:31,reload,add:31,add:31,change:31,reload,reload", "add:31,change:31,reload,add:31,add:31,change:31,reload");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0010
     * @tc.name MatrixNotifications002_0010
     * @tc.desc Verify notifications input vector 10 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0010', 0, (): void => {
      const vector = new NotificationVector("RACNlRAACRAlClrN", 1024, "", "add:1024,change:1024,reload,add:1024,add:1024,change:1024,add:1024,change:1024");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0011
     * @tc.name MatrixNotifications002_0011
     * @tc.desc Verify notifications input vector 11 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0011', 0, (): void => {
      const vector = new NotificationVector("LLRAACrCNARAlClrN", 31, "add:31,add:31,change:31,change:31,reload,add:31,add:31", "add:31,add:31,change:31,add:31,change:31");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0012
     * @tc.name MatrixNotifications002_0012
     * @tc.desc Verify notifications input vector 12 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0012', 0, (): void => {
      const vector = new NotificationVector("RLCCArLNACRAlClrN", 1, "change:1,change:1,add:1,reload,add:1,change:1,add:1", "change:1,change:1,add:1,add:1,change:1");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0013
     * @tc.name MatrixNotifications002_0013
     * @tc.desc Verify notifications input vector 13 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0013', 0, (): void => {
      const vector = new NotificationVector("LRRCCArlRCNARAlClrN", 1024, "change:1024,change:1024,add:1024", "change:1024,change:1024,add:1024,change:1024,reload,add:1024,add:1024,change:1024");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0014
     * @tc.name MatrixNotifications002_0014
     * @tc.desc Verify notifications input vector 14 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0014', 0, (): void => {
      const vector = new NotificationVector("RLCCArLAACLNrNlrN", 0, "change:0,change:0,add:0,add:0,add:0,change:0,reload,reload", "change:0,change:0,add:0");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0015
     * @tc.name MatrixNotifications002_0015
     * @tc.desc Verify notifications input vector 15 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0015', 0, (): void => {
      const vector = new NotificationVector("RLNNACrlRNLNrNlrN", 1024, "reload,reload,add:1024,change:1024,reload,reload", "reload,reload,add:1024,change:1024,reload,reload");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0016
     * @tc.name MatrixNotifications002_0016
     * @tc.desc Verify notifications input vector 16 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0016', 0, (): void => {
      const vector = new NotificationVector("RAAClARAlClrN", 1024, "", "add:1024,add:1024,change:1024,add:1024,add:1024,change:1024");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0017
     * @tc.name MatrixNotifications002_0017
     * @tc.desc Verify notifications input vector 17 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0017', 0, (): void => {
      const vector = new NotificationVector("RNACrRAACrRLCAlrN", 1, "change:1,add:1", "reload,add:1,change:1,add:1,add:1,change:1,change:1,add:1");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0018
     * @tc.name MatrixNotifications002_0018
     * @tc.desc Verify notifications input vector 18 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0018', 0, (): void => {
      const vector = new NotificationVector("RLCNAlLAACRAlClrN", 7, "change:7,reload,add:7,add:7,add:7,change:7,add:7", "change:7,reload,add:7,add:7,add:7,change:7,add:7,change:7");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0019
     * @tc.name MatrixNotifications002_0019
     * @tc.desc Verify notifications input vector 19 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0019', 0, (): void => {
      const vector = new NotificationVector("LLRCNAlNAClLRAClrN", 2, "change:2,reload,add:2,add:2,change:2", "change:2,reload,add:2,reload,add:2,change:2,add:2,change:2");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0020
     * @tc.name MatrixNotifications002_0020
     * @tc.desc Verify notifications input vector 20 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0020', 0, (): void => {
      const vector = new NotificationVector("LRCNAlAAClLRAClrN", 1, "change:1,reload,add:1,add:1,change:1", "change:1,reload,add:1,add:1,add:1,change:1,add:1,change:1");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0021
     * @tc.name MatrixNotifications002_0021
     * @tc.desc Verify notifications input vector 21 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0021', 0, (): void => {
      const vector = new NotificationVector("LCCAlRAACrRLCAlrN", 1024, "change:1024,change:1024,add:1024,change:1024,add:1024", "add:1024,add:1024,change:1024,change:1024,add:1024");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0022
     * @tc.name MatrixNotifications002_0022
     * @tc.desc Verify notifications input vector 22 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0022', 0, (): void => {
      const vector = new NotificationVector("LLRNACrRAAClLRAClrN", 1024, "reload,add:1024,change:1024,add:1024,add:1024,change:1024,add:1024,change:1024", "reload,add:1024,change:1024,add:1024,add:1024,change:1024,add:1024,change:1024");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0023
     * @tc.name MatrixNotifications002_0023
     * @tc.desc Verify notifications input vector 23 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0023', 0, (): void => {
      const vector = new NotificationVector("LRRCCArLAACRAlClrN", 0, "change:0,change:0,add:0,add:0,add:0,change:0,add:0", "change:0,change:0,add:0,add:0,change:0");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0024
     * @tc.name MatrixNotifications002_0024
     * @tc.desc Verify notifications input vector 24 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0024', 0, (): void => {
      const vector = new NotificationVector("RCCArLAACrRLCAlrN", 31, "add:31,add:31,change:31,change:31,add:31", "change:31,change:31,add:31,change:31,add:31");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0025
     * @tc.name MatrixNotifications002_0025
     * @tc.desc Verify notifications input vector 25 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0025', 0, (): void => {
      const vector = new NotificationVector("LCNAlNRAlClrN", 31, "change:31,reload,add:31", "add:31,change:31");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0026
     * @tc.name MatrixNotifications002_0026
     * @tc.desc Verify notifications input vector 26 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0026', 0, (): void => {
      const vector = new NotificationVector("LAACrRALNrNlrN", 7, "add:7,add:7,change:7,add:7,reload,reload", "add:7,reload");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0027
     * @tc.name MatrixNotifications002_0027
     * @tc.desc Verify notifications input vector 27 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0027', 0, (): void => {
      const vector = new NotificationVector("RLCCArlRAACLNrNlrN", 1024, "change:1024,change:1024,add:1024,reload,reload", "change:1024,change:1024,add:1024,add:1024,add:1024,change:1024,reload");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0028
     * @tc.name MatrixNotifications002_0028
     * @tc.desc Verify notifications input vector 28 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0028', 0, (): void => {
      const vector = new NotificationVector("LRRACAClRAACRAlClrN", 2, "add:2,change:2,add:2,change:2", "add:2,change:2,add:2,change:2,add:2,add:2,change:2,add:2,change:2");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0029
     * @tc.name MatrixNotifications002_0029
     * @tc.desc Verify notifications input vector 29 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0029', 0, (): void => {
      const vector = new NotificationVector("RLACAClAAClLRAClrN", 1024, "add:1024,change:1024,add:1024,change:1024,add:1024,change:1024", "add:1024,change:1024,add:1024,change:1024,add:1024,add:1024,change:1024,add:1024,change:1024");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0030
     * @tc.name MatrixNotifications002_0030
     * @tc.desc Verify notifications input vector 30 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0030', 0, (): void => {
      const vector = new NotificationVector("RCAANlRAACLNrNlrN", 1, "reload,reload", "change:1,add:1,add:1,reload,add:1,add:1,change:1,reload");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0031
     * @tc.name MatrixNotifications002_0031
     * @tc.desc Verify notifications input vector 31 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0031', 0, (): void => {
      const vector = new NotificationVector("LNNAClRAACLNrNlrN", 1024, "reload,reload,add:1024,change:1024,reload,reload", "add:1024,add:1024,change:1024,reload");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0032
     * @tc.name MatrixNotifications002_0032
     * @tc.desc Verify notifications input vector 32 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0032', 0, (): void => {
      const vector = new NotificationVector("LNNACrlRAAClLRAClrN", 2, "reload,reload,add:2,change:2,add:2,change:2", "add:2,add:2,change:2,add:2,change:2");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0033
     * @tc.name MatrixNotifications002_0033
     * @tc.desc Verify notifications input vector 33 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0033', 0, (): void => {
      const vector = new NotificationVector("LCCArRCNARAlClrN", 1, "change:1,change:1,add:1,change:1,reload,add:1,add:1", "change:1,reload,add:1,add:1,change:1");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0034
     * @tc.name MatrixNotifications002_0034
     * @tc.desc Verify notifications input vector 34 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0034', 0, (): void => {
      const vector = new NotificationVector("LLRNACrRNACLNrNlrN", -2, "reload,add:-2,change:-2,reload,add:-2,change:-2,reload,reload", "reload,add:-2,change:-2,reload,add:-2,change:-2,reload");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0035
     * @tc.name MatrixNotifications002_0035
     * @tc.desc Verify notifications input vector 35 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0035', 0, (): void => {
      const vector = new NotificationVector("LCCAlCNALNrNlrN", 1024, "change:1024,change:1024,add:1024,reload,reload", "");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0036
     * @tc.name MatrixNotifications002_0036
     * @tc.desc Verify notifications input vector 36 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0036', 0, (): void => {
      const vector = new NotificationVector("LCNAlRARAlClrN", 7, "change:7,reload,add:7", "add:7,add:7,change:7");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0037
     * @tc.name MatrixNotifications002_0037
     * @tc.desc Verify notifications input vector 37 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0037', 0, (): void => {
      const vector = new NotificationVector("LRNACrLNACrRLCAlrN", 1, "reload,add:1,change:1,reload,add:1,change:1,change:1,add:1", "reload,add:1,change:1,change:1,add:1");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0038
     * @tc.name MatrixNotifications002_0038
     * @tc.desc Verify notifications input vector 38 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0038', 0, (): void => {
      const vector = new NotificationVector("LRRACNrRAACLNrNlrN", 2, "add:2,change:2,reload,add:2,add:2,change:2,reload,reload", "add:2,change:2,reload,add:2,add:2,change:2,reload");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0039
     * @tc.name MatrixNotifications002_0039
     * @tc.desc Verify notifications input vector 39 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0039', 0, (): void => {
      const vector = new NotificationVector("LRRNNAClAACrRLCAlrN", 0, "reload,reload,add:0,change:0,change:0,add:0", "reload,reload,add:0,change:0,add:0,add:0,change:0,change:0,add:0");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0040
     * @tc.name MatrixNotifications002_0040
     * @tc.desc Verify notifications input vector 40 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0040', 0, (): void => {
      const vector = new NotificationVector("LRACNlrLAACrRLCAlrN", -1, "add:-1,change:-1,reload,add:-1,add:-1,change:-1,change:-1,add:-1", "add:-1,change:-1,reload,change:-1,add:-1");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0041
     * @tc.name MatrixNotifications002_0041
     * @tc.desc Verify notifications input vector 41 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0041', 0, (): void => {
      const vector = new NotificationVector("LRACNrLCNARAlClrN", 1, "add:1,change:1,reload,change:1,reload,add:1,add:1", "add:1,change:1,reload,add:1,change:1");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0042
     * @tc.name MatrixNotifications002_0042
     * @tc.desc Verify notifications input vector 42 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0042', 0, (): void => {
      const vector = new NotificationVector("LLRCNArCNArRLCAlrN", -1, "change:-1,reload,add:-1,change:-1,reload,add:-1,change:-1,add:-1", "change:-1,reload,add:-1,change:-1,add:-1");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0043
     * @tc.name MatrixNotifications002_0043
     * @tc.desc Verify notifications input vector 43 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0043', 0, (): void => {
      const vector = new NotificationVector("LNNACrRARAlClrN", 1, "reload,reload,add:1,change:1,add:1,add:1", "add:1,add:1,change:1");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0044
     * @tc.name MatrixNotifications002_0044
     * @tc.desc Verify notifications input vector 44 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0044', 0, (): void => {
      const vector = new NotificationVector("RLCNArlRAACRAlClrN", 0, "change:0,reload,add:0", "change:0,reload,add:0,add:0,add:0,change:0,add:0,change:0");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0045
     * @tc.name MatrixNotifications002_0045
     * @tc.desc Verify notifications input vector 45 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0045', 0, (): void => {
      const vector = new NotificationVector("RLCAANrCNArRLCAlrN", -1, "change:-1,add:-1,add:-1,reload,change:-1,reload,add:-1,change:-1,add:-1", "change:-1,add:-1,add:-1,reload,change:-1,add:-1");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0046
     * @tc.name MatrixNotifications002_0046
     * @tc.desc Verify notifications input vector 46 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0046', 0, (): void => {
      const vector = new NotificationVector("LRNNAClLCNArRLCAlrN", -1, "reload,reload,add:-1,change:-1,change:-1,reload,add:-1,change:-1,add:-1", "reload,reload,add:-1,change:-1,change:-1,reload,add:-1,change:-1,add:-1");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0047
     * @tc.name MatrixNotifications002_0047
     * @tc.desc Verify notifications input vector 47 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0047', 0, (): void => {
      const vector = new NotificationVector("LAAClRNlLRAClrN", 31, "add:31,add:31,change:31,add:31,change:31", "reload,add:31,change:31");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0048
     * @tc.name MatrixNotifications002_0048
     * @tc.desc Verify notifications input vector 48 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0048', 0, (): void => {
      const vector = new NotificationVector("LRCCAlNACrRLCAlrN", 1024, "change:1024,change:1024,add:1024,change:1024,add:1024", "change:1024,change:1024,add:1024,reload,add:1024,change:1024,change:1024,add:1024");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0049
     * @tc.name MatrixNotifications002_0049
     * @tc.desc Verify notifications input vector 49 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0049', 0, (): void => {
      const vector = new NotificationVector("LRACACrCrRLCAlrN", 2, "add:2,change:2,add:2,change:2,change:2,change:2,add:2", "add:2,change:2,add:2,change:2,change:2,add:2");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0050
     * @tc.name MatrixNotifications002_0050
     * @tc.desc Verify notifications input vector 50 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0050', 0, (): void => {
      const vector = new NotificationVector("LNNAClrLNACRAlClrN", 0, "reload,reload,add:0,change:0,reload,add:0,change:0,add:0", "add:0,change:0");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0051
     * @tc.name MatrixNotifications002_0051
     * @tc.desc Verify notifications input vector 51 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0051', 0, (): void => {
      const vector = new NotificationVector("LRCCAlLNAClLRAClrN", 1024, "change:1024,change:1024,add:1024,reload,add:1024,change:1024,add:1024,change:1024", "change:1024,change:1024,add:1024,reload,add:1024,change:1024,add:1024,change:1024");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0052
     * @tc.name MatrixNotifications002_0052
     * @tc.desc Verify notifications input vector 52 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0052', 0, (): void => {
      const vector = new NotificationVector("LNNACrLARAlClrN", -2, "reload,reload,add:-2,change:-2,add:-2,add:-2", "add:-2,change:-2");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0053
     * @tc.name MatrixNotifications002_0053
     * @tc.desc Verify notifications input vector 53 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0053', 0, (): void => {
      const vector = new NotificationVector("RLNACrlRNlLRAClrN", 7, "reload,add:7,change:7,add:7,change:7", "reload,add:7,change:7,reload,add:7,change:7");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0054
     * @tc.name MatrixNotifications002_0054
     * @tc.desc Verify notifications input vector 54 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0054', 0, (): void => {
      const vector = new NotificationVector("RLCCArCLNrNlrN", 1024, "change:1024,change:1024,add:1024,change:1024,reload,reload", "change:1024,change:1024,add:1024");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0055
     * @tc.name MatrixNotifications002_0055
     * @tc.desc Verify notifications input vector 55 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0055', 0, (): void => {
      const vector = new NotificationVector("LRACNrNRAlClrN", 0, "add:0,change:0,reload,reload,add:0", "add:0,change:0,reload,add:0,change:0");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0056
     * @tc.name MatrixNotifications002_0056
     * @tc.desc Verify notifications input vector 56 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0056', 0, (): void => {
      const vector = new NotificationVector("LACACrlRARAlClrN", 31, "add:31,change:31,add:31,change:31", "add:31,add:31,change:31");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0057
     * @tc.name MatrixNotifications002_0057
     * @tc.desc Verify notifications input vector 57 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0057', 0, (): void => {
      const vector = new NotificationVector("RCAANrRClLRAClrN", -1, "add:-1,change:-1", "change:-1,add:-1,add:-1,reload,change:-1,add:-1,change:-1");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0058
     * @tc.name MatrixNotifications002_0058
     * @tc.desc Verify notifications input vector 58 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0058', 0, (): void => {
      const vector = new NotificationVector("LLRAAClRAACrRLCAlrN", 1, "add:1,add:1,change:1,change:1,add:1", "add:1,add:1,change:1,add:1,add:1,change:1,change:1,add:1");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0059
     * @tc.name MatrixNotifications002_0059
     * @tc.desc Verify notifications input vector 59 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0059', 0, (): void => {
      const vector = new NotificationVector("RLACAClRCNAlLRAClrN", 31, "add:31,change:31,add:31,change:31,add:31,change:31", "add:31,change:31,add:31,change:31,change:31,reload,add:31,add:31,change:31");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0060
     * @tc.name MatrixNotifications002_0060
     * @tc.desc Verify notifications input vector 60 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0060', 0, (): void => {
      const vector = new NotificationVector("LRACACrLNLNrNlrN", 1024, "add:1024,change:1024,add:1024,change:1024,reload,reload,reload", "add:1024,change:1024,add:1024,change:1024");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0061
     * @tc.name MatrixNotifications002_0061
     * @tc.desc Verify notifications input vector 61 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0061', 0, (): void => {
      const vector = new NotificationVector("RCAANlARAlClrN", 31, "", "change:31,add:31,add:31,reload,add:31,add:31,change:31");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0062
     * @tc.name MatrixNotifications002_0062
     * @tc.desc Verify notifications input vector 62 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0062', 0, (): void => {
      const vector = new NotificationVector("RCNAlCNALNrNlrN", 7, "reload,reload", "change:7,reload,add:7,change:7,reload,add:7,reload");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0063
     * @tc.name MatrixNotifications002_0063
     * @tc.desc Verify notifications input vector 63 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0063', 0, (): void => {
      const vector = new NotificationVector("LRCNArAlLRAClrN", 31, "change:31,reload,add:31,add:31,add:31,change:31", "change:31,reload,add:31,add:31,change:31");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0064
     * @tc.name MatrixNotifications002_0064
     * @tc.desc Verify notifications input vector 64 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0064', 0, (): void => {
      const vector = new NotificationVector("RAAClRNACRAlClrN", 1, "", "add:1,add:1,change:1,reload,add:1,change:1,add:1,change:1");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0065
     * @tc.name MatrixNotifications002_0065
     * @tc.desc Verify notifications input vector 65 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0065', 0, (): void => {
      const vector = new NotificationVector("LRNNACrCrRLCAlrN", 7, "reload,reload,add:7,change:7,change:7,change:7,add:7", "reload,reload,add:7,change:7,change:7,add:7");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0066
     * @tc.name MatrixNotifications002_0066
     * @tc.desc Verify notifications input vector 66 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0066', 0, (): void => {
      const vector = new NotificationVector("LRCNArCNAlLRAClrN", -1, "change:-1,reload,add:-1,change:-1,reload,add:-1,add:-1,change:-1", "change:-1,reload,add:-1,add:-1,change:-1");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0067
     * @tc.name MatrixNotifications002_0067
     * @tc.desc Verify notifications input vector 67 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0067', 0, (): void => {
      const vector = new NotificationVector("LCNAlrLNACrRLCAlrN", 0, "change:0,reload,add:0,reload,add:0,change:0,change:0,add:0", "change:0,add:0");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0068
     * @tc.name MatrixNotifications002_0068
     * @tc.desc Verify notifications input vector 68 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0068', 0, (): void => {
      const vector = new NotificationVector("LRACAClrLClLRAClrN", 1024, "add:1024,change:1024,add:1024,change:1024,change:1024,add:1024,change:1024", "add:1024,change:1024,add:1024,change:1024,add:1024,change:1024");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0069
     * @tc.name MatrixNotifications002_0069
     * @tc.desc Verify notifications input vector 69 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0069', 0, (): void => {
      const vector = new NotificationVector("LRAACrRAACrRLCAlrN", -2, "add:-2,add:-2,change:-2,add:-2,add:-2,change:-2,change:-2,add:-2", "add:-2,add:-2,change:-2,add:-2,add:-2,change:-2,change:-2,add:-2");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0070
     * @tc.name MatrixNotifications002_0070
     * @tc.desc Verify notifications input vector 70 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0070', 0, (): void => {
      const vector = new NotificationVector("LCNAlRCrRLCAlrN", 0, "change:0,reload,add:0,change:0,add:0", "change:0,change:0,add:0");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0071
     * @tc.name MatrixNotifications002_0071
     * @tc.desc Verify notifications input vector 71 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0071', 0, (): void => {
      const vector = new NotificationVector("RCAANlRNACLNrNlrN", 0, "reload,reload", "change:0,add:0,add:0,reload,reload,add:0,change:0,reload");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0072
     * @tc.name MatrixNotifications002_0072
     * @tc.desc Verify notifications input vector 72 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0072', 0, (): void => {
      const vector = new NotificationVector("RACNrAlLRAClrN", 2, "add:2,change:2", "add:2,change:2,reload,add:2,change:2");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0073
     * @tc.name MatrixNotifications002_0073
     * @tc.desc Verify notifications input vector 73 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0073', 0, (): void => {
      const vector = new NotificationVector("LRCNArLArRLCAlrN", 1, "change:1,reload,add:1,add:1,change:1,add:1", "change:1,reload,add:1,change:1,add:1");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0074
     * @tc.name MatrixNotifications002_0074
     * @tc.desc Verify notifications input vector 74 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0074', 0, (): void => {
      const vector = new NotificationVector("LRRACAClAAClLRAClrN", 31, "add:31,change:31,add:31,change:31,add:31,change:31", "add:31,change:31,add:31,change:31,add:31,add:31,change:31,add:31,change:31");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0075
     * @tc.name MatrixNotifications002_0075
     * @tc.desc Verify notifications input vector 75 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0075', 0, (): void => {
      const vector = new NotificationVector("LLRNAClNACLNrNlrN", -2, "reload,add:-2,change:-2,reload,reload", "reload,add:-2,change:-2,reload,add:-2,change:-2,reload");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0076
     * @tc.name MatrixNotifications002_0076
     * @tc.desc Verify notifications input vector 76 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0076', 0, (): void => {
      const vector = new NotificationVector("RCCArArRLCAlrN", 1024, "change:1024,add:1024", "change:1024,change:1024,add:1024,change:1024,add:1024");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0077
     * @tc.name MatrixNotifications002_0077
     * @tc.desc Verify notifications input vector 77 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0077', 0, (): void => {
      const vector = new NotificationVector("RLNNACrRCNALNrNlrN", -1, "reload,reload,add:-1,change:-1,change:-1,reload,add:-1,reload,reload", "reload,reload,add:-1,change:-1,change:-1,reload,add:-1,reload");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0078
     * @tc.name MatrixNotifications002_0078
     * @tc.desc Verify notifications input vector 78 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0078', 0, (): void => {
      const vector = new NotificationVector("LNNACrLCNArRLCAlrN", -2, "reload,reload,add:-2,change:-2,change:-2,reload,add:-2,change:-2,add:-2", "change:-2,add:-2");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0079
     * @tc.name MatrixNotifications002_0079
     * @tc.desc Verify notifications input vector 79 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0079', 0, (): void => {
      const vector = new NotificationVector("LLRCCArLCNArRLCAlrN", 0, "change:0,change:0,add:0,change:0,reload,add:0,change:0,add:0", "change:0,change:0,add:0,change:0,add:0");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS002_0080
     * @tc.name MatrixNotifications002_0080
     * @tc.desc Verify notifications input vector 80 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications002_0080', 0, (): void => {
      const vector = new NotificationVector("LRRNNAClLCrRLCAlrN", 1024, "reload,reload,add:1024,change:1024,change:1024,change:1024,add:1024", "reload,reload,add:1024,change:1024,change:1024,change:1024,add:1024");
      verifyNotification(vector);
    });

  });
}
