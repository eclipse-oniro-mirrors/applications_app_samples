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
import { photoAccessHelper } from '@kit.MediaLibraryKit';
import type common from '@ohos.app.ability.common';
import MediaUtils, { FileType } from '../../../main/ets/model/MediaUtils';
import type { MediaAssetHandle, MediaPhotoAsset, FileInfo, AlbumInfo } from '../../../main/ets/model/MediaUtils';
import { LogicTestLog } from '../utils/LogicTestLog';
import {
  MediaTrace, FakeMediaClock, FakeMediaFiles, FakeMediaPhoto, FakeMediaFetch, FakeMediaLibrary, mediaContext
} from '../utils/MediaFakes';

export default function MediaListingAlbumsLogic(): void {
  describe("MediaListingAlbumsLogic", () => {
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
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1048
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1048
     * @tc.nameDesc Sandbox listing preserves case sensitive suffix semantics: Verify stable order, type shaping, fresh
     * result arrays and no stat or native library work.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1048", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1048";
      LogicTestLog.begin(name, "FileType.AUDIO; names=alpha.txt,tone.mp3,poster.jpg,clip.mp4");
      files.names = ["alpha.txt","tone.mp3","poster.jpg","clip.mp4"];
      const handles: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.AUDIO);
      LogicTestLog.number(name, "Filtered asset count", 1, handles.length);
      expect(handles.length).assertEqual(1);
      LogicTestLog.value(name, "Filtered display names preserve order", "tone.mp3",
        handles.map((item: MediaAssetHandle) => item.displayName).join("|"));
      expect(handles.map((item: MediaAssetHandle) => item.displayName).join("|")).assertEqual("tone.mp3");
      LogicTestLog.value(name, "Filtered URIs", "/synthetic/media/alpha/tone.mp3",
        handles.map((item: MediaAssetHandle) => item.uri).join("|"));
      expect(handles.map((item: MediaAssetHandle) => item.uri).join("|")).assertEqual(
        "/synthetic/media/alpha/tone.mp3");
      LogicTestLog.value(name, "Filtered handle media types", "3",
        handles.map((item: MediaAssetHandle) => String(item.mediaType)).join("|"));
      expect(handles.map((item: MediaAssetHandle) => String(item.mediaType)).join("|")).assertEqual("3");
      LogicTestLog.value(name, "List path comes from constructor", "/synthetic/media/alpha", files.lists[0]);
      expect(files.lists[0]).assertEqual("/synthetic/media/alpha");
      LogicTestLog.number(name, "One list operation", 1, files.lists.length);
      expect(files.lists.length).assertEqual(1);
      LogicTestLog.number(name, "No stat for asset handles", 0, files.stats.length);
      expect(files.stats.length).assertEqual(0);
      LogicTestLog.number(name, "Listing does not open descriptors", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
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
      LogicTestLog.value(name, "Only directory listing occurs", "files.list", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.list");
      handles.splice(0, handles.length);
      const repeated: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.AUDIO);
      LogicTestLog.number(name, "Mutating result does not affect later listing", 1, repeated.length);
      expect(repeated.length).assertEqual(1);
      LogicTestLog.value(name, "Repeated independent display names", "tone.mp3",
        repeated.map((item: MediaAssetHandle) => item.displayName).join("|"));
      expect(repeated.map((item: MediaAssetHandle) => item.displayName).join("|")).assertEqual("tone.mp3");
      LogicTestLog.value(name, "Input directory names stay unchanged",
        "alpha.txt|tone.mp3|poster.jpg|clip.mp4", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("alpha.txt|tone.mp3|poster.jpg|clip.mp4");
      LogicTestLog.number(name, "Repeated listing uses second request", 2, files.lists.length);
      expect(files.lists.length).assertEqual(2);
      LogicTestLog.value(name, "Repeated list operation order", "files.list|files.list", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.list|files.list");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1049
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1049
     * @tc.nameDesc Sandbox listing preserves case sensitive suffix semantics: Verify stable order, type shaping, fresh
     * result arrays and no stat or native library work.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1049", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1049";
      LogicTestLog.begin(name, "FileType.FILE; names=UPPER.MP3,UPPER.TXT,lower.mp3,lower.txt");
      files.names = ["UPPER.MP3","UPPER.TXT","lower.mp3","lower.txt"];
      const handles: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.FILE);
      LogicTestLog.number(name, "Filtered asset count", 1, handles.length);
      expect(handles.length).assertEqual(1);
      LogicTestLog.value(name, "Filtered display names preserve order", "lower.txt",
        handles.map((item: MediaAssetHandle) => item.displayName).join("|"));
      expect(handles.map((item: MediaAssetHandle) => item.displayName).join("|")).assertEqual("lower.txt");
      LogicTestLog.value(name, "Filtered URIs", "/synthetic/media/alpha/lower.txt",
        handles.map((item: MediaAssetHandle) => item.uri).join("|"));
      expect(handles.map((item: MediaAssetHandle) => item.uri).join("|")).assertEqual(
        "/synthetic/media/alpha/lower.txt");
      LogicTestLog.value(name, "Filtered handle media types", "4",
        handles.map((item: MediaAssetHandle) => String(item.mediaType)).join("|"));
      expect(handles.map((item: MediaAssetHandle) => String(item.mediaType)).join("|")).assertEqual("4");
      LogicTestLog.value(name, "List path comes from constructor", "/synthetic/media/alpha", files.lists[0]);
      expect(files.lists[0]).assertEqual("/synthetic/media/alpha");
      LogicTestLog.number(name, "One list operation", 1, files.lists.length);
      expect(files.lists.length).assertEqual(1);
      LogicTestLog.number(name, "No stat for asset handles", 0, files.stats.length);
      expect(files.stats.length).assertEqual(0);
      LogicTestLog.number(name, "Listing does not open descriptors", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
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
      LogicTestLog.value(name, "Only directory listing occurs", "files.list", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.list");
      handles.splice(0, handles.length);
      const repeated: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.FILE);
      LogicTestLog.number(name, "Mutating result does not affect later listing", 1, repeated.length);
      expect(repeated.length).assertEqual(1);
      LogicTestLog.value(name, "Repeated independent display names", "lower.txt",
        repeated.map((item: MediaAssetHandle) => item.displayName).join("|"));
      expect(repeated.map((item: MediaAssetHandle) => item.displayName).join("|")).assertEqual("lower.txt");
      LogicTestLog.value(name, "Input directory names stay unchanged",
        "UPPER.MP3|UPPER.TXT|lower.mp3|lower.txt", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("UPPER.MP3|UPPER.TXT|lower.mp3|lower.txt");
      LogicTestLog.number(name, "Repeated listing uses second request", 2, files.lists.length);
      expect(files.lists.length).assertEqual(2);
      LogicTestLog.value(name, "Repeated list operation order", "files.list|files.list", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.list|files.list");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1050
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1050
     * @tc.nameDesc Sandbox listing preserves case sensitive suffix semantics: Verify stable order, type shaping, fresh
     * result arrays and no stat or native library work.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1050", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1050";
      LogicTestLog.begin(name, "FileType.AUDIO; names=.mp3,.txt,tail.mp3.bak,tail.txt.old");
      files.names = [".mp3",".txt","tail.mp3.bak","tail.txt.old"];
      const handles: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.AUDIO);
      LogicTestLog.number(name, "Filtered asset count", 1, handles.length);
      expect(handles.length).assertEqual(1);
      LogicTestLog.value(name, "Filtered display names preserve order", ".mp3",
        handles.map((item: MediaAssetHandle) => item.displayName).join("|"));
      expect(handles.map((item: MediaAssetHandle) => item.displayName).join("|")).assertEqual(".mp3");
      LogicTestLog.value(name, "Filtered URIs", "/synthetic/media/alpha/.mp3",
        handles.map((item: MediaAssetHandle) => item.uri).join("|"));
      expect(handles.map((item: MediaAssetHandle) => item.uri).join("|")).assertEqual("/synthetic/media/alpha/.mp3");
      LogicTestLog.value(name, "Filtered handle media types", "3",
        handles.map((item: MediaAssetHandle) => String(item.mediaType)).join("|"));
      expect(handles.map((item: MediaAssetHandle) => String(item.mediaType)).join("|")).assertEqual("3");
      LogicTestLog.value(name, "List path comes from constructor", "/synthetic/media/alpha", files.lists[0]);
      expect(files.lists[0]).assertEqual("/synthetic/media/alpha");
      LogicTestLog.number(name, "One list operation", 1, files.lists.length);
      expect(files.lists.length).assertEqual(1);
      LogicTestLog.number(name, "No stat for asset handles", 0, files.stats.length);