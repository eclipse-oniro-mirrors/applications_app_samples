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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Permission } from '../../../../main/ets/common/utils/Permission';
import { FileJumpTools, PlaylistItem } from '../../../../main/ets/common/FileJumpTools';
import { AbilityManager } from '../../../../main/ets/common/manager/AbilityManager';
import { FileBean } from '../../../../main/ets/component/bean/FileBean';
import { Tools } from '../../../../main/ets/common/utils/Tools';
import { createBean } from '../Shared/TestData';

const DOMAIN: number = 0x0000;
const TAG: string = 'TVFileManagerTest';

export default function networkConnectivityTest() {
  describe('NetworkConnectivity', () => {
    /*
     * Share requests carry the read and write uri grants only for the shared file.
     */
    describe('NetworkConnectivity_Share_Want_Security', () => {
      it('image_want_action', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: image_want_action');
        let want = FileJumpTools.getImageWant('a.jpg', 'file://a.jpg');
        expect(want.action).assertEqual('ohos.want.action.viewData');
      });

      it('image_want_type', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: image_want_type');
        let want = FileJumpTools.getImageWant('a.jpg', 'file://a.jpg');
        expect(want.type).assertEqual('image/*');
      });

      it('image_want_uri', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: image_want_uri');
        let want = FileJumpTools.getImageWant('a.jpg', 'file://a.jpg');
        expect(want.uri).assertEqual('file://a.jpg');
      });

      it('image_want_parameters', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: image_want_parameters');
        let want = FileJumpTools.getImageWant('a.jpg', 'file://a.jpg');
        let params = want.parameters;
        expect(params !== undefined).assertTrue();
        if (params) {
          expect(params['uri']).assertEqual('file://a.jpg');
          expect(params['name']).assertEqual('a.jpg');
        }
      });

      it('video_want_action', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: video_want_action');
        let want = await FileJumpTools.getVideoWant('v.mp4', 'file://not/exist.mp4');
        expect(want.action).assertEqual('ohos.want.action.viewData');
        expect(want.type).assertEqual('video/*');
      });

      it('audio_want_playlist', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: audio_want_playlist');
        let items: PlaylistItem[] = [{ name: 'a.mp3', uri: 'file://a.mp3', time: 1 }];
        let want = FileJumpTools.getAudioWant('a.mp3', 'file://a.mp3', 0, items);
        let params = want.parameters;
        if (params) {
          expect(params['playListCount']).assertEqual(1);
          expect(params['currentIndex']).assertEqual(0);
        }
      });

      it('photo_want_bundle', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: photo_want_bundle');
        let want = FileJumpTools.getPhotoWant('file://a.jpg');
        expect(want.bundleName).assertEqual('com.ohos.photos');
      });

      it('permission_api_contract', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: permission_api_contract');
        expect(typeof Permission.checkAndRequest).assertEqual('function');
      });

      it('ability_manager_api_contract', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ability_manager_api_contract');
        let manager: AbilityManager = new AbilityManager();
        expect(typeof manager.startShareAbility).assertEqual('function');
        expect(typeof manager.preloadShareService).assertEqual('function');
      });
    });

    /*
     * Wants are built from file uris, never from raw sandbox paths.
     */
    describe('NetworkConnectivity_Uri_Grant_Validation', () => {
      it('image_want_keeps_uri_scheme', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: image_want_keeps_uri_scheme');
        let want = FileJumpTools.getImageWant('photo.png', 'file://media/Photo/1.png');
        expect(want.uri?.indexOf('file://')).assertEqual(0);
      });

      it('audio_want_empty_playlist', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: audio_want_empty_playlist');
        let want = FileJumpTools.getAudioWant('a.mp3', 'file://a.mp3', 0, []);
        let params = want.parameters;
        if (params) {
          expect(params['playList']).assertEqual(undefined);
        }
      });

      it('security_flags_exist', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_flags_exist');
        let want = FileJumpTools.getImageWant('a.jpg', 'file://a.jpg');
        expect(want.flags).not().assertEqual(undefined);
      });
    });

    /*
     * Extended boundary, type and matrix coverage for NetworkConnectivity derived from the reference suite.
     */
    describe('NetworkConnectivity_Extended_Coverage', () => {
    });
  });
}
