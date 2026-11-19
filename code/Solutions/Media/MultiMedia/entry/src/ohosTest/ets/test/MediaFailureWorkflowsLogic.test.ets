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

import { describe, it, expect, beforeEach } from '@ohos/hypium';
import { fileIo } from '@kit.CoreFileKit';
import { photoAccessHelper } from '@kit.MediaLibraryKit';
import type common from '@ohos.app.ability.common';
import MediaUtils, { FileType } from '../../../main/ets/model/MediaUtils';
import type { MediaAssetHandle, FileInfo, AlbumInfo } from '../../../main/ets/model/MediaUtils';
import { LogicTestLog } from '../utils/LogicTestLog';
import {
  MediaTrace, FakeMediaClock, FakeMediaFiles, FakeMediaPhoto, FakeMediaFetch, FakeMediaLibrary, mediaContext
} from '../utils/MediaFakes';

export default function MediaFailureWorkflowsLogic(): void {
  describe("MediaFailureWorkflowsLogic", () => {
    let trace: MediaTrace;
    let files: FakeMediaFiles;
    let library: FakeMediaLibrary;
    let clock: FakeMediaClock;
    let context: common.UIAbilityContext;
    let media: MediaUtils;

    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
      trace = new MediaTrace();
      files = new FakeMediaFiles(trace);
      library = new FakeMediaLibrary(trace);
      clock = new FakeMediaClock(trace);
      context = mediaContext('/synthetic/media/alpha');
      media = new MediaUtils(context, files, library, clock);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1184
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1184
     * @tc.nameDesc Creation failure closes every acquired native fetch result: Verify rejection boundaries, no fd
     * allocation, fetch finally cleanup and independent successful retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1184", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1184";
      LogicTestLog.begin(name, "FileType.IMAGE; creation phase=create; synthetic variant=0");
      clock.date = "20261119";
      clock.time = "000000";
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/create-failure-0", photoAccessHelper.PhotoType.IMAGE, "recovered-0.jpg");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/create-failure-0";
      library.results = [fetch];
      library.createError = "synthetic create creation failure 0";
      let message: string = '';
      try {
        await media.createAndGetUri(FileType.IMAGE);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Exact failure rejection", "synthetic create creation failure 0", message);
      expect(message).assertEqual("synthetic create creation failure 0");
      LogicTestLog.number(name, "Only one create attempted", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Native type on failed request", photoAccessHelper.PhotoType.IMAGE,
        library.creates[0].photoType);
      expect(library.creates[0].photoType).assertEqual(photoAccessHelper.PhotoType.IMAGE);
      LogicTestLog.value(name, "Native extension on failed request", "jpg", library.creates[0].extension);
      expect(library.creates[0].extension).assertEqual("jpg");
      LogicTestLog.number(name, "Fetch request attempts", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "Fetch getAllObjects attempts", 0, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(0);
      LogicTestLog.number(name, "Fetch finally close attempts", 0, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(0);
      LogicTestLog.number(name, "No handle metadata read after failed lookup", 0, photo.gets.length);
      expect(photo.gets.length).assertEqual(0);
      LogicTestLog.value(name, "Failed creation operation order", "clock.date|clock.time|library.create",
        trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create");
      LogicTestLog.number(name, "No descriptor allocated by failed creation", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem open on failed native creation", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem rename on failed native creation", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      library.createError = '';
      library.fetchError = '';
      const retryFetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.results = [retryFetch];
      library.resultIndex = 0;
      const recovered: MediaAssetHandle = await media.createAndGetUri(FileType.IMAGE);
      LogicTestLog.value(name, "Retry handle URI", "fake://media/create-failure-0", recovered.uri);
      expect(recovered.uri).assertEqual("fake://media/create-failure-0");
      LogicTestLog.value(name, "Retry native display name", "recovered-0.jpg", recovered.displayName);
      expect(recovered.displayName).assertEqual("recovered-0.jpg");
      LogicTestLog.number(name, "Retry type", 1, recovered.mediaType);
      expect(recovered.mediaType).assertEqual(1);
      LogicTestLog.number(name, "Retry performs one new create", 2, library.creates.length);
      expect(library.creates.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch count", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Retry fetch read once", 1, retryFetch.allCalls);
      expect(retryFetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Retry fetch closed once", 1, retryFetch.closeCalls);
      expect(retryFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Original acquired result not closed twice", 0, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(0);
      LogicTestLog.value(name, "Retry closes result before exposing metadata",
        "clock.date|clock.time|library.create|clock.date|clock.time|l" +
        "ibrary.create|library.fetch|fetch.all|fetch.close|photo.get", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|clock.date|clock.time|l" +
        "ibrary.create|library.fetch|fetch.all|fetch.close|photo.get");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1185
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1185
     * @tc.nameDesc Creation failure closes every acquired native fetch result: Verify rejection boundaries, no fd
     * allocation, fetch finally cleanup and independent successful retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1185", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1185";
      LogicTestLog.begin(name, "FileType.VIDEO; creation phase=create; synthetic variant=0");
      clock.date = "20240229";
      clock.time = "235959";
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/create-failure-1", photoAccessHelper.PhotoType.VIDEO, "recovered-1.mp4");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/create-failure-1";
      library.results = [fetch];
      library.createError = "synthetic create creation failure 0";
      let message: string = '';
      try {
        await media.createAndGetUri(FileType.VIDEO);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Exact failure rejection", "synthetic create creation failure 0", message);
      expect(message).assertEqual("synthetic create creation failure 0");
      LogicTestLog.number(name, "Only one create attempted", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Native type on failed request", photoAccessHelper.PhotoType.VIDEO,
        library.creates[0].photoType);
      expect(library.creates[0].photoType).assertEqual(photoAccessHelper.PhotoType.VIDEO);
      LogicTestLog.value(name, "Native extension on failed request", "mp4", library.creates[0].extension);
      expect(library.creates[0].extension).assertEqual("mp4");
      LogicTestLog.number(name, "Fetch request attempts", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "Fetch getAllObjects attempts", 0, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(0);
      LogicTestLog.number(name, "Fetch finally close attempts", 0, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(0);
      LogicTestLog.number(name, "No handle metadata read after failed lookup", 0, photo.gets.length);
      expect(photo.gets.length).assertEqual(0);
      LogicTestLog.value(name, "Failed creation operation order", "clock.date|clock.time|library.create",
        trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create");
      LogicTestLog.number(name, "No descriptor allocated by failed creation", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem open on failed native creation", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem rename on failed native creation", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      library.createError = '';
      library.fetchError = '';
      const retryFetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.results = [retryFetch];
      library.resultIndex = 0;
      const recovered: MediaAssetHandle = await media.createAndGetUri(FileType.VIDEO);
      LogicTestLog.value(name, "Retry handle URI", "fake://media/create-failure-1", recovered.uri);
      expect(recovered.uri).assertEqual("fake://media/create-failure-1");
      LogicTestLog.value(name, "Retry native display name", "recovered-1.mp4", recovered.displayName);
      expect(recovered.displayName).assertEqual("recovered-1.mp4");
      LogicTestLog.number(name, "Retry type", 2, recovered.mediaType);
      expect(recovered.mediaType).assertEqual(2);
      LogicTestLog.number(name, "Retry performs one new create", 2, library.creates.length);
      expect(library.creates.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch count", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Retry fetch read once", 1, retryFetch.allCalls);
      expect(retryFetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Retry fetch closed once", 1, retryFetch.closeCalls);
      expect(retryFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Original acquired result not closed twice", 0, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(0);
      LogicTestLog.value(name, "Retry closes result before exposing metadata",
        "clock.date|clock.time|library.create|clock.date|clock.time|l" +
        "ibrary.create|library.fetch|fetch.all|fetch.close|photo.get", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|clock.date|clock.time|l" +
        "ibrary.create|library.fetch|fetch.all|fetch.close|photo.get");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1186
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1186
     * @tc.nameDesc Creation failure closes every acquired native fetch result: Verify rejection boundaries, no fd
     * allocation, fetch finally cleanup and independent successful retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1186", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1186";
      LogicTestLog.begin(name, "FileType.IMAGE; creation phase=create; synthetic variant=1");
      clock.date = "20000101";
      clock.time = "010203";
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/create-failure-2", photoAccessHelper.PhotoType.IMAGE, "recovered-2.jpg");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/create-failure-2";
      library.results = [fetch];
      library.createError = "synthetic create creation failure 1";
      let message: string = '';
      try {
        await media.createAndGetUri(FileType.IMAGE);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Exact failure rejection", "synthetic create creation failure 1", message);
      expect(message).assertEqual("synthetic create creation failure 1");
      LogicTestLog.number(name, "Only one create attempted", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Native type on failed request", photoAccessHelper.PhotoType.IMAGE,
        library.creates[0].photoType);
      expect(library.creates[0].photoType).assertEqual(photoAccessHelper.PhotoType.IMAGE);
      LogicTestLog.value(name, "Native extension on failed request", "jpg", library.creates[0].extension);
      expect(library.creates[0].extension).assertEqual("jpg");
      LogicTestLog.number(name, "Fetch request attempts", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "Fetch getAllObjects attempts", 0, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(0);
      LogicTestLog.number(name, "Fetch finally close attempts", 0, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(0);
      LogicTestLog.number(name, "No handle metadata read after failed lookup", 0, photo.gets.length);
      expect(photo.gets.length).assertEqual(0);
      LogicTestLog.value(name, "Failed creation operation order", "clock.date|clock.time|library.create",
        trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create");
      LogicTestLog.number(name, "No descriptor allocated by failed creation", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem open on failed native creation", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem rename on failed native creation", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      library.createError = '';
      library.fetchError = '';
      const retryFetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.results = [retryFetch];
      library.resultIndex = 0;
      const recovered: MediaAssetHandle = await media.createAndGetUri(FileType.IMAGE);
      LogicTestLog.value(name, "Retry handle URI", "fake://media/create-failure-2", recovered.uri);
      expect(recovered.uri).assertEqual("fake://media/create-failure-2");
      LogicTestLog.value(name, "Retry native display name", "recovered-2.jpg", recovered.displayName);
      expect(recovered.displayName).assertEqual("recovered-2.jpg");
      LogicTestLog.number(name, "Retry type", 1, recovered.mediaType);
      expect(recovered.mediaType).assertEqual(1);
      LogicTestLog.number(name, "Retry performs one new create", 2, library.creates.length);
      expect(library.creates.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch count", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Retry fetch read once", 1, retryFetch.allCalls);
      expect(retryFetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Retry fetch closed once", 1, retryFetch.closeCalls);
      expect(retryFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Original acquired result not closed twice", 0, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(0);
      LogicTestLog.value(name, "Retry closes result before exposing metadata",
        "clock.date|clock.time|library.create|clock.date|clock.time|l" +
        "ibrary.create|library.fetch|fetch.all|fetch.close|photo.get", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|clock.date|clock.time|l" +
        "ibrary.create|library.fetch|fetch.all|fetch.close|photo.get");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1187
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1187
     * @tc.nameDesc Creation failure closes every acquired native fetch result: Verify rejection boundaries, no fd
     * allocation, fetch finally cleanup and independent successful retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1187", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1187";
      LogicTestLog.begin(name, "FileType.VIDEO; creation phase=create; synthetic variant=1");
      clock.date = "20261231";
      clock.time = "120000";
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/create-failure-3", photoAccessHelper.PhotoType.VIDEO, "recovered-3.mp4");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/create-failure-3";
      library.results = [fetch];
      library.createError = "synthetic create creation failure 1";
      let message: string = '';
      try {
        await media.createAndGetUri(FileType.VIDEO);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Exact failure rejection", "synthetic create creation failure 1", message);
      expect(message).assertEqual("synthetic create creation failure 1");
      LogicTestLog.number(name, "Only one create attempted", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Native type on failed request", photoAccessHelper.PhotoType.VIDEO,
        library.creates[0].photoType);
      expect(library.creates[0].photoType).assertEqual(photoAccessHelper.PhotoType.VIDEO);
      LogicTestLog.value(name, "Native extension on failed request", "mp4", library.creates[0].extension);
      expect(library.creates[0].extension).assertEqual("mp4");
      LogicTestLog.number(name, "Fetch request attempts", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "Fetch getAllObjects attempts", 0, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(0);
      LogicTestLog.number(name, "Fetch finally close attempts", 0, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(0);
      LogicTestLog.number(name, "No handle metadata read after failed lookup", 0, photo.gets.length);
      expect(photo.gets.length).assertEqual(0);
      LogicTestLog.value(name, "Failed creation operation order", "clock.date|clock.time|library.create",
        trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create");
      LogicTestLog.number(name, "No descriptor allocated by failed creation", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem open on failed native creation", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem rename on failed native creation", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      library.createError = '';
      library.fetchError = '';
      const retryFetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.results = [retryFetch];
      library.resultIndex = 0;
      const recovered: MediaAssetHandle = await media.createAndGetUri(FileType.VIDEO);
      LogicTestLog.value(name, "Retry handle URI", "fake://media/create-failure-3", recovered.uri);
      expect(recovered.uri).assertEqual("fake://media/create-failure-3");
      LogicTestLog.value(name, "Retry native display name", "recovered-3.mp4", recovered.displayName);
      expect(recovered.displayName).assertEqual("recovered-3.mp4");
      LogicTestLog.number(name, "Retry type", 2, recovered.mediaType);
      expect(recovered.mediaType).assertEqual(2);
      LogicTestLog.number(name, "Retry performs one new create", 2, library.creates.length);
      expect(library.creates.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch count", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Retry fetch read once", 1, retryFetch.allCalls);
      expect(retryFetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Retry fetch closed once", 1, retryFetch.closeCalls);
      expect(retryFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Original acquired result not closed twice", 0, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(0);
      LogicTestLog.value(name, "Retry closes result before exposing metadata",
        "clock.date|clock.time|library.create|clock.date|clock.time|l" +
        "ibrary.create|library.fetch|fetch.all|fetch.close|photo.get", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|clock.date|clock.time|l" +
        "ibrary.create|library.fetch|fetch.all|fetch.close|photo.get");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1188
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1188
     * @tc.nameDesc Creation failure closes every acquired native fetch result: Verify rejection boundaries, no fd
     * allocation, fetch finally cleanup and independent successful retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1188", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1188";
      LogicTestLog.begin(name, "FileType.IMAGE; creation phase=fetch; synthetic variant=0");
      clock.date = "20300101";
      clock.time = "000001";
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/create-failure-4", photoAccessHelper.PhotoType.IMAGE, "recovered-4.jpg");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/create-failure-4";
      library.results = [fetch];
      library.fetchError = "synthetic fetch creation failure 0";
      let message: string = '';
      try {
        await media.createAndGetUri(FileType.IMAGE);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Exact failure rejection", "synthetic fetch creation failure 0", message);
      expect(message).assertEqual("synthetic fetch creation failure 0");
      LogicTestLog.number(name, "Only one create attempted", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Native type on failed request", photoAccessHelper.PhotoType.IMAGE,
        library.creates[0].photoType);
      expect(library.creates[0].photoType).assertEqual(photoAccessHelper.PhotoType.IMAGE);
      LogicTestLog.value(name, "Native extension on failed request", "jpg", library.creates[0].extension);
      expect(library.creates[0].extension).assertEqual("jpg");
      LogicTestLog.number(name, "Fetch request attempts", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Fetch getAllObjects attempts", 0, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(0);
      LogicTestLog.number(name, "Fetch finally close attempts", 0, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(0);
      LogicTestLog.number(name, "No handle metadata read after failed lookup", 0, photo.gets.length);
      expect(photo.gets.length).assertEqual(0);
      LogicTestLog.value(name, "Failed creation operation order",
        "clock.date|clock.time|library.create|library.fetch", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch");
      LogicTestLog.number(name, "No descriptor allocated by failed creation", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem open on failed native creation", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem rename on failed native creation", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      library.createError = '';
      library.fetchError = '';
      const retryFetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.results = [retryFetch];
      library.resultIndex = 0;
      const recovered: MediaAssetHandle = await media.createAndGetUri(FileType.IMAGE);
      LogicTestLog.value(name, "Retry handle URI", "fake://media/create-failure-4", recovered.uri);
      expect(recovered.uri).assertEqual("fake://media/create-failure-4");
      LogicTestLog.value(name, "Retry native display name", "recovered-4.jpg", recovered.displayName);
      expect(recovered.displayName).assertEqual("recovered-4.jpg");
      LogicTestLog.number(name, "Retry type", 1, recovered.mediaType);
      expect(recovered.mediaType).assertEqual(1);
      LogicTestLog.number(name, "Retry performs one new create", 2, library.creates.length);
      expect(library.creates.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch count", 2, library.fetches.length);
      expect(library.fetches.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch read once", 1, retryFetch.allCalls);
      expect(retryFetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Retry fetch closed once", 1, retryFetch.closeCalls);
      expect(retryFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Original acquired result not closed twice", 0, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(0);
      LogicTestLog.value(name, "Retry closes result before exposing metadata",
        "clock.date|clock.time|library.create|library.fetch|clock.dat" +
        "e|clock.time|library.create|library.fetch|fetch.all|fetch.cl" +
        "ose|photo.get", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|clock.dat" +
        "e|clock.time|library.create|library.fetch|fetch.all|fetch.cl" +
        "ose|photo.get");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1189
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1189
     * @tc.nameDesc Creation failure closes every acquired native fetch result: Verify rejection boundaries, no fd
     * allocation, fetch finally cleanup and independent successful retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1189", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1189";
      LogicTestLog.begin(name, "FileType.VIDEO; creation phase=fetch; synthetic variant=0");
      clock.date = "19991231";
      clock.time = "223344";
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/create-failure-5", photoAccessHelper.PhotoType.VIDEO, "recovered-5.mp4");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/create-failure-5";
      library.results = [fetch];
      library.fetchError = "synthetic fetch creation failure 0";
      let message: string = '';
      try {
        await media.createAndGetUri(FileType.VIDEO);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Exact failure rejection", "synthetic fetch creation failure 0", message);
      expect(message).assertEqual("synthetic fetch creation failure 0");
      LogicTestLog.number(name, "Only one create attempted", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Native type on failed request", photoAccessHelper.PhotoType.VIDEO,
        library.creates[0].photoType);
      expect(library.creates[0].photoType).assertEqual(photoAccessHelper.PhotoType.VIDEO);
      LogicTestLog.value(name, "Native extension on failed request", "mp4", library.creates[0].extension);
      expect(library.creates[0].extension).assertEqual("mp4");
      LogicTestLog.number(name, "Fetch request attempts", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Fetch getAllObjects attempts", 0, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(0);
      LogicTestLog.number(name, "Fetch finally close attempts", 0, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(0);
      LogicTestLog.number(name, "No handle metadata read after failed lookup", 0, photo.gets.length);
      expect(photo.gets.length).assertEqual(0);
      LogicTestLog.value(name, "Failed creation operation order",
        "clock.date|clock.time|library.create|library.fetch", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch");
      LogicTestLog.number(name, "No descriptor allocated by failed creation", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem open on failed native creation", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem rename on failed native creation", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      library.createError = '';
      library.fetchError = '';
      const retryFetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.results = [retryFetch];
      library.resultIndex = 0;
      const recovered: MediaAssetHandle = await media.createAndGetUri(FileType.VIDEO);
      LogicTestLog.value(name, "Retry handle URI", "fake://media/create-failure-5", recovered.uri);
      expect(recovered.uri).assertEqual("fake://media/create-failure-5");
      LogicTestLog.value(name, "Retry native display name", "recovered-5.mp4", recovered.displayName);
      expect(recovered.displayName).assertEqual("recovered-5.mp4");
      LogicTestLog.number(name, "Retry type", 2, recovered.mediaType);
      expect(recovered.mediaType).assertEqual(2);
      LogicTestLog.number(name, "Retry performs one new create", 2, library.creates.length);
      expect(library.creates.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch count", 2, library.fetches.length);
      expect(library.fetches.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch read once", 1, retryFetch.allCalls);
      expect(retryFetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Retry fetch closed once", 1, retryFetch.closeCalls);
      expect(retryFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Original acquired result not closed twice", 0, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(0);
      LogicTestLog.value(name, "Retry closes result before exposing metadata",
        "clock.date|clock.time|library.create|library.fetch|clock.dat" +
        "e|clock.time|library.create|library.fetch|fetch.all|fetch.cl" +
        "ose|photo.get", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|clock.dat" +
        "e|clock.time|library.create|library.fetch|fetch.all|fetch.cl" +
        "ose|photo.get");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1190
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1190
     * @tc.nameDesc Creation failure closes every acquired native fetch result: Verify rejection boundaries, no fd
     * allocation, fetch finally cleanup and independent successful retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1190", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1190";
      LogicTestLog.begin(name, "FileType.IMAGE; creation phase=fetch; synthetic variant=1");
      clock.date = "20260109";
      clock.time = "090807";
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/create-failure-6", photoAccessHelper.PhotoType.IMAGE, "recovered-6.jpg");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/create-failure-6";
      library.results = [fetch];
      library.fetchError = "synthetic fetch creation failure 1";
      let message: string = '';
      try {
        await media.createAndGetUri(FileType.IMAGE);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Exact failure rejection", "synthetic fetch creation failure 1", message);
      expect(message).assertEqual("synthetic fetch creation failure 1");
      LogicTestLog.number(name, "Only one create attempted", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Native type on failed request", photoAccessHelper.PhotoType.IMAGE,
        library.creates[0].photoType);
      expect(library.creates[0].photoType).assertEqual(photoAccessHelper.PhotoType.IMAGE);
      LogicTestLog.value(name, "Native extension on failed request", "jpg", library.creates[0].extension);
      expect(library.creates[0].extension).assertEqual("jpg");
      LogicTestLog.number(name, "Fetch request attempts", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Fetch getAllObjects attempts", 0, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(0);
      LogicTestLog.number(name, "Fetch finally close attempts", 0, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(0);
      LogicTestLog.number(name, "No handle metadata read after failed lookup", 0, photo.gets.length);
      expect(photo.gets.length).assertEqual(0);
      LogicTestLog.value(name, "Failed creation operation order",
        "clock.date|clock.time|library.create|library.fetch", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch");
      LogicTestLog.number(name, "No descriptor allocated by failed creation", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem open on failed native creation", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem rename on failed native creation", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      library.createError = '';
      library.fetchError = '';
      const retryFetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.results = [retryFetch];
      library.resultIndex = 0;
      const recovered: MediaAssetHandle = await media.createAndGetUri(FileType.IMAGE);
      LogicTestLog.value(name, "Retry handle URI", "fake://media/create-failure-6", recovered.uri);
      expect(recovered.uri).assertEqual("fake://media/create-failure-6");
      LogicTestLog.value(name, "Retry native display name", "recovered-6.jpg", recovered.displayName);
      expect(recovered.displayName).assertEqual("recovered-6.jpg");
      LogicTestLog.number(name, "Retry type", 1, recovered.mediaType);
      expect(recovered.mediaType).assertEqual(1);
      LogicTestLog.number(name, "Retry performs one new create", 2, library.creates.length);
      expect(library.creates.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch count", 2, library.fetches.length);
      expect(library.fetches.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch read once", 1, retryFetch.allCalls);
      expect(retryFetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Retry fetch closed once", 1, retryFetch.closeCalls);
      expect(retryFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Original acquired result not closed twice", 0, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(0);
      LogicTestLog.value(name, "Retry closes result before exposing metadata",
        "clock.date|clock.time|library.create|library.fetch|clock.dat" +
        "e|clock.time|library.create|library.fetch|fetch.all|fetch.cl" +
        "ose|photo.get", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|clock.dat" +
        "e|clock.time|library.create|library.fetch|fetch.all|fetch.cl" +
        "ose|photo.get");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1191
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1191
     * @tc.nameDesc Creation failure closes every acquired native fetch result: Verify rejection boundaries, no fd
     * allocation, fetch finally cleanup and independent successful retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1191", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1191";
      LogicTestLog.begin(name, "FileType.VIDEO; creation phase=fetch; synthetic variant=1");
      clock.date = "20261010";
      clock.time = "101010";
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/create-failure-7", photoAccessHelper.PhotoType.VIDEO, "recovered-7.mp4");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/create-failure-7";
      library.results = [fetch];
      library.fetchError = "synthetic fetch creation failure 1";
      let message: string = '';
      try {
        await media.createAndGetUri(FileType.VIDEO);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Exact failure rejection", "synthetic fetch creation failure 1", message);
      expect(message).assertEqual("synthetic fetch creation failure 1");
      LogicTestLog.number(name, "Only one create attempted", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Native type on failed request", photoAccessHelper.PhotoType.VIDEO,
        library.creates[0].photoType);
      expect(library.creates[0].photoType).assertEqual(photoAccessHelper.PhotoType.VIDEO);
      LogicTestLog.value(name, "Native extension on failed request", "mp4", library.creates[0].extension);
      expect(library.creates[0].extension).assertEqual("mp4");
      LogicTestLog.number(name, "Fetch request attempts", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Fetch getAllObjects attempts", 0, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(0);
      LogicTestLog.number(name, "Fetch finally close attempts", 0, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(0);
      LogicTestLog.number(name, "No handle metadata read after failed lookup", 0, photo.gets.length);
      expect(photo.gets.length).assertEqual(0);
      LogicTestLog.value(name, "Failed creation operation order",
        "clock.date|clock.time|library.create|library.fetch", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch");
      LogicTestLog.number(name, "No descriptor allocated by failed creation", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem open on failed native creation", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem rename on failed native creation", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      library.createError = '';
      library.fetchError = '';
      const retryFetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.results = [retryFetch];
      library.resultIndex = 0;
      const recovered: MediaAssetHandle = await media.createAndGetUri(FileType.VIDEO);
      LogicTestLog.value(name, "Retry handle URI", "fake://media/create-failure-7", recovered.uri);
      expect(recovered.uri).assertEqual("fake://media/create-failure-7");
      LogicTestLog.value(name, "Retry native display name", "recovered-7.mp4", recovered.displayName);
      expect(recovered.displayName).assertEqual("recovered-7.mp4");
      LogicTestLog.number(name, "Retry type", 2, recovered.mediaType);
      expect(recovered.mediaType).assertEqual(2);
      LogicTestLog.number(name, "Retry performs one new create", 2, library.creates.length);
      expect(library.creates.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch count", 2, library.fetches.length);
      expect(library.fetches.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch read once", 1, retryFetch.allCalls);
      expect(retryFetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Retry fetch closed once", 1, retryFetch.closeCalls);
      expect(retryFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Original acquired result not closed twice", 0, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(0);
      LogicTestLog.value(name, "Retry closes result before exposing metadata",
        "clock.date|clock.time|library.create|library.fetch|clock.dat" +
        "e|clock.time|library.create|library.fetch|fetch.all|fetch.cl" +
        "ose|photo.get", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|clock.dat" +
        "e|clock.time|library.create|library.fetch|fetch.all|fetch.cl" +
        "ose|photo.get");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1192
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1192
     * @tc.nameDesc Creation failure closes every acquired native fetch result: Verify rejection boundaries, no fd
     * allocation, fetch finally cleanup and independent successful retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1192", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1192";
      LogicTestLog.begin(name, "FileType.IMAGE; creation phase=all; synthetic variant=0");
      clock.date = "20261119";
      clock.time = "000000";
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/create-failure-8", photoAccessHelper.PhotoType.IMAGE, "recovered-8.jpg");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/create-failure-8";
      library.results = [fetch];
      fetch.allError = "synthetic all creation failure 0";
      let message: string = '';
      try {
        await media.createAndGetUri(FileType.IMAGE);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Exact failure rejection", "synthetic all creation failure 0", message);
      expect(message).assertEqual("synthetic all creation failure 0");
      LogicTestLog.number(name, "Only one create attempted", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Native type on failed request", photoAccessHelper.PhotoType.IMAGE,
        library.creates[0].photoType);
      expect(library.creates[0].photoType).assertEqual(photoAccessHelper.PhotoType.IMAGE);
      LogicTestLog.value(name, "Native extension on failed request", "jpg", library.creates[0].extension);
      expect(library.creates[0].extension).assertEqual("jpg");
      LogicTestLog.number(name, "Fetch request attempts", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Fetch getAllObjects attempts", 1, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Fetch finally close attempts", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "No handle metadata read after failed lookup", 0, photo.gets.length);
      expect(photo.gets.length).assertEqual(0);
      LogicTestLog.value(name, "Failed creation operation order",
        "clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close");
      LogicTestLog.number(name, "No descriptor allocated by failed creation", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem open on failed native creation", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem rename on failed native creation", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      library.createError = '';
      library.fetchError = '';
      const retryFetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.results = [retryFetch];
      library.resultIndex = 0;
      const recovered: MediaAssetHandle = await media.createAndGetUri(FileType.IMAGE);
      LogicTestLog.value(name, "Retry handle URI", "fake://media/create-failure-8", recovered.uri);
      expect(recovered.uri).assertEqual("fake://media/create-failure-8");
      LogicTestLog.value(name, "Retry native display name", "recovered-8.jpg", recovered.displayName);
      expect(recovered.displayName).assertEqual("recovered-8.jpg");
      LogicTestLog.number(name, "Retry type", 1, recovered.mediaType);
      expect(recovered.mediaType).assertEqual(1);
      LogicTestLog.number(name, "Retry performs one new create", 2, library.creates.length);
      expect(library.creates.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch count", 2, library.fetches.length);
      expect(library.fetches.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch read once", 1, retryFetch.allCalls);
      expect(retryFetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Retry fetch closed once", 1, retryFetch.closeCalls);
      expect(retryFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Original acquired result not closed twice", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.value(name, "Retry closes result before exposing metadata",
        "clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|clock.date|clock.time|library.create|library.fe" +
        "tch|fetch.all|fetch.close|photo.get", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|clock.date|clock.time|library.create|library.fe" +
        "tch|fetch.all|fetch.close|photo.get");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1193
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1193
     * @tc.nameDesc Creation failure closes every acquired native fetch result: Verify rejection boundaries, no fd
     * allocation, fetch finally cleanup and independent successful retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1193", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1193";
      LogicTestLog.begin(name, "FileType.VIDEO; creation phase=all; synthetic variant=0");
      clock.date = "20240229";
      clock.time = "235959";
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/create-failure-9", photoAccessHelper.PhotoType.VIDEO, "recovered-9.mp4");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/create-failure-9";
      library.results = [fetch];
      fetch.allError = "synthetic all creation failure 0";
      let message: string = '';
      try {
        await media.createAndGetUri(FileType.VIDEO);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Exact failure rejection", "synthetic all creation failure 0", message);
      expect(message).assertEqual("synthetic all creation failure 0");
      LogicTestLog.number(name, "Only one create attempted", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Native type on failed request", photoAccessHelper.PhotoType.VIDEO,
        library.creates[0].photoType);
      expect(library.creates[0].photoType).assertEqual(photoAccessHelper.PhotoType.VIDEO);
      LogicTestLog.value(name, "Native extension on failed request", "mp4", library.creates[0].extension);
      expect(library.creates[0].extension).assertEqual("mp4");
      LogicTestLog.number(name, "Fetch request attempts", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Fetch getAllObjects attempts", 1, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Fetch finally close attempts", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "No handle metadata read after failed lookup", 0, photo.gets.length);
      expect(photo.gets.length).assertEqual(0);
      LogicTestLog.value(name, "Failed creation operation order",
        "clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close");
      LogicTestLog.number(name, "No descriptor allocated by failed creation", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem open on failed native creation", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem rename on failed native creation", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      library.createError = '';
      library.fetchError = '';
      const retryFetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.results = [retryFetch];
      library.resultIndex = 0;
      const recovered: MediaAssetHandle = await media.createAndGetUri(FileType.VIDEO);
      LogicTestLog.value(name, "Retry handle URI", "fake://media/create-failure-9", recovered.uri);
      expect(recovered.uri).assertEqual("fake://media/create-failure-9");
      LogicTestLog.value(name, "Retry native display name", "recovered-9.mp4", recovered.displayName);
      expect(recovered.displayName).assertEqual("recovered-9.mp4");
      LogicTestLog.number(name, "Retry type", 2, recovered.mediaType);
      expect(recovered.mediaType).assertEqual(2);
      LogicTestLog.number(name, "Retry performs one new create", 2, library.creates.length);
      expect(library.creates.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch count", 2, library.fetches.length);
      expect(library.fetches.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch read once", 1, retryFetch.allCalls);
      expect(retryFetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Retry fetch closed once", 1, retryFetch.closeCalls);
      expect(retryFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Original acquired result not closed twice", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.value(name, "Retry closes result before exposing metadata",
        "clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|clock.date|clock.time|library.create|library.fe" +
        "tch|fetch.all|fetch.close|photo.get", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|clock.date|clock.time|library.create|library.fe" +
        "tch|fetch.all|fetch.close|photo.get");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1194
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1194
     * @tc.nameDesc Creation failure closes every acquired native fetch result: Verify rejection boundaries, no fd
     * allocation, fetch finally cleanup and independent successful retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1194", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1194";
      LogicTestLog.begin(name, "FileType.IMAGE; creation phase=all; synthetic variant=1");
      clock.date = "20000101";
      clock.time = "010203";
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/create-failure-10", photoAccessHelper.PhotoType.IMAGE, "recovered-10.jpg");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/create-failure-10";
      library.results = [fetch];
      fetch.allError = "synthetic all creation failure 1";
      let message: string = '';
      try {
        await media.createAndGetUri(FileType.IMAGE);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Exact failure rejection", "synthetic all creation failure 1", message);
      expect(message).assertEqual("synthetic all creation failure 1");
      LogicTestLog.number(name, "Only one create attempted", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Native type on failed request", photoAccessHelper.PhotoType.IMAGE,
        library.creates[0].photoType);
      expect(library.creates[0].photoType).assertEqual(photoAccessHelper.PhotoType.IMAGE);
      LogicTestLog.value(name, "Native extension on failed request", "jpg", library.creates[0].extension);
      expect(library.creates[0].extension).assertEqual("jpg");
      LogicTestLog.number(name, "Fetch request attempts", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Fetch getAllObjects attempts", 1, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Fetch finally close attempts", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "No handle metadata read after failed lookup", 0, photo.gets.length);
      expect(photo.gets.length).assertEqual(0);
      LogicTestLog.value(name, "Failed creation operation order",
        "clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close");
      LogicTestLog.number(name, "No descriptor allocated by failed creation", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem open on failed native creation", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem rename on failed native creation", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      library.createError = '';
      library.fetchError = '';
      const retryFetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.results = [retryFetch];
      library.resultIndex = 0;
      const recovered: MediaAssetHandle = await media.createAndGetUri(FileType.IMAGE);
      LogicTestLog.value(name, "Retry handle URI", "fake://media/create-failure-10", recovered.uri);
      expect(recovered.uri).assertEqual("fake://media/create-failure-10");
      LogicTestLog.value(name, "Retry native display name", "recovered-10.jpg", recovered.displayName);
      expect(recovered.displayName).assertEqual("recovered-10.jpg");
      LogicTestLog.number(name, "Retry type", 1, recovered.mediaType);
      expect(recovered.mediaType).assertEqual(1);
      LogicTestLog.number(name, "Retry performs one new create", 2, library.creates.length);
      expect(library.creates.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch count", 2, library.fetches.length);
      expect(library.fetches.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch read once", 1, retryFetch.allCalls);
      expect(retryFetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Retry fetch closed once", 1, retryFetch.closeCalls);
      expect(retryFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Original acquired result not closed twice", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.value(name, "Retry closes result before exposing metadata",
        "clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|clock.date|clock.time|library.create|library.fe" +
        "tch|fetch.all|fetch.close|photo.get", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|clock.date|clock.time|library.create|library.fe" +
        "tch|fetch.all|fetch.close|photo.get");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1195
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1195
     * @tc.nameDesc Creation failure closes every acquired native fetch result: Verify rejection boundaries, no fd
     * allocation, fetch finally cleanup and independent successful retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1195", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1195";
      LogicTestLog.begin(name, "FileType.VIDEO; creation phase=all; synthetic variant=1");
      clock.date = "20261231";
      clock.time = "120000";
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/create-failure-11", photoAccessHelper.PhotoType.VIDEO, "recovered-11.mp4");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/create-failure-11";
      library.results = [fetch];
      fetch.allError = "synthetic all creation failure 1";
      let message: string = '';
      try {
        await media.createAndGetUri(FileType.VIDEO);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Exact failure rejection", "synthetic all creation failure 1", message);
      expect(message).assertEqual("synthetic all creation failure 1");
      LogicTestLog.number(name, "Only one create attempted", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Native type on failed request", photoAccessHelper.PhotoType.VIDEO,
        library.creates[0].photoType);
      expect(library.creates[0].photoType).assertEqual(photoAccessHelper.PhotoType.VIDEO);
      LogicTestLog.value(name, "Native extension on failed request", "mp4", library.creates[0].extension);
      expect(library.creates[0].extension).assertEqual("mp4");
      LogicTestLog.number(name, "Fetch request attempts", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Fetch getAllObjects attempts", 1, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Fetch finally close attempts", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "No handle metadata read after failed lookup", 0, photo.gets.length);
      expect(photo.gets.length).assertEqual(0);
      LogicTestLog.value(name, "Failed creation operation order",
        "clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close");
      LogicTestLog.number(name, "No descriptor allocated by failed creation", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem open on failed native creation", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem rename on failed native creation", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      library.createError = '';
      library.fetchError = '';
      const retryFetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.results = [retryFetch];
      library.resultIndex = 0;
      const recovered: MediaAssetHandle = await media.createAndGetUri(FileType.VIDEO);
      LogicTestLog.value(name, "Retry handle URI", "fake://media/create-failure-11", recovered.uri);
      expect(recovered.uri).assertEqual("fake://media/create-failure-11");
      LogicTestLog.value(name, "Retry native display name", "recovered-11.mp4", recovered.displayName);
      expect(recovered.displayName).assertEqual("recovered-11.mp4");
      LogicTestLog.number(name, "Retry type", 2, recovered.mediaType);
      expect(recovered.mediaType).assertEqual(2);
      LogicTestLog.number(name, "Retry performs one new create", 2, library.creates.length);
      expect(library.creates.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch count", 2, library.fetches.length);
      expect(library.fetches.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch read once", 1, retryFetch.allCalls);
      expect(retryFetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Retry fetch closed once", 1, retryFetch.closeCalls);
      expect(retryFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Original acquired result not closed twice", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.value(name, "Retry closes result before exposing metadata",
        "clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|clock.date|clock.time|library.create|library.fe" +
        "tch|fetch.all|fetch.close|photo.get", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|clock.date|clock.time|library.create|library.fe" +
        "tch|fetch.all|fetch.close|photo.get");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1196
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1196
     * @tc.nameDesc Creation failure closes every acquired native fetch result: Verify rejection boundaries, no fd
     * allocation, fetch finally cleanup and independent successful retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1196", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1196";
      LogicTestLog.begin(name, "FileType.IMAGE; creation phase=close; synthetic variant=0");
      clock.date = "20300101";
      clock.time = "000001";
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/create-failure-12", photoAccessHelper.PhotoType.IMAGE, "recovered-12.jpg");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/create-failure-12";
      library.results = [fetch];
      fetch.closeError = "synthetic close creation failure 0";
      let message: string = '';
      try {
        await media.createAndGetUri(FileType.IMAGE);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Exact failure rejection", "synthetic close creation failure 0", message);
      expect(message).assertEqual("synthetic close creation failure 0");
      LogicTestLog.number(name, "Only one create attempted", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Native type on failed request", photoAccessHelper.PhotoType.IMAGE,
        library.creates[0].photoType);
      expect(library.creates[0].photoType).assertEqual(photoAccessHelper.PhotoType.IMAGE);
      LogicTestLog.value(name, "Native extension on failed request", "jpg", library.creates[0].extension);
      expect(library.creates[0].extension).assertEqual("jpg");
      LogicTestLog.number(name, "Fetch request attempts", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Fetch getAllObjects attempts", 1, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Fetch finally close attempts", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "No handle metadata read after failed lookup", 0, photo.gets.length);
      expect(photo.gets.length).assertEqual(0);
      LogicTestLog.value(name, "Failed creation operation order",
        "clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close");
      LogicTestLog.number(name, "No descriptor allocated by failed creation", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem open on failed native creation", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem rename on failed native creation", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      library.createError = '';
      library.fetchError = '';
      const retryFetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.results = [retryFetch];
      library.resultIndex = 0;
      const recovered: MediaAssetHandle = await media.createAndGetUri(FileType.IMAGE);
      LogicTestLog.value(name, "Retry handle URI", "fake://media/create-failure-12", recovered.uri);
      expect(recovered.uri).assertEqual("fake://media/create-failure-12");
      LogicTestLog.value(name, "Retry native display name", "recovered-12.jpg", recovered.displayName);
      expect(recovered.displayName).assertEqual("recovered-12.jpg");
      LogicTestLog.number(name, "Retry type", 1, recovered.mediaType);
      expect(recovered.mediaType).assertEqual(1);
      LogicTestLog.number(name, "Retry performs one new create", 2, library.creates.length);
      expect(library.creates.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch count", 2, library.fetches.length);
      expect(library.fetches.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch read once", 1, retryFetch.allCalls);
      expect(retryFetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Retry fetch closed once", 1, retryFetch.closeCalls);
      expect(retryFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Original acquired result not closed twice", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.value(name, "Retry closes result before exposing metadata",
        "clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|clock.date|clock.time|library.create|library.fe" +
        "tch|fetch.all|fetch.close|photo.get", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|clock.date|clock.time|library.create|library.fe" +
        "tch|fetch.all|fetch.close|photo.get");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1197
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1197
     * @tc.nameDesc Creation failure closes every acquired native fetch result: Verify rejection boundaries, no fd
     * allocation, fetch finally cleanup and independent successful retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1197", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1197";
      LogicTestLog.begin(name, "FileType.VIDEO; creation phase=close; synthetic variant=0");
      clock.date = "19991231";
      clock.time = "223344";
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/create-failure-13", photoAccessHelper.PhotoType.VIDEO, "recovered-13.mp4");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/create-failure-13";
      library.results = [fetch];
      fetch.closeError = "synthetic close creation failure 0";
      let message: string = '';
      try {
        await media.createAndGetUri(FileType.VIDEO);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Exact failure rejection", "synthetic close creation failure 0", message);
      expect(message).assertEqual("synthetic close creation failure 0");
      LogicTestLog.number(name, "Only one create attempted", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Native type on failed request", photoAccessHelper.PhotoType.VIDEO,
        library.creates[0].photoType);
      expect(library.creates[0].photoType).assertEqual(photoAccessHelper.PhotoType.VIDEO);
      LogicTestLog.value(name, "Native extension on failed request", "mp4", library.creates[0].extension);
      expect(library.creates[0].extension).assertEqual("mp4");
      LogicTestLog.number(name, "Fetch request attempts", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Fetch getAllObjects attempts", 1, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Fetch finally close attempts", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "No handle metadata read after failed lookup", 0, photo.gets.length);
      expect(photo.gets.length).assertEqual(0);
      LogicTestLog.value(name, "Failed creation operation order",
        "clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close");
      LogicTestLog.number(name, "No descriptor allocated by failed creation", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem open on failed native creation", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem rename on failed native creation", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      library.createError = '';
      library.fetchError = '';
      const retryFetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.results = [retryFetch];
      library.resultIndex = 0;
      const recovered: MediaAssetHandle = await media.createAndGetUri(FileType.VIDEO);
      LogicTestLog.value(name, "Retry handle URI", "fake://media/create-failure-13", recovered.uri);
      expect(recovered.uri).assertEqual("fake://media/create-failure-13");
      LogicTestLog.value(name, "Retry native display name", "recovered-13.mp4", recovered.displayName);
      expect(recovered.displayName).assertEqual("recovered-13.mp4");
      LogicTestLog.number(name, "Retry type", 2, recovered.mediaType);
      expect(recovered.mediaType).assertEqual(2);
      LogicTestLog.number(name, "Retry performs one new create", 2, library.creates.length);
      expect(library.creates.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch count", 2, library.fetches.length);
      expect(library.fetches.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch read once", 1, retryFetch.allCalls);
      expect(retryFetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Retry fetch closed once", 1, retryFetch.closeCalls);
      expect(retryFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Original acquired result not closed twice", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.value(name, "Retry closes result before exposing metadata",
        "clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|clock.date|clock.time|library.create|library.fe" +
        "tch|fetch.all|fetch.close|photo.get", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|clock.date|clock.time|library.create|library.fe" +
        "tch|fetch.all|fetch.close|photo.get");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1198
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1198
     * @tc.nameDesc Creation failure closes every acquired native fetch result: Verify rejection boundaries, no fd
     * allocation, fetch finally cleanup and independent successful retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1198", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1198";
      LogicTestLog.begin(name, "FileType.IMAGE; creation phase=close; synthetic variant=1");
      clock.date = "20260109";
      clock.time = "090807";
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/create-failure-14", photoAccessHelper.PhotoType.IMAGE, "recovered-14.jpg");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/create-failure-14";
      library.results = [fetch];
      fetch.closeError = "synthetic close creation failure 1";
      let message: string = '';
      try {
        await media.createAndGetUri(FileType.IMAGE);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Exact failure rejection", "synthetic close creation failure 1", message);
      expect(message).assertEqual("synthetic close creation failure 1");
      LogicTestLog.number(name, "Only one create attempted", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Native type on failed request", photoAccessHelper.PhotoType.IMAGE,
        library.creates[0].photoType);
      expect(library.creates[0].photoType).assertEqual(photoAccessHelper.PhotoType.IMAGE);
      LogicTestLog.value(name, "Native extension on failed request", "jpg", library.creates[0].extension);
      expect(library.creates[0].extension).assertEqual("jpg");
      LogicTestLog.number(name, "Fetch request attempts", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Fetch getAllObjects attempts", 1, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Fetch finally close attempts", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "No handle metadata read after failed lookup", 0, photo.gets.length);
      expect(photo.gets.length).assertEqual(0);
      LogicTestLog.value(name, "Failed creation operation order",
        "clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close");
      LogicTestLog.number(name, "No descriptor allocated by failed creation", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem open on failed native creation", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem rename on failed native creation", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      library.createError = '';
      library.fetchError = '';
      const retryFetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.results = [retryFetch];
      library.resultIndex = 0;
      const recovered: MediaAssetHandle = await media.createAndGetUri(FileType.IMAGE);
      LogicTestLog.value(name, "Retry handle URI", "fake://media/create-failure-14", recovered.uri);
      expect(recovered.uri).assertEqual("fake://media/create-failure-14");
      LogicTestLog.value(name, "Retry native display name", "recovered-14.jpg", recovered.displayName);
      expect(recovered.displayName).assertEqual("recovered-14.jpg");
      LogicTestLog.number(name, "Retry type", 1, recovered.mediaType);
      expect(recovered.mediaType).assertEqual(1);
      LogicTestLog.number(name, "Retry performs one new create", 2, library.creates.length);
      expect(library.creates.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch count", 2, library.fetches.length);
      expect(library.fetches.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch read once", 1, retryFetch.allCalls);
      expect(retryFetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Retry fetch closed once", 1, retryFetch.closeCalls);
      expect(retryFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Original acquired result not closed twice", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.value(name, "Retry closes result before exposing metadata",
        "clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|clock.date|clock.time|library.create|library.fe" +
        "tch|fetch.all|fetch.close|photo.get", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|clock.date|clock.time|library.create|library.fe" +
        "tch|fetch.all|fetch.close|photo.get");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1199
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1199
     * @tc.nameDesc Creation failure closes every acquired native fetch result: Verify rejection boundaries, no fd
     * allocation, fetch finally cleanup and independent successful retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1199", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1199";
      LogicTestLog.begin(name, "FileType.VIDEO; creation phase=close; synthetic variant=1");
      clock.date = "20261010";
      clock.time = "101010";
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/create-failure-15", photoAccessHelper.PhotoType.VIDEO, "recovered-15.mp4");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/create-failure-15";
      library.results = [fetch];
      fetch.closeError = "synthetic close creation failure 1";
      let message: string = '';
      try {
        await media.createAndGetUri(FileType.VIDEO);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Exact failure rejection", "synthetic close creation failure 1", message);
      expect(message).assertEqual("synthetic close creation failure 1");
      LogicTestLog.number(name, "Only one create attempted", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Native type on failed request", photoAccessHelper.PhotoType.VIDEO,
        library.creates[0].photoType);
      expect(library.creates[0].photoType).assertEqual(photoAccessHelper.PhotoType.VIDEO);
      LogicTestLog.value(name, "Native extension on failed request", "mp4", library.creates[0].extension);
      expect(library.creates[0].extension).assertEqual("mp4");
      LogicTestLog.number(name, "Fetch request attempts", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Fetch getAllObjects attempts", 1, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Fetch finally close attempts", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "No handle metadata read after failed lookup", 0, photo.gets.length);
      expect(photo.gets.length).assertEqual(0);
      LogicTestLog.value(name, "Failed creation operation order",
        "clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close");
      LogicTestLog.number(name, "No descriptor allocated by failed creation", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem open on failed native creation", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem rename on failed native creation", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      library.createError = '';
      library.fetchError = '';
      const retryFetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.results = [retryFetch];
      library.resultIndex = 0;
      const recovered: MediaAssetHandle = await media.createAndGetUri(FileType.VIDEO);
      LogicTestLog.value(name, "Retry handle URI", "fake://media/create-failure-15", recovered.uri);
      expect(recovered.uri).assertEqual("fake://media/create-failure-15");
      LogicTestLog.value(name, "Retry native display name", "recovered-15.mp4", recovered.displayName);
      expect(recovered.displayName).assertEqual("recovered-15.mp4");
      LogicTestLog.number(name, "Retry type", 2, recovered.mediaType);
      expect(recovered.mediaType).assertEqual(2);
      LogicTestLog.number(name, "Retry performs one new create", 2, library.creates.length);
      expect(library.creates.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch count", 2, library.fetches.length);
      expect(library.fetches.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch read once", 1, retryFetch.allCalls);
      expect(retryFetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Retry fetch closed once", 1, retryFetch.closeCalls);
      expect(retryFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Original acquired result not closed twice", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.value(name, "Retry closes result before exposing metadata",
        "clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|clock.date|clock.time|library.create|library.fe" +
        "tch|fetch.all|fetch.close|photo.get", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|clock.date|clock.time|library.create|library.fe" +
        "tch|fetch.all|fetch.close|photo.get");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1200
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1200
     * @tc.nameDesc Creation failure closes every acquired native fetch result: Verify rejection boundaries, no fd
     * allocation, fetch finally cleanup and independent successful retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1200", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1200";
      LogicTestLog.begin(name, "FileType.IMAGE; creation phase=empty; synthetic variant=0");
      clock.date = "20261119";
      clock.time = "000000";
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/create-failure-16", photoAccessHelper.PhotoType.IMAGE, "recovered-16.jpg");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/create-failure-16";
      library.results = [fetch];
      fetch.assets = [];
      let message: string = '';
      try {
        await media.createAndGetUri(FileType.IMAGE);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Exact failure rejection",
        "Media asset not found: fake://media/create-failure-16", message);
      expect(message).assertEqual("Media asset not found: fake://media/create-failure-16");
      LogicTestLog.number(name, "Only one create attempted", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Native type on failed request", photoAccessHelper.PhotoType.IMAGE,
        library.creates[0].photoType);
      expect(library.creates[0].photoType).assertEqual(photoAccessHelper.PhotoType.IMAGE);
      LogicTestLog.value(name, "Native extension on failed request", "jpg", library.creates[0].extension);
      expect(library.creates[0].extension).assertEqual("jpg");
      LogicTestLog.number(name, "Fetch request attempts", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Fetch getAllObjects attempts", 1, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Fetch finally close attempts", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "No handle metadata read after failed lookup", 0, photo.gets.length);
      expect(photo.gets.length).assertEqual(0);
      LogicTestLog.value(name, "Failed creation operation order",
        "clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close");
      LogicTestLog.number(name, "No descriptor allocated by failed creation", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem open on failed native creation", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem rename on failed native creation", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      library.createError = '';
      library.fetchError = '';
      const retryFetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.results = [retryFetch];
      library.resultIndex = 0;
      const recovered: MediaAssetHandle = await media.createAndGetUri(FileType.IMAGE);
      LogicTestLog.value(name, "Retry handle URI", "fake://media/create-failure-16", recovered.uri);
      expect(recovered.uri).assertEqual("fake://media/create-failure-16");
      LogicTestLog.value(name, "Retry native display name", "recovered-16.jpg", recovered.displayName);
      expect(recovered.displayName).assertEqual("recovered-16.jpg");
      LogicTestLog.number(name, "Retry type", 1, recovered.mediaType);
      expect(recovered.mediaType).assertEqual(1);
      LogicTestLog.number(name, "Retry performs one new create", 2, library.creates.length);
      expect(library.creates.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch count", 2, library.fetches.length);
      expect(library.fetches.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch read once", 1, retryFetch.allCalls);
      expect(retryFetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Retry fetch closed once", 1, retryFetch.closeCalls);
      expect(retryFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Original acquired result not closed twice", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.value(name, "Retry closes result before exposing metadata",
        "clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|clock.date|clock.time|library.create|library.fe" +
        "tch|fetch.all|fetch.close|photo.get", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|clock.date|clock.time|library.create|library.fe" +
        "tch|fetch.all|fetch.close|photo.get");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1201
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1201
     * @tc.nameDesc Creation failure closes every acquired native fetch result: Verify rejection boundaries, no fd
     * allocation, fetch finally cleanup and independent successful retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1201", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1201";
      LogicTestLog.begin(name, "FileType.VIDEO; creation phase=empty; synthetic variant=0");
      clock.date = "20240229";
      clock.time = "235959";
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/create-failure-17", photoAccessHelper.PhotoType.VIDEO, "recovered-17.mp4");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/create-failure-17";
      library.results = [fetch];
      fetch.assets = [];
      let message: string = '';
      try {
        await media.createAndGetUri(FileType.VIDEO);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Exact failure rejection",
        "Media asset not found: fake://media/create-failure-17", message);
      expect(message).assertEqual("Media asset not found: fake://media/create-failure-17");
      LogicTestLog.number(name, "Only one create attempted", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Native type on failed request", photoAccessHelper.PhotoType.VIDEO,
        library.creates[0].photoType);
      expect(library.creates[0].photoType).assertEqual(photoAccessHelper.PhotoType.VIDEO);
      LogicTestLog.value(name, "Native extension on failed request", "mp4", library.creates[0].extension);
      expect(library.creates[0].extension).assertEqual("mp4");
      LogicTestLog.number(name, "Fetch request attempts", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Fetch getAllObjects attempts", 1, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Fetch finally close attempts", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "No handle metadata read after failed lookup", 0, photo.gets.length);
      expect(photo.gets.length).assertEqual(0);
      LogicTestLog.value(name, "Failed creation operation order",
        "clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close");
      LogicTestLog.number(name, "No descriptor allocated by failed creation", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem open on failed native creation", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem rename on failed native creation", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      library.createError = '';
      library.fetchError = '';
      const retryFetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.results = [retryFetch];
      library.resultIndex = 0;
      const recovered: MediaAssetHandle = await media.createAndGetUri(FileType.VIDEO);
      LogicTestLog.value(name, "Retry handle URI", "fake://media/create-failure-17", recovered.uri);
      expect(recovered.uri).assertEqual("fake://media/create-failure-17");
      LogicTestLog.value(name, "Retry native display name", "recovered-17.mp4", recovered.displayName);
      expect(recovered.displayName).assertEqual("recovered-17.mp4");
      LogicTestLog.number(name, "Retry type", 2, recovered.mediaType);
      expect(recovered.mediaType).assertEqual(2);
      LogicTestLog.number(name, "Retry performs one new create", 2, library.creates.length);
      expect(library.creates.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch count", 2, library.fetches.length);
      expect(library.fetches.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch read once", 1, retryFetch.allCalls);
      expect(retryFetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Retry fetch closed once", 1, retryFetch.closeCalls);
      expect(retryFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Original acquired result not closed twice", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.value(name, "Retry closes result before exposing metadata",
        "clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|clock.date|clock.time|library.create|library.fe" +
        "tch|fetch.all|fetch.close|photo.get", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|clock.date|clock.time|library.create|library.fe" +
        "tch|fetch.all|fetch.close|photo.get");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1202
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1202
     * @tc.nameDesc Creation failure closes every acquired native fetch result: Verify rejection boundaries, no fd
     * allocation, fetch finally cleanup and independent successful retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1202", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1202";
      LogicTestLog.begin(name, "FileType.IMAGE; creation phase=empty; synthetic variant=1");
      clock.date = "20000101";
      clock.time = "010203";
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/create-failure-18", photoAccessHelper.PhotoType.IMAGE, "recovered-18.jpg");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/create-failure-18";
      library.results = [fetch];
      fetch.assets = [];
      let message: string = '';
      try {
        await media.createAndGetUri(FileType.IMAGE);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Exact failure rejection",
        "Media asset not found: fake://media/create-failure-18", message);
      expect(message).assertEqual("Media asset not found: fake://media/create-failure-18");
      LogicTestLog.number(name, "Only one create attempted", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Native type on failed request", photoAccessHelper.PhotoType.IMAGE,
        library.creates[0].photoType);
      expect(library.creates[0].photoType).assertEqual(photoAccessHelper.PhotoType.IMAGE);
      LogicTestLog.value(name, "Native extension on failed request", "jpg", library.creates[0].extension);
      expect(library.creates[0].extension).assertEqual("jpg");
      LogicTestLog.number(name, "Fetch request attempts", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Fetch getAllObjects attempts", 1, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Fetch finally close attempts", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "No handle metadata read after failed lookup", 0, photo.gets.length);
      expect(photo.gets.length).assertEqual(0);
      LogicTestLog.value(name, "Failed creation operation order",
        "clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close");
      LogicTestLog.number(name, "No descriptor allocated by failed creation", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem open on failed native creation", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem rename on failed native creation", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      library.createError = '';
      library.fetchError = '';
      const retryFetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.results = [retryFetch];
      library.resultIndex = 0;
      const recovered: MediaAssetHandle = await media.createAndGetUri(FileType.IMAGE);
      LogicTestLog.value(name, "Retry handle URI", "fake://media/create-failure-18", recovered.uri);
      expect(recovered.uri).assertEqual("fake://media/create-failure-18");
      LogicTestLog.value(name, "Retry native display name", "recovered-18.jpg", recovered.displayName);
      expect(recovered.displayName).assertEqual("recovered-18.jpg");
      LogicTestLog.number(name, "Retry type", 1, recovered.mediaType);
      expect(recovered.mediaType).assertEqual(1);
      LogicTestLog.number(name, "Retry performs one new create", 2, library.creates.length);
      expect(library.creates.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch count", 2, library.fetches.length);
      expect(library.fetches.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch read once", 1, retryFetch.allCalls);
      expect(retryFetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Retry fetch closed once", 1, retryFetch.closeCalls);
      expect(retryFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Original acquired result not closed twice", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.value(name, "Retry closes result before exposing metadata",
        "clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|clock.date|clock.time|library.create|library.fe" +
        "tch|fetch.all|fetch.close|photo.get", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|clock.date|clock.time|library.create|library.fe" +
        "tch|fetch.all|fetch.close|photo.get");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1203
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1203
     * @tc.nameDesc Creation failure closes every acquired native fetch result: Verify rejection boundaries, no fd
     * allocation, fetch finally cleanup and independent successful retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1203", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1203";
      LogicTestLog.begin(name, "FileType.VIDEO; creation phase=empty; synthetic variant=1");
      clock.date = "20261231";
      clock.time = "120000";
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/create-failure-19", photoAccessHelper.PhotoType.VIDEO, "recovered-19.mp4");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/create-failure-19";
      library.results = [fetch];
      fetch.assets = [];
      let message: string = '';
      try {
        await media.createAndGetUri(FileType.VIDEO);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Exact failure rejection",
        "Media asset not found: fake://media/create-failure-19", message);
      expect(message).assertEqual("Media asset not found: fake://media/create-failure-19");
      LogicTestLog.number(name, "Only one create attempted", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Native type on failed request", photoAccessHelper.PhotoType.VIDEO,
        library.creates[0].photoType);
      expect(library.creates[0].photoType).assertEqual(photoAccessHelper.PhotoType.VIDEO);
      LogicTestLog.value(name, "Native extension on failed request", "mp4", library.creates[0].extension);
      expect(library.creates[0].extension).assertEqual("mp4");
      LogicTestLog.number(name, "Fetch request attempts", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Fetch getAllObjects attempts", 1, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Fetch finally close attempts", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "No handle metadata read after failed lookup", 0, photo.gets.length);
      expect(photo.gets.length).assertEqual(0);
      LogicTestLog.value(name, "Failed creation operation order",
        "clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close");
      LogicTestLog.number(name, "No descriptor allocated by failed creation", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem open on failed native creation", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No filesystem rename on failed native creation", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      library.createError = '';
      library.fetchError = '';
      const retryFetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.results = [retryFetch];
      library.resultIndex = 0;
      const recovered: MediaAssetHandle = await media.createAndGetUri(FileType.VIDEO);
      LogicTestLog.value(name, "Retry handle URI", "fake://media/create-failure-19", recovered.uri);
      expect(recovered.uri).assertEqual("fake://media/create-failure-19");
      LogicTestLog.value(name, "Retry native display name", "recovered-19.mp4", recovered.displayName);
      expect(recovered.displayName).assertEqual("recovered-19.mp4");
      LogicTestLog.number(name, "Retry type", 2, recovered.mediaType);
      expect(recovered.mediaType).assertEqual(2);
      LogicTestLog.number(name, "Retry performs one new create", 2, library.creates.length);
      expect(library.creates.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch count", 2, library.fetches.length);
      expect(library.fetches.length).assertEqual(2);
      LogicTestLog.number(name, "Retry fetch read once", 1, retryFetch.allCalls);
      expect(retryFetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Retry fetch closed once", 1, retryFetch.closeCalls);
      expect(retryFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Original acquired result not closed twice", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.value(name, "Retry closes result before exposing metadata",
        "clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|clock.date|clock.time|library.create|library.fe" +
        "tch|fetch.all|fetch.close|photo.get", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|clock.date|clock.time|library.create|library.fe" +
        "tch|fetch.all|fetch.close|photo.get");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1204
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1204
     * @tc.nameDesc Injected instances isolate library filesystem and clock state: Verify two context snapshots,
     * independent fake operations and clocks with no native constructor activity.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1204", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1204";
      LogicTestLog.begin(name, "FileType.IMAGE; two independent synthetic environments");
      const traceB: MediaTrace = new MediaTrace();
      const filesB: FakeMediaFiles = new FakeMediaFiles(traceB);
      const libraryB: FakeMediaLibrary = new FakeMediaLibrary(traceB);
      const clockB: FakeMediaClock = new FakeMediaClock(traceB, '20300101', '010203');
      const contextB: common.UIAbilityContext = mediaContext('/synthetic/media/beta');
      const mediaB: MediaUtils = new MediaUtils(contextB, filesB, libraryB, clockB);
      filesB.nextFd = 920;
      LogicTestLog.value(name, "Injected constructor A is side effect free", "", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("");
      LogicTestLog.value(name, "Injected constructor B is side effect free", "", traceB.events.join("|"));
      expect(traceB.events.join("|")).assertEqual("");
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/isolation-a-0", photoAccessHelper.PhotoType.IMAGE, "isolation-a-0.jpg");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/isolation-a-0";
      library.results = [fetch];
      const photoB: FakeMediaPhoto = new FakeMediaPhoto(traceB,
        "fake://media/isolation-b-0", photoAccessHelper.PhotoType.IMAGE, "isolation-b-0.jpg");
      const fetchB: FakeMediaFetch = new FakeMediaFetch(traceB, [photoB]);
      libraryB.createdUri = "fake://media/isolation-b-0";
      libraryB.results = [fetchB];
      const handleA: MediaAssetHandle = await media.createAndGetUri(FileType.IMAGE);
      const handleB: MediaAssetHandle = await mediaB.createAndGetUri(FileType.IMAGE);
      LogicTestLog.value(name, "Instance A URI", "fake://media/isolation-a-0", handleA.uri);
      expect(handleA.uri).assertEqual("fake://media/isolation-a-0");
      LogicTestLog.value(name, "Instance B URI", "fake://media/isolation-b-0", handleB.uri);
      expect(handleB.uri).assertEqual("fake://media/isolation-b-0");
      LogicTestLog.value(name, "Instance A display name", "isolation-a-0.jpg", handleA.displayName);
      expect(handleA.displayName).assertEqual("isolation-a-0.jpg");
      LogicTestLog.value(name, "Instance B display name", "isolation-b-0.jpg", handleB.displayName);
      expect(handleB.displayName).assertEqual("isolation-b-0.jpg");
      LogicTestLog.number(name, "Clock A date calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Clock B date calls", 1, clockB.dateCalls);
      expect(clockB.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Clock A time calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      LogicTestLog.number(name, "Clock B time calls", 1, clockB.timeCalls);
      expect(clockB.timeCalls).assertEqual(1);
      await handleA.rename("isolated-rename-0.jpg");
      const fdB: number = await mediaB.getFdPath(handleB);
      await handleB.close(fdB);
      LogicTestLog.value(name, "Rename A does not change B URI", "fake://media/isolation-b-0", handleB.uri);
      expect(handleB.uri).assertEqual("fake://media/isolation-b-0");
      LogicTestLog.value(name, "Rename A does not change B name", "isolation-b-0.jpg", handleB.displayName);
      expect(handleB.displayName).assertEqual("isolation-b-0.jpg");
      LogicTestLog.value(name, "Rename A publishes only A name", "isolated-rename-0.jpg", handleA.displayName);
      expect(handleA.displayName).assertEqual("isolated-rename-0.jpg");
      LogicTestLog.number(name, "Instance B uses independent fd seed", 920, fdB);
      expect(fdB).assertEqual(920);
      LogicTestLog.number(name, "Instance A never opens B descriptor", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "Instance B opens one descriptor", 1, filesB.opens.length);
      expect(filesB.opens.length).assertEqual(1);
      LogicTestLog.value(name, "Instance B descriptor URI", "fake://media/isolation-b-0", filesB.opens[0].path);
      expect(filesB.opens[0].path).assertEqual("fake://media/isolation-b-0");
      LogicTestLog.number(name, "Instance B closes its own descriptor", 920, filesB.closes[0]);
      expect(filesB.closes[0]).assertEqual(920);
      LogicTestLog.number(name, "Instance A library request count", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Instance B library request count", 1, libraryB.creates.length);
      expect(libraryB.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Instance B has no filesystem rename", 0, filesB.renames.length);
      expect(filesB.renames.length).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1205
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1205
     * @tc.nameDesc Injected instances isolate library filesystem and clock state: Verify two context snapshots,
     * independent fake operations and clocks with no native constructor activity.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1205", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1205";
      LogicTestLog.begin(name, "FileType.VIDEO; two independent synthetic environments");
      const traceB: MediaTrace = new MediaTrace();
      const filesB: FakeMediaFiles = new FakeMediaFiles(traceB);
      const libraryB: FakeMediaLibrary = new FakeMediaLibrary(traceB);
      const clockB: FakeMediaClock = new FakeMediaClock(traceB, '20300101', '010203');
      const contextB: common.UIAbilityContext = mediaContext('/synthetic/media/beta');
      const mediaB: MediaUtils = new MediaUtils(contextB, filesB, libraryB, clockB);
      filesB.nextFd = 920;
      LogicTestLog.value(name, "Injected constructor A is side effect free", "", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("");
      LogicTestLog.value(name, "Injected constructor B is side effect free", "", traceB.events.join("|"));
      expect(traceB.events.join("|")).assertEqual("");
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/isolation-a-1", photoAccessHelper.PhotoType.VIDEO, "isolation-a-1.mp4");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/isolation-a-1";
      library.results = [fetch];
      const photoB: FakeMediaPhoto = new FakeMediaPhoto(traceB,
        "fake://media/isolation-b-1", photoAccessHelper.PhotoType.VIDEO, "isolation-b-1.mp4");
      const fetchB: FakeMediaFetch = new FakeMediaFetch(traceB, [photoB]);
      libraryB.createdUri = "fake://media/isolation-b-1";
      libraryB.results = [fetchB];
      const handleA: MediaAssetHandle = await media.createAndGetUri(FileType.VIDEO);
      const handleB: MediaAssetHandle = await mediaB.createAndGetUri(FileType.VIDEO);
      LogicTestLog.value(name, "Instance A URI", "fake://media/isolation-a-1", handleA.uri);
      expect(handleA.uri).assertEqual("fake://media/isolation-a-1");
      LogicTestLog.value(name, "Instance B URI", "fake://media/isolation-b-1", handleB.uri);
      expect(handleB.uri).assertEqual("fake://media/isolation-b-1");
      LogicTestLog.value(name, "Instance A display name", "isolation-a-1.mp4", handleA.displayName);
      expect(handleA.displayName).assertEqual("isolation-a-1.mp4");
      LogicTestLog.value(name, "Instance B display name", "isolation-b-1.mp4", handleB.displayName);
      expect(handleB.displayName).assertEqual("isolation-b-1.mp4");
      LogicTestLog.number(name, "Clock A date calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Clock B date calls", 1, clockB.dateCalls);
      expect(clockB.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Clock A time calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      LogicTestLog.number(name, "Clock B time calls", 1, clockB.timeCalls);
      expect(clockB.timeCalls).assertEqual(1);
      await handleA.rename("isolated-rename-1.mp4");
      const fdB: number = await mediaB.getFdPath(handleB);
      await handleB.close(fdB);
      LogicTestLog.value(name, "Rename A does not change B URI", "fake://media/isolation-b-1", handleB.uri);
      expect(handleB.uri).assertEqual("fake://media/isolation-b-1");
      LogicTestLog.value(name, "Rename A does not change B name", "isolation-b-1.mp4", handleB.displayName);
      expect(handleB.displayName).assertEqual("isolation-b-1.mp4");
      LogicTestLog.value(name, "Rename A publishes only A name", "isolated-rename-1.mp4", handleA.displayName);
      expect(handleA.displayName).assertEqual("isolated-rename-1.mp4");
      LogicTestLog.number(name, "Instance B uses independent fd seed", 920, fdB);
      expect(fdB).assertEqual(920);
      LogicTestLog.number(name, "Instance A never opens B descriptor", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "Instance B opens one descriptor", 1, filesB.opens.length);
      expect(filesB.opens.length).assertEqual(1);
      LogicTestLog.value(name, "Instance B descriptor URI", "fake://media/isolation-b-1", filesB.opens[0].path);
      expect(filesB.opens[0].path).assertEqual("fake://media/isolation-b-1");
      LogicTestLog.number(name, "Instance B closes its own descriptor", 920, filesB.closes[0]);
      expect(filesB.closes[0]).assertEqual(920);
      LogicTestLog.number(name, "Instance A library request count", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Instance B library request count", 1, libraryB.creates.length);
      expect(libraryB.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Instance B has no filesystem rename", 0, filesB.renames.length);
      expect(filesB.renames.length).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1206
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1206
     * @tc.nameDesc Injected instances isolate library filesystem and clock state: Verify two context snapshots,
     * independent fake operations and clocks with no native constructor activity.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1206", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1206";
      LogicTestLog.begin(name, "FileType.AUDIO; two independent synthetic environments");
      const traceB: MediaTrace = new MediaTrace();
      const filesB: FakeMediaFiles = new FakeMediaFiles(traceB);
      const libraryB: FakeMediaLibrary = new FakeMediaLibrary(traceB);
      const clockB: FakeMediaClock = new FakeMediaClock(traceB, '20300101', '010203');
      const contextB: common.UIAbilityContext = mediaContext('/synthetic/media/beta');
      const mediaB: MediaUtils = new MediaUtils(contextB, filesB, libraryB, clockB);
      filesB.nextFd = 920;
      LogicTestLog.value(name, "Injected constructor A is side effect free", "", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("");
      LogicTestLog.value(name, "Injected constructor B is side effect free", "", traceB.events.join("|"));
      expect(traceB.events.join("|")).assertEqual("");
      const handleA: MediaAssetHandle = await media.createAndGetUri(FileType.AUDIO);
      const handleB: MediaAssetHandle = await mediaB.createAndGetUri(FileType.AUDIO);
      LogicTestLog.value(name, "Instance A URI", "/synthetic/media/alpha/AUD_20261119_080910.mp3", handleA.uri);
      expect(handleA.uri).assertEqual("/synthetic/media/alpha/AUD_20261119_080910.mp3");
      LogicTestLog.value(name, "Instance B URI", "/synthetic/media/beta/AUD_20300101_010203.mp3", handleB.uri);
      expect(handleB.uri).assertEqual("/synthetic/media/beta/AUD_20300101_010203.mp3");
      LogicTestLog.value(name, "Instance A display name", "AUD_20261119_080910.mp3", handleA.displayName);
      expect(handleA.displayName).assertEqual("AUD_20261119_080910.mp3");
      LogicTestLog.value(name, "Instance B display name", "AUD_20300101_010203.mp3", handleB.displayName);
      expect(handleB.displayName).assertEqual("AUD_20300101_010203.mp3");
      LogicTestLog.number(name, "Clock A date calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Clock B date calls", 1, clockB.dateCalls);
      expect(clockB.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Clock A time calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      LogicTestLog.number(name, "Clock B time calls", 1, clockB.timeCalls);
      expect(clockB.timeCalls).assertEqual(1);
      await handleA.rename("isolated-rename-2.mp3");
      const fdB: number = await mediaB.getFdPath(handleB);
      await handleB.close(fdB);
      LogicTestLog.value(name, "Rename A does not change B URI",
        "/synthetic/media/beta/AUD_20300101_010203.mp3", handleB.uri);
      expect(handleB.uri).assertEqual("/synthetic/media/beta/AUD_20300101_010203.mp3");
      LogicTestLog.value(name, "Rename A does not change B name", "AUD_20300101_010203.mp3", handleB.displayName);
      expect(handleB.displayName).assertEqual("AUD_20300101_010203.mp3");
      LogicTestLog.value(name, "Rename A publishes only A name", "isolated-rename-2.mp3", handleA.displayName);
      expect(handleA.displayName).assertEqual("isolated-rename-2.mp3");
      LogicTestLog.number(name, "Instance B uses independent fd seed", 920, fdB);
      expect(fdB).assertEqual(920);
      LogicTestLog.number(name, "Instance A never opens B descriptor", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "Instance B opens one descriptor", 1, filesB.opens.length);
      expect(filesB.opens.length).assertEqual(1);
      LogicTestLog.value(name, "Instance B descriptor URI", "/synthetic/media/beta/AUD_20300101_010203.mp3",
        filesB.opens[0].path);
      expect(filesB.opens[0].path).assertEqual("/synthetic/media/beta/AUD_20300101_010203.mp3");
      LogicTestLog.number(name, "Instance B closes its own descriptor", 920, filesB.closes[0]);
      expect(filesB.closes[0]).assertEqual(920);
      LogicTestLog.number(name, "Instance A library request count", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "Instance B library request count", 0, libraryB.creates.length);
      expect(libraryB.creates.length).assertEqual(0);
      LogicTestLog.number(name, "Instance B has no filesystem rename", 0, filesB.renames.length);
      expect(filesB.renames.length).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1207
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1207
     * @tc.nameDesc Injected instances isolate library filesystem and clock state: Verify two context snapshots,
     * independent fake operations and clocks with no native constructor activity.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1207", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1207";
      LogicTestLog.begin(name, "FileType.FILE; two independent synthetic environments");
      const traceB: MediaTrace = new MediaTrace();
      const filesB: FakeMediaFiles = new FakeMediaFiles(traceB);
      const libraryB: FakeMediaLibrary = new FakeMediaLibrary(traceB);
      const clockB: FakeMediaClock = new FakeMediaClock(traceB, '20300101', '010203');
      const contextB: common.UIAbilityContext = mediaContext('/synthetic/media/beta');
      const mediaB: MediaUtils = new MediaUtils(contextB, filesB, libraryB, clockB);
      filesB.nextFd = 920;
      LogicTestLog.value(name, "Injected constructor A is side effect free", "", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("");
      LogicTestLog.value(name, "Injected constructor B is side effect free", "", traceB.events.join("|"));
      expect(traceB.events.join("|")).assertEqual("");
      const handleA: MediaAssetHandle = await media.createAndGetUri(FileType.FILE);
      const handleB: MediaAssetHandle = await mediaB.createAndGetUri(FileType.FILE);
      LogicTestLog.value(name, "Instance A URI", "/synthetic/media/alpha/FILE_20261119_080910.txt", handleA.uri);
      expect(handleA.uri).assertEqual("/synthetic/media/alpha/FILE_20261119_080910.txt");
      LogicTestLog.value(name, "Instance B URI", "/synthetic/media/beta/FILE_20300101_010203.txt", handleB.uri);
      expect(handleB.uri).assertEqual("/synthetic/media/beta/FILE_20300101_010203.txt");
      LogicTestLog.value(name, "Instance A display name", "FILE_20261119_080910.txt", handleA.displayName);
      expect(handleA.displayName).assertEqual("FILE_20261119_080910.txt");
      LogicTestLog.value(name, "Instance B display name", "FILE_20300101_010203.txt", handleB.displayName);
      expect(handleB.displayName).assertEqual("FILE_20300101_010203.txt");
      LogicTestLog.number(name, "Clock A date calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Clock B date calls", 1, clockB.dateCalls);
      expect(clockB.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Clock A time calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      LogicTestLog.number(name, "Clock B time calls", 1, clockB.timeCalls);
      expect(clockB.timeCalls).assertEqual(1);
      await handleA.rename("isolated-rename-3.txt");
      const fdB: number = await mediaB.getFdPath(handleB);
      await handleB.close(fdB);
      LogicTestLog.value(name, "Rename A does not change B URI",
        "/synthetic/media/beta/FILE_20300101_010203.txt", handleB.uri);
      expect(handleB.uri).assertEqual("/synthetic/media/beta/FILE_20300101_010203.txt");
      LogicTestLog.value(name, "Rename A does not change B name", "FILE_20300101_010203.txt", handleB.displayName);
      expect(handleB.displayName).assertEqual("FILE_20300101_010203.txt");
      LogicTestLog.value(name, "Rename A publishes only A name", "isolated-rename-3.txt", handleA.displayName);
      expect(handleA.displayName).assertEqual("isolated-rename-3.txt");
      LogicTestLog.number(name, "Instance B uses independent fd seed", 920, fdB);
      expect(fdB).assertEqual(920);
      LogicTestLog.number(name, "Instance A never opens B descriptor", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "Instance B opens one descriptor", 1, filesB.opens.length);
      expect(filesB.opens.length).assertEqual(1);
      LogicTestLog.value(name, "Instance B descriptor URI", "/synthetic/media/beta/FILE_20300101_010203.txt",
        filesB.opens[0].path);
      expect(filesB.opens[0].path).assertEqual("/synthetic/media/beta/FILE_20300101_010203.txt");
      LogicTestLog.number(name, "Instance B closes its own descriptor", 920, filesB.closes[0]);
      expect(filesB.closes[0]).assertEqual(920);
      LogicTestLog.number(name, "Instance A library request count", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "Instance B library request count", 0, libraryB.creates.length);
      expect(libraryB.creates.length).assertEqual(0);
      LogicTestLog.number(name, "Instance B has no filesystem rename", 0, filesB.renames.length);
      expect(filesB.renames.length).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1208
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1208
     * @tc.nameDesc Sandbox workflow links listing rename descriptor metadata and deletion: Verify production returned
     * handles stay usable across rename, metadata listing, open and delete steps.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1208", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1208";
      LogicTestLog.begin(name, "FileType.AUDIO; workflow-original-0.mp3 -> workflow-renamed-0.mp3; mtime=0");
      files.names = ["workflow-original-0.mp3", 'unrelated.bin'];
      files.mtimes.set("/synthetic/media/alpha/workflow-original-0.mp3", 0);
      const listed: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.AUDIO);
      LogicTestLog.number(name, "Initial selected handle count", 1, listed.length);
      expect(listed.length).assertEqual(1);
      const handle: MediaAssetHandle = listed[0];
      await handle.rename("workflow-renamed-0.mp3");
      const fd: number = await media.getFdPath(handle);
      await handle.close(fd);
      const infos: FileInfo[] = await media.getFileAssets(context, FileType.AUDIO);
      LogicTestLog.value(name, "Workflow renamed URI", "/synthetic/media/alpha/workflow-renamed-0.mp3", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/workflow-renamed-0.mp3");
      LogicTestLog.value(name, "Workflow renamed display name", "workflow-renamed-0.mp3", handle.displayName);
      expect(handle.displayName).assertEqual("workflow-renamed-0.mp3");
      LogicTestLog.value(name, "Workflow filesystem source", "/synthetic/media/alpha/workflow-original-0.mp3",
        files.renames[0].source);
      expect(files.renames[0].source).assertEqual("/synthetic/media/alpha/workflow-original-0.mp3");
      LogicTestLog.value(name, "Workflow filesystem target", "/synthetic/media/alpha/workflow-renamed-0.mp3",
        files.renames[0].target);
      expect(files.renames[0].target).assertEqual("/synthetic/media/alpha/workflow-renamed-0.mp3");
      LogicTestLog.value(name, "Workflow open uses renamed path",
        "/synthetic/media/alpha/workflow-renamed-0.mp3", files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/alpha/workflow-renamed-0.mp3");
      LogicTestLog.number(name, "Workflow descriptor fd", 710, fd);
      expect(fd).assertEqual(710);
      LogicTestLog.number(name, "Workflow explicit close fd", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
      LogicTestLog.number(name, "Filtered FileInfo count after rename", 1, infos.length);
      expect(infos.length).assertEqual(1);
      LogicTestLog.value(name, "FileInfo uses renamed name", "workflow-renamed-0.mp3", infos[0].fileName);
      expect(infos[0].fileName).assertEqual("workflow-renamed-0.mp3");
      LogicTestLog.value(name, "FileInfo uses renamed URI", "/synthetic/media/alpha/workflow-renamed-0.mp3",
        infos[0].uri);
      expect(infos[0].uri).assertEqual("/synthetic/media/alpha/workflow-renamed-0.mp3");
      LogicTestLog.number(name, "FileInfo retains original mtime", 0, infos[0].mtime);
      expect(infos[0].mtime).assertEqual(0);
      await media.deleteFile(FileType.AUDIO, handle.uri);
      const remaining: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.AUDIO);
      const allFiles: FileInfo[] = await media.getFileAssets(context);
      LogicTestLog.value(name, "Delete uses updated URI", "/synthetic/media/alpha/workflow-renamed-0.mp3",
        files.unlinks[0]);
      expect(files.unlinks[0]).assertEqual("/synthetic/media/alpha/workflow-renamed-0.mp3");
      LogicTestLog.number(name, "Deleted asset disappears from filtered handles", 0, remaining.length);
      expect(remaining.length).assertEqual(0);
      LogicTestLog.number(name, "Unrelated default unfiltered FileInfo survives", 1, allFiles.length);
      expect(allFiles.length).assertEqual(1);
      LogicTestLog.value(name, "Unrelated file name survives", "unrelated.bin", allFiles[0].fileName);
      expect(allFiles[0].fileName).assertEqual("unrelated.bin");
      LogicTestLog.flag(name, "Renamed mtime removed by deletion",
        files.mtimes.has("/synthetic/media/alpha/workflow-renamed-0.mp3"));
      expect(files.mtimes.has("/synthetic/media/alpha/workflow-renamed-0.mp3")).assertFalse();
      LogicTestLog.number(name, "No library creation", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No library fetch", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "No library deletion", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      LogicTestLog.value(name, "Complete sandbox workflow order",
        "files.list|files.rename|files.open|files.close|files.list|fi" +
        "les.stat|files.unlink|files.list|files.list|files.stat", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.list|files.rename|files.open|files.close|files.list|fi" +
        "les.stat|files.unlink|files.list|files.list|files.stat");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1209
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1209
     * @tc.nameDesc Sandbox workflow links listing rename descriptor metadata and deletion: Verify production returned
     * handles stay usable across rename, metadata listing, open and delete steps.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1209", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1209";
      LogicTestLog.begin(name, "FileType.FILE; workflow-original-1.txt -> workflow-renamed-1.txt; mtime=111");
      files.names = ["workflow-original-1.txt", 'unrelated.bin'];
      files.mtimes.set("/synthetic/media/alpha/workflow-original-1.txt", 111);
      const listed: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.FILE);
      LogicTestLog.number(name, "Initial selected handle count", 1, listed.length);
      expect(listed.length).assertEqual(1);
      const handle: MediaAssetHandle = listed[0];
      await handle.rename("workflow-renamed-1.txt");
      const fd: number = await media.getFdPath(handle);
      await handle.close(fd);
      const infos: FileInfo[] = await media.getFileAssets(context, FileType.FILE);
      LogicTestLog.value(name, "Workflow renamed URI", "/synthetic/media/alpha/workflow-renamed-1.txt", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/workflow-renamed-1.txt");
      LogicTestLog.value(name, "Workflow renamed display name", "workflow-renamed-1.txt", handle.displayName);
      expect(handle.displayName).assertEqual("workflow-renamed-1.txt");
      LogicTestLog.value(name, "Workflow filesystem source", "/synthetic/media/alpha/workflow-original-1.txt",
        files.renames[0].source);
      expect(files.renames[0].source).assertEqual("/synthetic/media/alpha/workflow-original-1.txt");
      LogicTestLog.value(name, "Workflow filesystem target", "/synthetic/media/alpha/workflow-renamed-1.txt",
        files.renames[0].target);
      expect(files.renames[0].target).assertEqual("/synthetic/media/alpha/workflow-renamed-1.txt");
      LogicTestLog.value(name, "Workflow open uses renamed path",
        "/synthetic/media/alpha/workflow-renamed-1.txt", files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/alpha/workflow-renamed-1.txt");
      LogicTestLog.number(name, "Workflow descriptor fd", 710, fd);
      expect(fd).assertEqual(710);
      LogicTestLog.number(name, "Workflow explicit close fd", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
      LogicTestLog.number(name, "Filtered FileInfo count after rename", 1, infos.length);
      expect(infos.length).assertEqual(1);
      LogicTestLog.value(name, "FileInfo uses renamed name", "workflow-renamed-1.txt", infos[0].fileName);
      expect(infos[0].fileName).assertEqual("workflow-renamed-1.txt");
      LogicTestLog.value(name, "FileInfo uses renamed URI", "/synthetic/media/alpha/workflow-renamed-1.txt",
        infos[0].uri);
      expect(infos[0].uri).assertEqual("/synthetic/media/alpha/workflow-renamed-1.txt");
      LogicTestLog.number(name, "FileInfo retains original mtime", 111, infos[0].mtime);
      expect(infos[0].mtime).assertEqual(111);
      await media.deleteFile(FileType.FILE, handle.uri);
      const remaining: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.FILE);
      const allFiles: FileInfo[] = await media.getFileAssets(context);
      LogicTestLog.value(name, "Delete uses updated URI", "/synthetic/media/alpha/workflow-renamed-1.txt",
        files.unlinks[0]);
      expect(files.unlinks[0]).assertEqual("/synthetic/media/alpha/workflow-renamed-1.txt");
      LogicTestLog.number(name, "Deleted asset disappears from filtered handles", 0, remaining.length);
      expect(remaining.length).assertEqual(0);
      LogicTestLog.number(name, "Unrelated default unfiltered FileInfo survives", 1, allFiles.length);
      expect(allFiles.length).assertEqual(1);
      LogicTestLog.value(name, "Unrelated file name survives", "unrelated.bin", allFiles[0].fileName);
      expect(allFiles[0].fileName).assertEqual("unrelated.bin");
      LogicTestLog.flag(name, "Renamed mtime removed by deletion",
        files.mtimes.has("/synthetic/media/alpha/workflow-renamed-1.txt"));
      expect(files.mtimes.has("/synthetic/media/alpha/workflow-renamed-1.txt")).assertFalse();
      LogicTestLog.number(name, "No library creation", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No library fetch", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "No library deletion", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      LogicTestLog.value(name, "Complete sandbox workflow order",
        "files.list|files.rename|files.open|files.close|files.list|fi" +
        "les.stat|files.unlink|files.list|files.list|files.stat", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.list|files.rename|files.open|files.close|files.list|fi" +
        "les.stat|files.unlink|files.list|files.list|files.stat");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1210
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1210
     * @tc.nameDesc Sandbox workflow links listing rename descriptor metadata and deletion: Verify production returned
     * handles stay usable across rename, metadata listing, open and delete steps.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1210", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1210";
      LogicTestLog.begin(name, "FileType.AUDIO; workflow-original-2.mp3 -> workflow-renamed-2.mp3; mtime=222");
      files.names = ["workflow-original-2.mp3", 'unrelated.bin'];
      files.mtimes.set("/synthetic/media/alpha/workflow-original-2.mp3", 222);
      const listed: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.AUDIO);
      LogicTestLog.number(name, "Initial selected handle count", 1, listed.length);
      expect(listed.length).assertEqual(1);
      const handle: MediaAssetHandle = listed[0];
      await handle.rename("workflow-renamed-2.mp3");
      const fd: number = await media.getFdPath(handle);
      await handle.close(fd);
      const infos: FileInfo[] = await media.getFileAssets(context, FileType.AUDIO);
      LogicTestLog.value(name, "Workflow renamed URI", "/synthetic/media/alpha/workflow-renamed-2.mp3", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/workflow-renamed-2.mp3");
      LogicTestLog.value(name, "Workflow renamed display name", "workflow-renamed-2.mp3", handle.displayName);
      expect(handle.displayName).assertEqual("workflow-renamed-2.mp3");
      LogicTestLog.value(name, "Workflow filesystem source", "/synthetic/media/alpha/workflow-original-2.mp3",
        files.renames[0].source);
      expect(files.renames[0].source).assertEqual("/synthetic/media/alpha/workflow-original-2.mp3");
      LogicTestLog.value(name, "Workflow filesystem target", "/synthetic/media/alpha/workflow-renamed-2.mp3",
        files.renames[0].target);
      expect(files.renames[0].target).assertEqual("/synthetic/media/alpha/workflow-renamed-2.mp3");
      LogicTestLog.value(name, "Workflow open uses renamed path",
        "/synthetic/media/alpha/workflow-renamed-2.mp3", files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/alpha/workflow-renamed-2.mp3");
      LogicTestLog.number(name, "Workflow descriptor fd", 710, fd);
      expect(fd).assertEqual(710);
      LogicTestLog.number(name, "Workflow explicit close fd", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
      LogicTestLog.number(name, "Filtered FileInfo count after rename", 1, infos.length);
      expect(infos.length).assertEqual(1);
      LogicTestLog.value(name, "FileInfo uses renamed name", "workflow-renamed-2.mp3", infos[0].fileName);
      expect(infos[0].fileName).assertEqual("workflow-renamed-2.mp3");
      LogicTestLog.value(name, "FileInfo uses renamed URI", "/synthetic/media/alpha/workflow-renamed-2.mp3",
        infos[0].uri);
      expect(infos[0].uri).assertEqual("/synthetic/media/alpha/workflow-renamed-2.mp3");
      LogicTestLog.number(name, "FileInfo retains original mtime", 222, infos[0].mtime);
      expect(infos[0].mtime).assertEqual(222);
      await media.deleteFile(FileType.AUDIO, handle.uri);
      const remaining: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.AUDIO);
      const allFiles: FileInfo[] = await media.getFileAssets(context);
      LogicTestLog.value(name, "Delete uses updated URI", "/synthetic/media/alpha/workflow-renamed-2.mp3",
        files.unlinks[0]);
      expect(files.unlinks[0]).assertEqual("/synthetic/media/alpha/workflow-renamed-2.mp3");
      LogicTestLog.number(name, "Deleted asset disappears from filtered handles", 0, remaining.length);
      expect(remaining.length).assertEqual(0);
      LogicTestLog.number(name, "Unrelated default unfiltered FileInfo survives", 1, allFiles.length);
      expect(allFiles.length).assertEqual(1);
      LogicTestLog.value(name, "Unrelated file name survives", "unrelated.bin", allFiles[0].fileName);
      expect(allFiles[0].fileName).assertEqual("unrelated.bin");
      LogicTestLog.flag(name, "Renamed mtime removed by deletion",
        files.mtimes.has("/synthetic/media/alpha/workflow-renamed-2.mp3"));
      expect(files.mtimes.has("/synthetic/media/alpha/workflow-renamed-2.mp3")).assertFalse();
      LogicTestLog.number(name, "No library creation", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No library fetch", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "No library deletion", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      LogicTestLog.value(name, "Complete sandbox workflow order",
        "files.list|files.rename|files.open|files.close|files.list|fi" +
        "les.stat|files.unlink|files.list|files.list|files.stat", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.list|files.rename|files.open|files.close|files.list|fi" +
        "les.stat|files.unlink|files.list|files.list|files.stat");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1211
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1211
     * @tc.nameDesc Sandbox workflow links listing rename descriptor metadata and deletion: Verify production returned
     * handles stay usable across rename, metadata listing, open and delete steps.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1211", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1211";
      LogicTestLog.begin(name, "FileType.FILE; workflow-original-3.txt -> workflow-renamed-3.txt; mtime=333");
      files.names = ["workflow-original-3.txt", 'unrelated.bin'];
      files.mtimes.set("/synthetic/media/alpha/workflow-original-3.txt", 333);
      const listed: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.FILE);
      LogicTestLog.number(name, "Initial selected handle count", 1, listed.length);
      expect(listed.length).assertEqual(1);
      const handle: MediaAssetHandle = listed[0];
      await handle.rename("workflow-renamed-3.txt");
      const fd: number = await media.getFdPath(handle);
      await handle.close(fd);
      const infos: FileInfo[] = await media.getFileAssets(context, FileType.FILE);
      LogicTestLog.value(name, "Workflow renamed URI", "/synthetic/media/alpha/workflow-renamed-3.txt", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/workflow-renamed-3.txt");
      LogicTestLog.value(name, "Workflow renamed display name", "workflow-renamed-3.txt", handle.displayName);
      expect(handle.displayName).assertEqual("workflow-renamed-3.txt");
      LogicTestLog.value(name, "Workflow filesystem source", "/synthetic/media/alpha/workflow-original-3.txt",
        files.renames[0].source);
      expect(files.renames[0].source).assertEqual("/synthetic/media/alpha/workflow-original-3.txt");
      LogicTestLog.value(name, "Workflow filesystem target", "/synthetic/media/alpha/workflow-renamed-3.txt",
        files.renames[0].target);
      expect(files.renames[0].target).assertEqual("/synthetic/media/alpha/workflow-renamed-3.txt");
      LogicTestLog.value(name, "Workflow open uses renamed path",
        "/synthetic/media/alpha/workflow-renamed-3.txt", files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/alpha/workflow-renamed-3.txt");
      LogicTestLog.number(name, "Workflow descriptor fd", 710, fd);
      expect(fd).assertEqual(710);
      LogicTestLog.number(name, "Workflow explicit close fd", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
      LogicTestLog.number(name, "Filtered FileInfo count after rename", 1, infos.length);
      expect(infos.length).assertEqual(1);
      LogicTestLog.value(name, "FileInfo uses renamed name", "workflow-renamed-3.txt", infos[0].fileName);
      expect(infos[0].fileName).assertEqual("workflow-renamed-3.txt");
      LogicTestLog.value(name, "FileInfo uses renamed URI", "/synthetic/media/alpha/workflow-renamed-3.txt",
        infos[0].uri);
      expect(infos[0].uri).assertEqual("/synthetic/media/alpha/workflow-renamed-3.txt");
      LogicTestLog.number(name, "FileInfo retains original mtime", 333, infos[0].mtime);
      expect(infos[0].mtime).assertEqual(333);
      await media.deleteFile(FileType.FILE, handle.uri);
      const remaining: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.FILE);
      const allFiles: FileInfo[] = await media.getFileAssets(context);
      LogicTestLog.value(name, "Delete uses updated URI", "/synthetic/media/alpha/workflow-renamed-3.txt",
        files.unlinks[0]);
      expect(files.unlinks[0]).assertEqual("/synthetic/media/alpha/workflow-renamed-3.txt");
      LogicTestLog.number(name, "Deleted asset disappears from filtered handles", 0, remaining.length);
      expect(remaining.length).assertEqual(0);
      LogicTestLog.number(name, "Unrelated default unfiltered FileInfo survives", 1, allFiles.length);
      expect(allFiles.length).assertEqual(1);
      LogicTestLog.value(name, "Unrelated file name survives", "unrelated.bin", allFiles[0].fileName);
      expect(allFiles[0].fileName).assertEqual("unrelated.bin");
      LogicTestLog.flag(name, "Renamed mtime removed by deletion",
        files.mtimes.has("/synthetic/media/alpha/workflow-renamed-3.txt"));
      expect(files.mtimes.has("/synthetic/media/alpha/workflow-renamed-3.txt")).assertFalse();
      LogicTestLog.number(name, "No library creation", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No library fetch", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "No library deletion", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      LogicTestLog.value(name, "Complete sandbox workflow order",
        "files.list|files.rename|files.open|files.close|files.list|fi" +
        "les.stat|files.unlink|files.list|files.list|files.stat", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.list|files.rename|files.open|files.close|files.list|fi" +
        "les.stat|files.unlink|files.list|files.list|files.stat");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1212
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1212
     * @tc.nameDesc Photo workflow preserves URI across metadata rename open and delete: Verify native create request,
     * metadata forwarding, committed name refresh and exact native delete routing.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1212", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1212";
      LogicTestLog.begin(name, "FileType.IMAGE; fake://media/photo-workflow-0; rename then d" +
        "escriptor and native deletion");
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/photo-workflow-0", photoAccessHelper.PhotoType.IMAGE, "workflow-original-0.jpg");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/photo-workflow-0";
      library.results = [fetch];
      photo.members.set('duration', 25);
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.IMAGE);
      handle.set('title', "synthetic title 0");
      await handle.commitModify();
      const observedTitle: photoAccessHelper.MemberType = handle.get('title');
      await handle.rename("workflow-renamed-0.jpg");
      const fd: number = await media.getFdPath(handle);
      await handle.close(fd);
      await media.deleteFile(FileType.IMAGE, handle.uri, context);
      LogicTestLog.value(name, "Workflow handle URI stays native", "fake://media/photo-workflow-0", handle.uri);
      expect(handle.uri).assertEqual("fake://media/photo-workflow-0");
      LogicTestLog.value(name, "Workflow exposes committed name", "workflow-renamed-0.jpg", handle.displayName);
      expect(handle.displayName).assertEqual("workflow-renamed-0.jpg");
      LogicTestLog.value(name, "Workflow metadata title forwarded", "synthetic title 0", String(observedTitle));
      expect(String(observedTitle)).assertEqual("synthetic title 0");
      LogicTestLog.number(name, "Workflow native create type", photoAccessHelper.PhotoType.IMAGE,
        library.creates[0].photoType);
      expect(library.creates[0].photoType).assertEqual(photoAccessHelper.PhotoType.IMAGE);
      LogicTestLog.value(name, "Workflow native create extension", "jpg", library.creates[0].extension);
      expect(library.creates[0].extension).assertEqual("jpg");
      LogicTestLog.number(name, "Workflow fetch closed exactly once", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Workflow two metadata sets", 2, photo.sets.length);
      expect(photo.sets.length).assertEqual(2);
      LogicTestLog.value(name, "Title native key", "title", photo.sets[0].member);
      expect(photo.sets[0].member).assertEqual("title");
      LogicTestLog.value(name, "Title native value", "synthetic title 0", photo.sets[0].value);
      expect(photo.sets[0].value).assertEqual("synthetic title 0");
      LogicTestLog.value(name, "Rename native key", "display_name", photo.sets[1].member);
      expect(photo.sets[1].member).assertEqual("display_name");
      LogicTestLog.value(name, "Rename native value", "workflow-renamed-0.jpg", photo.sets[1].value);
      expect(photo.sets[1].value).assertEqual("workflow-renamed-0.jpg");
      LogicTestLog.number(name, "Generic commit and rename commit", 2, photo.commits);
      expect(photo.commits).assertEqual(2);
      LogicTestLog.number(name, "Workflow descriptor fd", 710, fd);
      expect(fd).assertEqual(710);
      LogicTestLog.value(name, "Workflow photo open path", "fake://media/photo-workflow-0", files.opens[0].path);
      expect(files.opens[0].path).assertEqual("fake://media/photo-workflow-0");
      LogicTestLog.number(name, "Workflow photo open flags", fileIo.OpenMode.READ_WRITE, files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Workflow closed exact descriptor", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
      LogicTestLog.value(name, "Workflow native delete URI", "fake://media/photo-workflow-0",
        library.deletes[0].uris.join("|"));
      expect(library.deletes[0].uris.join("|")).assertEqual("fake://media/photo-workflow-0");
      LogicTestLog.flag(name, "Workflow native delete context", library.deletes[0].context === context);
      expect(library.deletes[0].context === context).assertTrue();
      LogicTestLog.number(name, "Workflow never sandbox-unlinks photo", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.number(name, "Workflow never filesystem-renames photo", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.value(name, "Photo workflow ordered operations",
        "clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|photo.get|photo.set|photo.commit|photo.get|phot" +
        "o.set|photo.commit|photo.get|files.open|files.close|library." +
        "delete", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|photo.get|photo.set|photo.commit|photo.get|phot" +
        "o.set|photo.commit|photo.get|files.open|files.close|library." +
        "delete");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1213
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1213
     * @tc.nameDesc Photo workflow preserves URI across metadata rename open and delete: Verify native create request,
     * metadata forwarding, committed name refresh and exact native delete routing.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1213", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1213";
      LogicTestLog.begin(name, "FileType.VIDEO; fake://media/photo-workflow-1; rename then d" +
        "escriptor and native deletion");
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/photo-workflow-1", photoAccessHelper.PhotoType.VIDEO, "workflow-original-1.mp4");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/photo-workflow-1";
      library.results = [fetch];
      photo.members.set('duration', 125);
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.VIDEO);
      handle.set('title', "synthetic title 1");
      await handle.commitModify();
      const observedTitle: photoAccessHelper.MemberType = handle.get('title');
      await handle.rename("workflow-renamed-1.mp4");
      const fd: number = await media.getFdPath(handle);
      await handle.close(fd);
      await media.deleteFile(FileType.VIDEO, handle.uri, context);
      LogicTestLog.value(name, "Workflow handle URI stays native", "fake://media/photo-workflow-1", handle.uri);
      expect(handle.uri).assertEqual("fake://media/photo-workflow-1");
      LogicTestLog.value(name, "Workflow exposes committed name", "workflow-renamed-1.mp4", handle.displayName);
      expect(handle.displayName).assertEqual("workflow-renamed-1.mp4");
      LogicTestLog.value(name, "Workflow metadata title forwarded", "synthetic title 1", String(observedTitle));
      expect(String(observedTitle)).assertEqual("synthetic title 1");
      LogicTestLog.number(name, "Workflow native create type", photoAccessHelper.PhotoType.VIDEO,
        library.creates[0].photoType);
      expect(library.creates[0].photoType).assertEqual(photoAccessHelper.PhotoType.VIDEO);
      LogicTestLog.value(name, "Workflow native create extension", "mp4", library.creates[0].extension);
      expect(library.creates[0].extension).assertEqual("mp4");
      LogicTestLog.number(name, "Workflow fetch closed exactly once", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Workflow two metadata sets", 2, photo.sets.length);
      expect(photo.sets.length).assertEqual(2);
      LogicTestLog.value(name, "Title native key", "title", photo.sets[0].member);
      expect(photo.sets[0].member).assertEqual("title");
      LogicTestLog.value(name, "Title native value", "synthetic title 1", photo.sets[0].value);
      expect(photo.sets[0].value).assertEqual("synthetic title 1");
      LogicTestLog.value(name, "Rename native key", "display_name", photo.sets[1].member);
      expect(photo.sets[1].member).assertEqual("display_name");
      LogicTestLog.value(name, "Rename native value", "workflow-renamed-1.mp4", photo.sets[1].value);
      expect(photo.sets[1].value).assertEqual("workflow-renamed-1.mp4");
      LogicTestLog.number(name, "Generic commit and rename commit", 2, photo.commits);
      expect(photo.commits).assertEqual(2);
      LogicTestLog.number(name, "Workflow descriptor fd", 710, fd);
      expect(fd).assertEqual(710);
      LogicTestLog.value(name, "Workflow photo open path", "fake://media/photo-workflow-1", files.opens[0].path);
      expect(files.opens[0].path).assertEqual("fake://media/photo-workflow-1");
      LogicTestLog.number(name, "Workflow photo open flags", fileIo.OpenMode.READ_WRITE, files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Workflow closed exact descriptor", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
      LogicTestLog.value(name, "Workflow native delete URI", "fake://media/photo-workflow-1",
        library.deletes[0].uris.join("|"));
      expect(library.deletes[0].uris.join("|")).assertEqual("fake://media/photo-workflow-1");
      LogicTestLog.flag(name, "Workflow native delete context", library.deletes[0].context === context);
      expect(library.deletes[0].context === context).assertTrue();
      LogicTestLog.number(name, "Workflow never sandbox-unlinks photo", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.number(name, "Workflow never filesystem-renames photo", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.value(name, "Photo workflow ordered operations",
        "clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|photo.get|photo.set|photo.commit|photo.get|phot" +
        "o.set|photo.commit|photo.get|files.open|files.close|library." +
        "delete", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|photo.get|photo.set|photo.commit|photo.get|phot" +
        "o.set|photo.commit|photo.get|files.open|files.close|library." +
        "delete");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1214
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1214
     * @tc.nameDesc Photo workflow preserves URI across metadata rename open and delete: Verify native create request,
     * metadata forwarding, committed name refresh and exact native delete routing.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1214", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1214";
      LogicTestLog.begin(name, "FileType.IMAGE; fake://media/photo-workflow-2; rename then d" +
        "escriptor and native deletion");
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/photo-workflow-2", photoAccessHelper.PhotoType.IMAGE, "workflow-original-2.jpg");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/photo-workflow-2";
      library.results = [fetch];
      photo.members.set('duration', 225);
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.IMAGE);
      handle.set('title', "synthetic title 2");
      await handle.commitModify();
      const observedTitle: photoAccessHelper.MemberType = handle.get('title');
      await handle.rename("workflow-renamed-2.jpg");
      const fd: number = await media.getFdPath(handle);
      await handle.close(fd);
      await media.deleteFile(FileType.IMAGE, handle.uri, context);
      LogicTestLog.value(name, "Workflow handle URI stays native", "fake://media/photo-workflow-2", handle.uri);
      expect(handle.uri).assertEqual("fake://media/photo-workflow-2");
      LogicTestLog.value(name, "Workflow exposes committed name", "workflow-renamed-2.jpg", handle.displayName);
      expect(handle.displayName).assertEqual("workflow-renamed-2.jpg");
      LogicTestLog.value(name, "Workflow metadata title forwarded", "synthetic title 2", String(observedTitle));
      expect(String(observedTitle)).assertEqual("synthetic title 2");
      LogicTestLog.number(name, "Workflow native create type", photoAccessHelper.PhotoType.IMAGE,
        library.creates[0].photoType);
      expect(library.creates[0].photoType).assertEqual(photoAccessHelper.PhotoType.IMAGE);
      LogicTestLog.value(name, "Workflow native create extension", "jpg", library.creates[0].extension);
      expect(library.creates[0].extension).assertEqual("jpg");
      LogicTestLog.number(name, "Workflow fetch closed exactly once", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Workflow two metadata sets", 2, photo.sets.length);
      expect(photo.sets.length).assertEqual(2);
      LogicTestLog.value(name, "Title native key", "title", photo.sets[0].member);
      expect(photo.sets[0].member).assertEqual("title");
      LogicTestLog.value(name, "Title native value", "synthetic title 2", photo.sets[0].value);
      expect(photo.sets[0].value).assertEqual("synthetic title 2");
      LogicTestLog.value(name, "Rename native key", "display_name", photo.sets[1].member);
      expect(photo.sets[1].member).assertEqual("display_name");
      LogicTestLog.value(name, "Rename native value", "workflow-renamed-2.jpg", photo.sets[1].value);
      expect(photo.sets[1].value).assertEqual("workflow-renamed-2.jpg");
      LogicTestLog.number(name, "Generic commit and rename commit", 2, photo.commits);
      expect(photo.commits).assertEqual(2);
      LogicTestLog.number(name, "Workflow descriptor fd", 710, fd);
      expect(fd).assertEqual(710);
      LogicTestLog.value(name, "Workflow photo open path", "fake://media/photo-workflow-2", files.opens[0].path);
      expect(files.opens[0].path).assertEqual("fake://media/photo-workflow-2");
      LogicTestLog.number(name, "Workflow photo open flags", fileIo.OpenMode.READ_WRITE, files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Workflow closed exact descriptor", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
      LogicTestLog.value(name, "Workflow native delete URI", "fake://media/photo-workflow-2",
        library.deletes[0].uris.join("|"));
      expect(library.deletes[0].uris.join("|")).assertEqual("fake://media/photo-workflow-2");
      LogicTestLog.flag(name, "Workflow native delete context", library.deletes[0].context === context);
      expect(library.deletes[0].context === context).assertTrue();
      LogicTestLog.number(name, "Workflow never sandbox-unlinks photo", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.number(name, "Workflow never filesystem-renames photo", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.value(name, "Photo workflow ordered operations",
        "clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|photo.get|photo.set|photo.commit|photo.get|phot" +
        "o.set|photo.commit|photo.get|files.open|files.close|library." +
        "delete", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|photo.get|photo.set|photo.commit|photo.get|phot" +
        "o.set|photo.commit|photo.get|files.open|files.close|library." +
        "delete");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1215
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1215
     * @tc.nameDesc Photo workflow preserves URI across metadata rename open and delete: Verify native create request,
     * metadata forwarding, committed name refresh and exact native delete routing.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1215", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1215";
      LogicTestLog.begin(name, "FileType.VIDEO; fake://media/photo-workflow-3; rename then d" +
        "escriptor and native deletion");
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/photo-workflow-3", photoAccessHelper.PhotoType.VIDEO, "workflow-original-3.mp4");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/photo-workflow-3";
      library.results = [fetch];
      photo.members.set('duration', 325);
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.VIDEO);
      handle.set('title', "synthetic title 3");
      await handle.commitModify();
      const observedTitle: photoAccessHelper.MemberType = handle.get('title');
      await handle.rename("workflow-renamed-3.mp4");
      const fd: number = await media.getFdPath(handle);
      await handle.close(fd);
      await media.deleteFile(FileType.VIDEO, handle.uri, context);
      LogicTestLog.value(name, "Workflow handle URI stays native", "fake://media/photo-workflow-3", handle.uri);
      expect(handle.uri).assertEqual("fake://media/photo-workflow-3");
      LogicTestLog.value(name, "Workflow exposes committed name", "workflow-renamed-3.mp4", handle.displayName);
      expect(handle.displayName).assertEqual("workflow-renamed-3.mp4");
      LogicTestLog.value(name, "Workflow metadata title forwarded", "synthetic title 3", String(observedTitle));
      expect(String(observedTitle)).assertEqual("synthetic title 3");
      LogicTestLog.number(name, "Workflow native create type", photoAccessHelper.PhotoType.VIDEO,
        library.creates[0].photoType);
      expect(library.creates[0].photoType).assertEqual(photoAccessHelper.PhotoType.VIDEO);
      LogicTestLog.value(name, "Workflow native create extension", "mp4", library.creates[0].extension);
      expect(library.creates[0].extension).assertEqual("mp4");
      LogicTestLog.number(name, "Workflow fetch closed exactly once", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Workflow two metadata sets", 2, photo.sets.length);
      expect(photo.sets.length).assertEqual(2);
      LogicTestLog.value(name, "Title native key", "title", photo.sets[0].member);
      expect(photo.sets[0].member).assertEqual("title");
      LogicTestLog.value(name, "Title native value", "synthetic title 3", photo.sets[0].value);
      expect(photo.sets[0].value).assertEqual("synthetic title 3");
      LogicTestLog.value(name, "Rename native key", "display_name", photo.sets[1].member);
      expect(photo.sets[1].member).assertEqual("display_name");
      LogicTestLog.value(name, "Rename native value", "workflow-renamed-3.mp4", photo.sets[1].value);
      expect(photo.sets[1].value).assertEqual("workflow-renamed-3.mp4");
      LogicTestLog.number(name, "Generic commit and rename commit", 2, photo.commits);
      expect(photo.commits).assertEqual(2);
      LogicTestLog.number(name, "Workflow descriptor fd", 710, fd);
      expect(fd).assertEqual(710);
      LogicTestLog.value(name, "Workflow photo open path", "fake://media/photo-workflow-3", files.opens[0].path);
      expect(files.opens[0].path).assertEqual("fake://media/photo-workflow-3");
      LogicTestLog.number(name, "Workflow photo open flags", fileIo.OpenMode.READ_WRITE, files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Workflow closed exact descriptor", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
      LogicTestLog.value(name, "Workflow native delete URI", "fake://media/photo-workflow-3",
        library.deletes[0].uris.join("|"));
      expect(library.deletes[0].uris.join("|")).assertEqual("fake://media/photo-workflow-3");
      LogicTestLog.flag(name, "Workflow native delete context", library.deletes[0].context === context);
      expect(library.deletes[0].context === context).assertTrue();
      LogicTestLog.number(name, "Workflow never sandbox-unlinks photo", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.number(name, "Workflow never filesystem-renames photo", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.value(name, "Photo workflow ordered operations",
        "clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|photo.get|photo.set|photo.commit|photo.get|phot" +
        "o.set|photo.commit|photo.get|files.open|files.close|library." +
        "delete", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|library.create|library.fetch|fetch.all" +
        "|fetch.close|photo.get|photo.set|photo.commit|photo.get|phot" +
        "o.set|photo.commit|photo.get|files.open|files.close|library." +
        "delete");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1216
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1216
     * @tc.nameDesc Album failures preserve independent categories and cleanup: Verify concurrent album tasks return
     * usable independent counts and retry all categories after recovery.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1216", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1216";
      LogicTestLog.begin(name, "album injected failure=list");
      files.names = ['document.txt', 'tone.mp3', 'ignored.bin'];
      files.mtimes.set('/synthetic/media/alpha/document.txt', 55);
      const image: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/album-recovery-image-0", photoAccessHelper.PhotoType.IMAGE, 'recovery.jpg');
      const video: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/album-recovery-video-0", photoAccessHelper.PhotoType.VIDEO, 'recovery.mp4');
      const firstFetch: FakeMediaFetch = new FakeMediaFetch(trace, [image, video]);
      const secondFetch: FakeMediaFetch = new FakeMediaFetch(trace, [image, video]);
      library.results = [firstFetch, secondFetch];
      files.listError = 'synthetic album list failure';
      const failed: AlbumInfo[] = await media.getAlbums(context);
      LogicTestLog.number(name, "Failure still returns all album descriptors", 4, failed.length);
      expect(failed.length).assertEqual(4);
      LogicTestLog.value(name, "Failure album order", "Documents|Pictures|Videos|Audios",
        failed.map((item: AlbumInfo) => item.albumName).join("|"));
      expect(failed.map((item: AlbumInfo) => item.albumName).join("|")).assertEqual("Documents|Pictures|Videos|Audios");
      LogicTestLog.number(name, "Failure Documents count", 0, failed[0].count);
      expect(failed[0].count).assertEqual(0);
      LogicTestLog.number(name, "Failure Pictures count", 1, failed[1].count);
      expect(failed[1].count).assertEqual(1);
      LogicTestLog.number(name, "Failure Videos count", 1, failed[2].count);
      expect(failed[2].count).assertEqual(1);
      LogicTestLog.number(name, "Failure Audios count", 0, failed[3].count);
      expect(failed[3].count).assertEqual(0);
      LogicTestLog.number(name, "First acquired fetch is closed on failure", 1, firstFetch.closeCalls);
      expect(firstFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Second acquired fetch is closed on failure", 1, secondFetch.closeCalls);
      expect(secondFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Both fetch object reads attempted", 2, firstFetch.allCalls + secondFetch.allCalls);
      expect(firstFetch.allCalls + secondFetch.allCalls).assertEqual(2);
      LogicTestLog.number(name, "Failure does not open files", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      files.listError = '';
      files.statError = '';
      firstFetch.allError = '';
      secondFetch.allError = '';
      firstFetch.closeError = '';
      secondFetch.closeError = '';
      library.resultIndex = 0;
      const recovered: AlbumInfo[] = await media.getAlbums(context);
      LogicTestLog.value(name, "Recovered album counts", "1|1|1|1",
        recovered.map((item: AlbumInfo) => String(item.count)).join("|"));
      expect(recovered.map((item: AlbumInfo) => String(item.count)).join("|")).assertEqual("1|1|1|1");
      LogicTestLog.value(name, "Recovered album types", "4|1|2|3",
        recovered.map((item: AlbumInfo) => String(item.mediaType)).join("|"));
      expect(recovered.map((item: AlbumInfo) => String(item.mediaType)).join("|")).assertEqual("4|1|2|3");
      LogicTestLog.number(name, "First fetch closed on every invocation", 2, firstFetch.closeCalls);
      expect(firstFetch.closeCalls).assertEqual(2);
      LogicTestLog.number(name, "Second fetch closed on every invocation", 2, secondFetch.closeCalls);
      expect(secondFetch.closeCalls).assertEqual(2);
      LogicTestLog.number(name, "Separate media fetches per album call", 4, library.fetches.length);
      expect(library.fetches.length).assertEqual(4);
      LogicTestLog.number(name, "Separate audio and documents lists per call", 4, files.lists.length);
      expect(files.lists.length).assertEqual(4);
      LogicTestLog.number(name, "No native creation from album recovery", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No native deletion from album recovery", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      LogicTestLog.value(name, "Album recovery leaves source directory intact",
        "document.txt|tone.mp3|ignored.bin", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("document.txt|tone.mp3|ignored.bin");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1217
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1217
     * @tc.nameDesc Album failures preserve independent categories and cleanup: Verify concurrent album tasks return
     * usable independent counts and retry all categories after recovery.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1217", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1217";
      LogicTestLog.begin(name, "album injected failure=all");
      files.names = ['document.txt', 'tone.mp3', 'ignored.bin'];
      files.mtimes.set('/synthetic/media/alpha/document.txt', 55);
      const image: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/album-recovery-image-1", photoAccessHelper.PhotoType.IMAGE, 'recovery.jpg');
      const video: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/album-recovery-video-1", photoAccessHelper.PhotoType.VIDEO, 'recovery.mp4');
      const firstFetch: FakeMediaFetch = new FakeMediaFetch(trace, [image, video]);
      const secondFetch: FakeMediaFetch = new FakeMediaFetch(trace, [image, video]);
      library.results = [firstFetch, secondFetch];
      firstFetch.allError = 'synthetic album fetch failure';
      secondFetch.allError = 'synthetic album fetch failure';
      const failed: AlbumInfo[] = await media.getAlbums(context);
      LogicTestLog.number(name, "Failure still returns all album descriptors", 4, failed.length);
      expect(failed.length).assertEqual(4);
      LogicTestLog.value(name, "Failure album order", "Documents|Pictures|Videos|Audios",
        failed.map((item: AlbumInfo) => item.albumName).join("|"));
      expect(failed.map((item: AlbumInfo) => item.albumName).join("|")).assertEqual("Documents|Pictures|Videos|Audios");
      LogicTestLog.number(name, "Failure Documents count", 1, failed[0].count);
      expect(failed[0].count).assertEqual(1);
      LogicTestLog.number(name, "Failure Pictures count", 0, failed[1].count);
      expect(failed[1].count).assertEqual(0);
      LogicTestLog.number(name, "Failure Videos count", 0, failed[2].count);
      expect(failed[2].count).assertEqual(0);
      LogicTestLog.number(name, "Failure Audios count", 1, failed[3].count);
      expect(failed[3].count).assertEqual(1);
      LogicTestLog.number(name, "First acquired fetch is closed on failure", 1, firstFetch.closeCalls);
      expect(firstFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Second acquired fetch is closed on failure", 1, secondFetch.closeCalls);
      expect(secondFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Both fetch object reads attempted", 2, firstFetch.allCalls + secondFetch.allCalls);
      expect(firstFetch.allCalls + secondFetch.allCalls).assertEqual(2);
      LogicTestLog.number(name, "Failure does not open files", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      files.listError = '';
      files.statError = '';
      firstFetch.allError = '';
      secondFetch.allError = '';
      firstFetch.closeError = '';
      secondFetch.closeError = '';
      library.resultIndex = 0;
      const recovered: AlbumInfo[] = await media.getAlbums(context);
      LogicTestLog.value(name, "Recovered album counts", "1|1|1|1",
        recovered.map((item: AlbumInfo) => String(item.count)).join("|"));
      expect(recovered.map((item: AlbumInfo) => String(item.count)).join("|")).assertEqual("1|1|1|1");
      LogicTestLog.value(name, "Recovered album types", "4|1|2|3",
        recovered.map((item: AlbumInfo) => String(item.mediaType)).join("|"));
      expect(recovered.map((item: AlbumInfo) => String(item.mediaType)).join("|")).assertEqual("4|1|2|3");
      LogicTestLog.number(name, "First fetch closed on every invocation", 2, firstFetch.closeCalls);
      expect(firstFetch.closeCalls).assertEqual(2);
      LogicTestLog.number(name, "Second fetch closed on every invocation", 2, secondFetch.closeCalls);
      expect(secondFetch.closeCalls).assertEqual(2);
      LogicTestLog.number(name, "Separate media fetches per album call", 4, library.fetches.length);
      expect(library.fetches.length).assertEqual(4);
      LogicTestLog.number(name, "Separate audio and documents lists per call", 4, files.lists.length);
      expect(files.lists.length).assertEqual(4);
      LogicTestLog.number(name, "No native creation from album recovery", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No native deletion from album recovery", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      LogicTestLog.value(name, "Album recovery leaves source directory intact",
        "document.txt|tone.mp3|ignored.bin", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("document.txt|tone.mp3|ignored.bin");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1218
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1218
     * @tc.nameDesc Album failures preserve independent categories and cleanup: Verify concurrent album tasks return
     * usable independent counts and retry all categories after recovery.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1218", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1218";
      LogicTestLog.begin(name, "album injected failure=stat");
      files.names = ['document.txt', 'tone.mp3', 'ignored.bin'];
      files.mtimes.set('/synthetic/media/alpha/document.txt', 55);
      const image: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/album-recovery-image-2", photoAccessHelper.PhotoType.IMAGE, 'recovery.jpg');
      const video: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/album-recovery-video-2", photoAccessHelper.PhotoType.VIDEO, 'recovery.mp4');
      const firstFetch: FakeMediaFetch = new FakeMediaFetch(trace, [image, video]);
      const secondFetch: FakeMediaFetch = new FakeMediaFetch(trace, [image, video]);
      library.results = [firstFetch, secondFetch];
      files.statError = 'synthetic album stat failure';
      const failed: AlbumInfo[] = await media.getAlbums(context);
      LogicTestLog.number(name, "Failure still returns all album descriptors", 4, failed.length);
      expect(failed.length).assertEqual(4);
      LogicTestLog.value(name, "Failure album order", "Documents|Pictures|Videos|Audios",
        failed.map((item: AlbumInfo) => item.albumName).join("|"));
      expect(failed.map((item: AlbumInfo) => item.albumName).join("|")).assertEqual("Documents|Pictures|Videos|Audios");
      LogicTestLog.number(name, "Failure Documents count", 0, failed[0].count);
      expect(failed[0].count).assertEqual(0);
      LogicTestLog.number(name, "Failure Pictures count", 1, failed[1].count);
      expect(failed[1].count).assertEqual(1);
      LogicTestLog.number(name, "Failure Videos count", 1, failed[2].count);
      expect(failed[2].count).assertEqual(1);
      LogicTestLog.number(name, "Failure Audios count", 1, failed[3].count);
      expect(failed[3].count).assertEqual(1);
      LogicTestLog.number(name, "First acquired fetch is closed on failure", 1, firstFetch.closeCalls);
      expect(firstFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Second acquired fetch is closed on failure", 1, secondFetch.closeCalls);
      expect(secondFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Both fetch object reads attempted", 2, firstFetch.allCalls + secondFetch.allCalls);
      expect(firstFetch.allCalls + secondFetch.allCalls).assertEqual(2);
      LogicTestLog.number(name, "Failure does not open files", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      files.listError = '';
      files.statError = '';
      firstFetch.allError = '';
      secondFetch.allError = '';
      firstFetch.closeError = '';
      secondFetch.closeError = '';
      library.resultIndex = 0;
      const recovered: AlbumInfo[] = await media.getAlbums(context);
      LogicTestLog.value(name, "Recovered album counts", "1|1|1|1",
        recovered.map((item: AlbumInfo) => String(item.count)).join("|"));
      expect(recovered.map((item: AlbumInfo) => String(item.count)).join("|")).assertEqual("1|1|1|1");
      LogicTestLog.value(name, "Recovered album types", "4|1|2|3",
        recovered.map((item: AlbumInfo) => String(item.mediaType)).join("|"));
      expect(recovered.map((item: AlbumInfo) => String(item.mediaType)).join("|")).assertEqual("4|1|2|3");
      LogicTestLog.number(name, "First fetch closed on every invocation", 2, firstFetch.closeCalls);
      expect(firstFetch.closeCalls).assertEqual(2);
      LogicTestLog.number(name, "Second fetch closed on every invocation", 2, secondFetch.closeCalls);
      expect(secondFetch.closeCalls).assertEqual(2);
      LogicTestLog.number(name, "Separate media fetches per album call", 4, library.fetches.length);
      expect(library.fetches.length).assertEqual(4);
      LogicTestLog.number(name, "Separate audio and documents lists per call", 4, files.lists.length);
      expect(files.lists.length).assertEqual(4);
      LogicTestLog.number(name, "No native creation from album recovery", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No native deletion from album recovery", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      LogicTestLog.value(name, "Album recovery leaves source directory intact",
        "document.txt|tone.mp3|ignored.bin", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("document.txt|tone.mp3|ignored.bin");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1219
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1219
     * @tc.nameDesc Album failures preserve independent categories and cleanup: Verify concurrent album tasks return
     * usable independent counts and retry all categories after recovery.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1219", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1219";
      LogicTestLog.begin(name, "album injected failure=close");
      files.names = ['document.txt', 'tone.mp3', 'ignored.bin'];
      files.mtimes.set('/synthetic/media/alpha/document.txt', 55);
      const image: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/album-recovery-image-3", photoAccessHelper.PhotoType.IMAGE, 'recovery.jpg');
      const video: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/album-recovery-video-3", photoAccessHelper.PhotoType.VIDEO, 'recovery.mp4');
      const firstFetch: FakeMediaFetch = new FakeMediaFetch(trace, [image, video]);
      const secondFetch: FakeMediaFetch = new FakeMediaFetch(trace, [image, video]);
      library.results = [firstFetch, secondFetch];
      firstFetch.closeError = 'synthetic album fetch failure';
      secondFetch.closeError = 'synthetic album fetch failure';
      const failed: AlbumInfo[] = await media.getAlbums(context);
      LogicTestLog.number(name, "Failure still returns all album descriptors", 4, failed.length);
      expect(failed.length).assertEqual(4);
      LogicTestLog.value(name, "Failure album order", "Documents|Pictures|Videos|Audios",
        failed.map((item: AlbumInfo) => item.albumName).join("|"));
      expect(failed.map((item: AlbumInfo) => item.albumName).join("|")).assertEqual("Documents|Pictures|Videos|Audios");
      LogicTestLog.number(name, "Failure Documents count", 1, failed[0].count);
      expect(failed[0].count).assertEqual(1);
      LogicTestLog.number(name, "Failure Pictures count", 1, failed[1].count);
      expect(failed[1].count).assertEqual(1);
      LogicTestLog.number(name, "Failure Videos count", 1, failed[2].count);
      expect(failed[2].count).assertEqual(1);
      LogicTestLog.number(name, "Failure Audios count", 1, failed[3].count);
      expect(failed[3].count).assertEqual(1);
      LogicTestLog.number(name, "First acquired fetch is closed on failure", 1, firstFetch.closeCalls);
      expect(firstFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Second acquired fetch is closed on failure", 1, secondFetch.closeCalls);
      expect(secondFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Both fetch object reads attempted", 2, firstFetch.allCalls + secondFetch.allCalls);
      expect(firstFetch.allCalls + secondFetch.allCalls).assertEqual(2);
      LogicTestLog.number(name, "Failure does not open files", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      files.listError = '';
      files.statError = '';
      firstFetch.allError = '';
      secondFetch.allError = '';
      firstFetch.closeError = '';
      secondFetch.closeError = '';
      library.resultIndex = 0;
      const recovered: AlbumInfo[] = await media.getAlbums(context);
      LogicTestLog.value(name, "Recovered album counts", "1|1|1|1",
        recovered.map((item: AlbumInfo) => String(item.count)).join("|"));
      expect(recovered.map((item: AlbumInfo) => String(item.count)).join("|")).assertEqual("1|1|1|1");
      LogicTestLog.value(name, "Recovered album types", "4|1|2|3",
        recovered.map((item: AlbumInfo) => String(item.mediaType)).join("|"));
      expect(recovered.map((item: AlbumInfo) => String(item.mediaType)).join("|")).assertEqual("4|1|2|3");
      LogicTestLog.number(name, "First fetch closed on every invocation", 2, firstFetch.closeCalls);
      expect(firstFetch.closeCalls).assertEqual(2);
      LogicTestLog.number(name, "Second fetch closed on every invocation", 2, secondFetch.closeCalls);
      expect(secondFetch.closeCalls).assertEqual(2);
      LogicTestLog.number(name, "Separate media fetches per album call", 4, library.fetches.length);
      expect(library.fetches.length).assertEqual(4);
      LogicTestLog.number(name, "Separate audio and documents lists per call", 4, files.lists.length);
      expect(files.lists.length).assertEqual(4);
      LogicTestLog.number(name, "No native creation from album recovery", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No native deletion from album recovery", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      LogicTestLog.value(name, "Album recovery leaves source directory intact",
        "document.txt|tone.mp3|ignored.bin", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("document.txt|tone.mp3|ignored.bin");
      LogicTestLog.end(name);
    });
  });
}
