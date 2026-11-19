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
      LogicTestLog.value(name, "Repeated independent display names", ".mp3",
        repeated.map((item: MediaAssetHandle) => item.displayName).join("|"));
      expect(repeated.map((item: MediaAssetHandle) => item.displayName).join("|")).assertEqual(".mp3");
      LogicTestLog.value(name, "Input directory names stay unchanged", ".mp3|.txt|tail.mp3.bak|tail.txt.old",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual(".mp3|.txt|tail.mp3.bak|tail.txt.old");
      LogicTestLog.number(name, "Repeated listing uses second request", 2, files.lists.length);
      expect(files.lists.length).assertEqual(2);
      LogicTestLog.value(name, "Repeated list operation order", "files.list|files.list", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.list|files.list");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1051
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1051
     * @tc.nameDesc Sandbox listing preserves case sensitive suffix semantics: Verify stable order, type shaping, fresh
     * result arrays and no stat or native library work.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1051", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1051";
      LogicTestLog.begin(name, "FileType.FILE; names=report.v2.txt,mix.v3.mp3,a.txt.mp3,b.mp3.txt");
      files.names = ["report.v2.txt","mix.v3.mp3","a.txt.mp3","b.mp3.txt"];
      const handles: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.FILE);
      LogicTestLog.number(name, "Filtered asset count", 2, handles.length);
      expect(handles.length).assertEqual(2);
      LogicTestLog.value(name, "Filtered display names preserve order", "report.v2.txt|b.mp3.txt",
        handles.map((item: MediaAssetHandle) => item.displayName).join("|"));
      expect(handles.map((item: MediaAssetHandle) => item.displayName).join("|")).assertEqual(
        "report.v2.txt|b.mp3.txt");
      LogicTestLog.value(name, "Filtered URIs",
        "/synthetic/media/alpha/report.v2.txt|/synthetic/media/alpha/b.mp3.txt",
        handles.map((item: MediaAssetHandle) => item.uri).join("|"));
      expect(handles.map((item: MediaAssetHandle) => item.uri).join("|")).assertEqual(
        "/synthetic/media/alpha/report.v2.txt|/synthetic/media/alpha/b.mp3.txt");
      LogicTestLog.value(name, "Filtered handle media types", "4|4",
        handles.map((item: MediaAssetHandle) => String(item.mediaType)).join("|"));
      expect(handles.map((item: MediaAssetHandle) => String(item.mediaType)).join("|")).assertEqual("4|4");
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
      LogicTestLog.number(name, "Mutating result does not affect later listing", 2, repeated.length);
      expect(repeated.length).assertEqual(2);
      LogicTestLog.value(name, "Repeated independent display names", "report.v2.txt|b.mp3.txt",
        repeated.map((item: MediaAssetHandle) => item.displayName).join("|"));
      expect(repeated.map((item: MediaAssetHandle) => item.displayName).join("|")).assertEqual(
        "report.v2.txt|b.mp3.txt");
      LogicTestLog.value(name, "Input directory names stay unchanged",
        "report.v2.txt|mix.v3.mp3|a.txt.mp3|b.mp3.txt", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("report.v2.txt|mix.v3.mp3|a.txt.mp3|b.mp3.txt");
      LogicTestLog.number(name, "Repeated listing uses second request", 2, files.lists.length);
      expect(files.lists.length).assertEqual(2);
      LogicTestLog.value(name, "Repeated list operation order", "files.list|files.list", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.list|files.list");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1052
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1052
     * @tc.nameDesc Sandbox listing preserves case sensitive suffix semantics: Verify stable order, type shaping, fresh
     * result arrays and no stat or native library work.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1052", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1052";
      LogicTestLog.begin(name, "FileType.AUDIO; names=empty,,trailing.mp3 ,trailing.txt ");
      files.names = ["empty","","trailing.mp3 ","trailing.txt "];
      const handles: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.AUDIO);
      LogicTestLog.number(name, "Filtered asset count", 0, handles.length);
      expect(handles.length).assertEqual(0);
      LogicTestLog.value(name, "Filtered display names preserve order", "",
        handles.map((item: MediaAssetHandle) => item.displayName).join("|"));
      expect(handles.map((item: MediaAssetHandle) => item.displayName).join("|")).assertEqual("");
      LogicTestLog.value(name, "Filtered URIs", "", handles.map((item: MediaAssetHandle) => item.uri).join("|"));
      expect(handles.map((item: MediaAssetHandle) => item.uri).join("|")).assertEqual("");
      LogicTestLog.value(name, "Filtered handle media types", "",
        handles.map((item: MediaAssetHandle) => String(item.mediaType)).join("|"));
      expect(handles.map((item: MediaAssetHandle) => String(item.mediaType)).join("|")).assertEqual("");
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
      LogicTestLog.number(name, "Mutating result does not affect later listing", 0, repeated.length);
      expect(repeated.length).assertEqual(0);
      LogicTestLog.value(name, "Repeated independent display names", "",
        repeated.map((item: MediaAssetHandle) => item.displayName).join("|"));
      expect(repeated.map((item: MediaAssetHandle) => item.displayName).join("|")).assertEqual("");
      LogicTestLog.value(name, "Input directory names stay unchanged", "empty||trailing.mp3 |trailing.txt ",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("empty||trailing.mp3 |trailing.txt ");
      LogicTestLog.number(name, "Repeated listing uses second request", 2, files.lists.length);
      expect(files.lists.length).assertEqual(2);
      LogicTestLog.value(name, "Repeated list operation order", "files.list|files.list", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.list|files.list");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1053
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1053
     * @tc.nameDesc Sandbox listing preserves case sensitive suffix semantics: Verify stable order, type shaping, fresh
     * result arrays and no stat or native library work.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1053", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1053";
      LogicTestLog.begin(name, "FileType.FILE; names=z.txt,a.mp3,a.txt,z.mp3");
      files.names = ["z.txt","a.mp3","a.txt","z.mp3"];
      const handles: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.FILE);
      LogicTestLog.number(name, "Filtered asset count", 2, handles.length);
      expect(handles.length).assertEqual(2);
      LogicTestLog.value(name, "Filtered display names preserve order", "z.txt|a.txt",
        handles.map((item: MediaAssetHandle) => item.displayName).join("|"));
      expect(handles.map((item: MediaAssetHandle) => item.displayName).join("|")).assertEqual("z.txt|a.txt");
      LogicTestLog.value(name, "Filtered URIs", "/synthetic/media/alpha/z.txt|/synthetic/media/alpha/a.txt",
        handles.map((item: MediaAssetHandle) => item.uri).join("|"));
      expect(handles.map((item: MediaAssetHandle) => item.uri).join("|")).assertEqual(
        "/synthetic/media/alpha/z.txt|/synthetic/media/alpha/a.txt");
      LogicTestLog.value(name, "Filtered handle media types", "4|4",
        handles.map((item: MediaAssetHandle) => String(item.mediaType)).join("|"));
      expect(handles.map((item: MediaAssetHandle) => String(item.mediaType)).join("|")).assertEqual("4|4");
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
      LogicTestLog.number(name, "Mutating result does not affect later listing", 2, repeated.length);
      expect(repeated.length).assertEqual(2);
      LogicTestLog.value(name, "Repeated independent display names", "z.txt|a.txt",
        repeated.map((item: MediaAssetHandle) => item.displayName).join("|"));
      expect(repeated.map((item: MediaAssetHandle) => item.displayName).join("|")).assertEqual("z.txt|a.txt");
      LogicTestLog.value(name, "Input directory names stay unchanged", "z.txt|a.mp3|a.txt|z.mp3",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("z.txt|a.mp3|a.txt|z.mp3");
      LogicTestLog.number(name, "Repeated listing uses second request", 2, files.lists.length);
      expect(files.lists.length).assertEqual(2);
      LogicTestLog.value(name, "Repeated list operation order", "files.list|files.list", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.list|files.list");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1054
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1054
     * @tc.nameDesc Sandbox listing preserves case sensitive suffix semantics: Verify stable order, type shaping, fresh
     * result arrays and no stat or native library work.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1054", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1054";
      LogicTestLog.begin(name, "FileType.AUDIO; names=synthetic note.txt,synthetic tone.mp3,README");
      files.names = ["synthetic note.txt","synthetic tone.mp3","README"];
      const handles: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.AUDIO);
      LogicTestLog.number(name, "Filtered asset count", 1, handles.length);
      expect(handles.length).assertEqual(1);
      LogicTestLog.value(name, "Filtered display names preserve order", "synthetic tone.mp3",
        handles.map((item: MediaAssetHandle) => item.displayName).join("|"));
      expect(handles.map((item: MediaAssetHandle) => item.displayName).join("|")).assertEqual("synthetic tone.mp3");
      LogicTestLog.value(name, "Filtered URIs", "/synthetic/media/alpha/synthetic tone.mp3",
        handles.map((item: MediaAssetHandle) => item.uri).join("|"));
      expect(handles.map((item: MediaAssetHandle) => item.uri).join("|")).assertEqual(
        "/synthetic/media/alpha/synthetic tone.mp3");
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
      LogicTestLog.value(name, "Repeated independent display names", "synthetic tone.mp3",
        repeated.map((item: MediaAssetHandle) => item.displayName).join("|"));
      expect(repeated.map((item: MediaAssetHandle) => item.displayName).join("|")).assertEqual("synthetic tone.mp3");
      LogicTestLog.value(name, "Input directory names stay unchanged",
        "synthetic note.txt|synthetic tone.mp3|README", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("synthetic note.txt|synthetic tone.mp3|README");
      LogicTestLog.number(name, "Repeated listing uses second request", 2, files.lists.length);
      expect(files.lists.length).assertEqual(2);
      LogicTestLog.value(name, "Repeated list operation order", "files.list|files.list", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.list|files.list");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1055
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1055
     * @tc.nameDesc Sandbox listing preserves case sensitive suffix semantics: Verify stable order, type shaping, fresh
     * result arrays and no stat or native library work.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1055", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1055";
      LogicTestLog.begin(name, "FileType.FILE; names=one.txt,one.txt,two.mp3,two.mp3");
      files.names = ["one.txt","one.txt","two.mp3","two.mp3"];
      const handles: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.FILE);
      LogicTestLog.number(name, "Filtered asset count", 2, handles.length);
      expect(handles.length).assertEqual(2);
      LogicTestLog.value(name, "Filtered display names preserve order", "one.txt|one.txt",
        handles.map((item: MediaAssetHandle) => item.displayName).join("|"));
      expect(handles.map((item: MediaAssetHandle) => item.displayName).join("|")).assertEqual("one.txt|one.txt");
      LogicTestLog.value(name, "Filtered URIs",
        "/synthetic/media/alpha/one.txt|/synthetic/media/alpha/one.txt",
        handles.map((item: MediaAssetHandle) => item.uri).join("|"));
      expect(handles.map((item: MediaAssetHandle) => item.uri).join("|")).assertEqual(
        "/synthetic/media/alpha/one.txt|/synthetic/media/alpha/one.txt");
      LogicTestLog.value(name, "Filtered handle media types", "4|4",
        handles.map((item: MediaAssetHandle) => String(item.mediaType)).join("|"));
      expect(handles.map((item: MediaAssetHandle) => String(item.mediaType)).join("|")).assertEqual("4|4");
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
      LogicTestLog.number(name, "Mutating result does not affect later listing", 2, repeated.length);
      expect(repeated.length).assertEqual(2);
      LogicTestLog.value(name, "Repeated independent display names", "one.txt|one.txt",
        repeated.map((item: MediaAssetHandle) => item.displayName).join("|"));
      expect(repeated.map((item: MediaAssetHandle) => item.displayName).join("|")).assertEqual("one.txt|one.txt");
      LogicTestLog.value(name, "Input directory names stay unchanged", "one.txt|one.txt|two.mp3|two.mp3",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("one.txt|one.txt|two.mp3|two.mp3");
      LogicTestLog.number(name, "Repeated listing uses second request", 2, files.lists.length);
      expect(files.lists.length).assertEqual(2);
      LogicTestLog.value(name, "Repeated list operation order", "files.list|files.list", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.list|files.list");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1056
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1056
     * @tc.nameDesc Sandbox listing preserves case sensitive suffix semantics: Verify stable order, type shaping, fresh
     * result arrays and no stat or native library work.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1056", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1056";
      LogicTestLog.begin(name, "FileType.AUDIO; names=txt,mp3,suffix.txtx,suffix.mp33");
      files.names = ["txt","mp3","suffix.txtx","suffix.mp33"];
      const handles: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.AUDIO);
      LogicTestLog.number(name, "Filtered asset count", 0, handles.length);
      expect(handles.length).assertEqual(0);
      LogicTestLog.value(name, "Filtered display names preserve order", "",
        handles.map((item: MediaAssetHandle) => item.displayName).join("|"));
      expect(handles.map((item: MediaAssetHandle) => item.displayName).join("|")).assertEqual("");
      LogicTestLog.value(name, "Filtered URIs", "", handles.map((item: MediaAssetHandle) => item.uri).join("|"));
      expect(handles.map((item: MediaAssetHandle) => item.uri).join("|")).assertEqual("");
      LogicTestLog.value(name, "Filtered handle media types", "",
        handles.map((item: MediaAssetHandle) => String(item.mediaType)).join("|"));
      expect(handles.map((item: MediaAssetHandle) => String(item.mediaType)).join("|")).assertEqual("");
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
      LogicTestLog.number(name, "Mutating result does not affect later listing", 0, repeated.length);
      expect(repeated.length).assertEqual(0);
      LogicTestLog.value(name, "Repeated independent display names", "",
        repeated.map((item: MediaAssetHandle) => item.displayName).join("|"));
      expect(repeated.map((item: MediaAssetHandle) => item.displayName).join("|")).assertEqual("");
      LogicTestLog.value(name, "Input directory names stay unchanged", "txt|mp3|suffix.txtx|suffix.mp33",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("txt|mp3|suffix.txtx|suffix.mp33");
      LogicTestLog.number(name, "Repeated listing uses second request", 2, files.lists.length);
      expect(files.lists.length).assertEqual(2);
      LogicTestLog.value(name, "Repeated list operation order", "files.list|files.list", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.list|files.list");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1057
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1057
     * @tc.nameDesc Sandbox listing preserves case sensitive suffix semantics: Verify stable order, type shaping, fresh
     * result arrays and no stat or native library work.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1057", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1057";
      LogicTestLog.begin(name, "FileType.FILE; names=");
      files.names = [];
      const handles: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.FILE);
      LogicTestLog.number(name, "Filtered asset count", 0, handles.length);
      expect(handles.length).assertEqual(0);
      LogicTestLog.value(name, "Filtered display names preserve order", "",
        handles.map((item: MediaAssetHandle) => item.displayName).join("|"));
      expect(handles.map((item: MediaAssetHandle) => item.displayName).join("|")).assertEqual("");
      LogicTestLog.value(name, "Filtered URIs", "", handles.map((item: MediaAssetHandle) => item.uri).join("|"));
      expect(handles.map((item: MediaAssetHandle) => item.uri).join("|")).assertEqual("");
      LogicTestLog.value(name, "Filtered handle media types", "",
        handles.map((item: MediaAssetHandle) => String(item.mediaType)).join("|"));
      expect(handles.map((item: MediaAssetHandle) => String(item.mediaType)).join("|")).assertEqual("");
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
      LogicTestLog.number(name, "Mutating result does not affect later listing", 0, repeated.length);
      expect(repeated.length).assertEqual(0);
      LogicTestLog.value(name, "Repeated independent display names", "",
        repeated.map((item: MediaAssetHandle) => item.displayName).join("|"));
      expect(repeated.map((item: MediaAssetHandle) => item.displayName).join("|")).assertEqual("");
      LogicTestLog.value(name, "Input directory names stay unchanged", "", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("");
      LogicTestLog.number(name, "Repeated listing uses second request", 2, files.lists.length);
      expect(files.lists.length).assertEqual(2);
      LogicTestLog.value(name, "Repeated list operation order", "files.list|files.list", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.list|files.list");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1058
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1058
     * @tc.nameDesc FileInfo listing is typed and optionally suffix filtered: Verify default unfiltered behavior,
     * explicit suffix filtering before stat and snapshot path isolation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1058", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1058";
      LogicTestLog.begin(name, "optional type undefined; synthetic names note.txt,tone.mp3,p" +
        "hoto.jpg,clip.mp4,UPPER.TXT,raw");
      files.names = ["note.txt","tone.mp3","photo.jpg","clip.mp4","UPPER.TXT","raw"];
      files.mtimes.set("/synthetic/media/alpha/note.txt", 11);
      files.mtimes.set("/synthetic/media/alpha/tone.mp3", 22);
      files.mtimes.set("/synthetic/media/alpha/photo.jpg", 33);
      files.mtimes.set("/synthetic/media/alpha/clip.mp4", 44);
      files.mtimes.set("/synthetic/media/alpha/UPPER.TXT", 55);
      files.mtimes.set("/synthetic/media/alpha/raw", 66);
      const alternate: common.UIAbilityContext = mediaContext('/synthetic/media/unused');
      const infos: FileInfo[] = await media.getFileAssets(alternate, undefined);
      LogicTestLog.number(name, "FileInfo count", 6, infos.length);
      expect(infos.length).assertEqual(6);
      LogicTestLog.value(name, "FileInfo names in input order",
        "note.txt|tone.mp3|photo.jpg|clip.mp4|UPPER.TXT|raw", infos.map((item: FileInfo) => item.fileName).join("|"));
      expect(infos.map((item: FileInfo) => item.fileName).join("|")).assertEqual(
        "note.txt|tone.mp3|photo.jpg|clip.mp4|UPPER.TXT|raw");
      LogicTestLog.value(name, "FileInfo URI paths", "/synthetic/media/alpha/note.txt|/synthetic/media/alpha/tone." +
        "mp3|/synthetic/media/alpha/photo.jpg|/synthetic/media/alpha/" +
        "clip.mp4|/synthetic/media/alpha/UPPER.TXT|/synthetic/media/a" +
        "lpha/raw", infos.map((item: FileInfo) => item.uri).join("|"));
      expect(infos.map((item: FileInfo) => item.uri).join("|")).assertEqual(
        "/synthetic/media/alpha/note.txt|/synthetic/media/alpha/tone." +
        "mp3|/synthetic/media/alpha/photo.jpg|/synthetic/media/alpha/" +
        "clip.mp4|/synthetic/media/alpha/UPPER.TXT|/synthetic/media/a" +
        "lpha/raw");
      LogicTestLog.value(name, "FileInfo mtimes preserve numeric values", "11|22|33|44|55|66",
        infos.map((item: FileInfo) => String(item.mtime)).join("|"));
      expect(infos.map((item: FileInfo) => String(item.mtime)).join("|")).assertEqual("11|22|33|44|55|66");
      LogicTestLog.number(name, "Only selected files are statted", 6, files.stats.length);
      expect(files.stats.length).assertEqual(6);
      LogicTestLog.value(name, "Stat paths match selected files",
        "/synthetic/media/alpha/note.txt|/synthetic/media/alpha/tone." +
        "mp3|/synthetic/media/alpha/photo.jpg|/synthetic/media/alpha/" +
        "clip.mp4|/synthetic/media/alpha/UPPER.TXT|/synthetic/media/a" +
        "lpha/raw", files.stats.join("|"));
      expect(files.stats.join("|")).assertEqual("/synthetic/media/alpha/note.txt|/synthetic/media/alpha/tone." +
        "mp3|/synthetic/media/alpha/photo.jpg|/synthetic/media/alpha/" +
        "clip.mp4|/synthetic/media/alpha/UPPER.TXT|/synthetic/media/a" +
        "lpha/raw");
      LogicTestLog.value(name, "Argument context does not override constructor path",
        "/synthetic/media/alpha", files.lists[0]);
      expect(files.lists[0]).assertEqual("/synthetic/media/alpha");
      LogicTestLog.number(name, "One list request", 1, files.lists.length);
      expect(files.lists.length).assertEqual(1);
      LogicTestLog.number(name, "No descriptor open", 0, files.opens.length);
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
      LogicTestLog.value(name, "Filter precedes stat", "files.list|files.stat|files.stat|files.stat|files.stat|files" +
        ".stat|files.stat", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.list|files.stat|files.stat|files.stat|files.stat|files" +
        ".stat|files.stat");
      infos.splice(0, infos.length);
      const again: FileInfo[] = await media.getFileAssets(context, undefined);
      LogicTestLog.number(name, "Result mutation cannot change listing", 6, again.length);
      expect(again.length).assertEqual(6);
      LogicTestLog.value(name, "Independent repeated names",
        "note.txt|tone.mp3|photo.jpg|clip.mp4|UPPER.TXT|raw", again.map((item: FileInfo) => item.fileName).join("|"));
      expect(again.map((item: FileInfo) => item.fileName).join("|")).assertEqual(
        "note.txt|tone.mp3|photo.jpg|clip.mp4|UPPER.TXT|raw");
      LogicTestLog.number(name, "Repeated selected stat count", 12, files.stats.length);
      expect(files.stats.length).assertEqual(12);
      LogicTestLog.value(name, "Directory contents remain intact",
        "note.txt|tone.mp3|photo.jpg|clip.mp4|UPPER.TXT|raw", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("note.txt|tone.mp3|photo.jpg|clip.mp4|UPPER.TXT|raw");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1059
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1059
     * @tc.nameDesc FileInfo listing is typed and optionally suffix filtered: Verify default unfiltered behavior,
     * explicit suffix filtering before stat and snapshot path isolation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1059", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1059";
      LogicTestLog.begin(name, "optional type FileType.IMAGE; synthetic names note.txt,tone." +
        "mp3,photo.jpg,clip.mp4,UPPER.TXT,raw");
      files.names = ["note.txt","tone.mp3","photo.jpg","clip.mp4","UPPER.TXT","raw"];
      files.mtimes.set("/synthetic/media/alpha/note.txt", 11);
      files.mtimes.set("/synthetic/media/alpha/tone.mp3", 22);
      files.mtimes.set("/synthetic/media/alpha/photo.jpg", 33);
      files.mtimes.set("/synthetic/media/alpha/clip.mp4", 44);
      files.mtimes.set("/synthetic/media/alpha/UPPER.TXT", 55);
      files.mtimes.set("/synthetic/media/alpha/raw", 66);
      const alternate: common.UIAbilityContext = mediaContext('/synthetic/media/unused');
      const infos: FileInfo[] = await media.getFileAssets(alternate, FileType.IMAGE);
      LogicTestLog.number(name, "FileInfo count", 1, infos.length);
      expect(infos.length).assertEqual(1);
      LogicTestLog.value(name, "FileInfo names in input order", "photo.jpg",
        infos.map((item: FileInfo) => item.fileName).join("|"));
      expect(infos.map((item: FileInfo) => item.fileName).join("|")).assertEqual("photo.jpg");
      LogicTestLog.value(name, "FileInfo URI paths", "/synthetic/media/alpha/photo.jpg",
        infos.map((item: FileInfo) => item.uri).join("|"));
      expect(infos.map((item: FileInfo) => item.uri).join("|")).assertEqual("/synthetic/media/alpha/photo.jpg");
      LogicTestLog.value(name, "FileInfo mtimes preserve numeric values", "33",
        infos.map((item: FileInfo) => String(item.mtime)).join("|"));
      expect(infos.map((item: FileInfo) => String(item.mtime)).join("|")).assertEqual("33");
      LogicTestLog.number(name, "Only selected files are statted", 1, files.stats.length);
      expect(files.stats.length).assertEqual(1);
      LogicTestLog.value(name, "Stat paths match selected files", "/synthetic/media/alpha/photo.jpg",
        files.stats.join("|"));
      expect(files.stats.join("|")).assertEqual("/synthetic/media/alpha/photo.jpg");
      LogicTestLog.value(name, "Argument context does not override constructor path",
        "/synthetic/media/alpha", files.lists[0]);
      expect(files.lists[0]).assertEqual("/synthetic/media/alpha");
      LogicTestLog.number(name, "One list request", 1, files.lists.length);
      expect(files.lists.length).assertEqual(1);
      LogicTestLog.number(name, "No descriptor open", 0, files.opens.length);
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
      LogicTestLog.value(name, "Filter precedes stat", "files.list|files.stat", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.list|files.stat");
      infos.splice(0, infos.length);
      const again: FileInfo[] = await media.getFileAssets(context, FileType.IMAGE);
      LogicTestLog.number(name, "Result mutation cannot change listing", 1, again.length);
      expect(again.length).assertEqual(1);
      LogicTestLog.value(name, "Independent repeated names", "photo.jpg",
        again.map((item: FileInfo) => item.fileName).join("|"));
      expect(again.map((item: FileInfo) => item.fileName).join("|")).assertEqual("photo.jpg");
      LogicTestLog.number(name, "Repeated selected stat count", 2, files.stats.length);
      expect(files.stats.length).assertEqual(2);
      LogicTestLog.value(name, "Directory contents remain intact",
        "note.txt|tone.mp3|photo.jpg|clip.mp4|UPPER.TXT|raw", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("note.txt|tone.mp3|photo.jpg|clip.mp4|UPPER.TXT|raw");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1060
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1060
     * @tc.nameDesc FileInfo listing is typed and optionally suffix filtered: Verify default unfiltered behavior,
     * explicit suffix filtering before stat and snapshot path isolation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1060", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1060";
      LogicTestLog.begin(name, "optional type FileType.VIDEO; synthetic names note.txt,tone." +
        "mp3,photo.jpg,clip.mp4,UPPER.TXT,raw");
      files.names = ["note.txt","tone.mp3","photo.jpg","clip.mp4","UPPER.TXT","raw"];
      files.mtimes.set("/synthetic/media/alpha/note.txt", 11);
      files.mtimes.set("/synthetic/media/alpha/tone.mp3", 22);
      files.mtimes.set("/synthetic/media/alpha/photo.jpg", 33);
      files.mtimes.set("/synthetic/media/alpha/clip.mp4", 44);
      files.mtimes.set("/synthetic/media/alpha/UPPER.TXT", 55);
      files.mtimes.set("/synthetic/media/alpha/raw", 66);
      const alternate: common.UIAbilityContext = mediaContext('/synthetic/media/unused');
      const infos: FileInfo[] = await media.getFileAssets(alternate, FileType.VIDEO);
      LogicTestLog.number(name, "FileInfo count", 1, infos.length);
      expect(infos.length).assertEqual(1);
      LogicTestLog.value(name, "FileInfo names in input order", "clip.mp4",
        infos.map((item: FileInfo) => item.fileName).join("|"));
      expect(infos.map((item: FileInfo) => item.fileName).join("|")).assertEqual("clip.mp4");
      LogicTestLog.value(name, "FileInfo URI paths", "/synthetic/media/alpha/clip.mp4",
        infos.map((item: FileInfo) => item.uri).join("|"));
      expect(infos.map((item: FileInfo) => item.uri).join("|")).assertEqual("/synthetic/media/alpha/clip.mp4");
      LogicTestLog.value(name, "FileInfo mtimes preserve numeric values", "44",
        infos.map((item: FileInfo) => String(item.mtime)).join("|"));
      expect(infos.map((item: FileInfo) => String(item.mtime)).join("|")).assertEqual("44");
      LogicTestLog.number(name, "Only selected files are statted", 1, files.stats.length);
      expect(files.stats.length).assertEqual(1);
      LogicTestLog.value(name, "Stat paths match selected files", "/synthetic/media/alpha/clip.mp4",
        files.stats.join("|"));
      expect(files.stats.join("|")).assertEqual("/synthetic/media/alpha/clip.mp4");
      LogicTestLog.value(name, "Argument context does not override constructor path",
        "/synthetic/media/alpha", files.lists[0]);
      expect(files.lists[0]).assertEqual("/synthetic/media/alpha");
      LogicTestLog.number(name, "One list request", 1, files.lists.length);
      expect(files.lists.length).assertEqual(1);
      LogicTestLog.number(name, "No descriptor open", 0, files.opens.length);
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
      LogicTestLog.value(name, "Filter precedes stat", "files.list|files.stat", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.list|files.stat");
      infos.splice(0, infos.length);
      const again: FileInfo[] = await media.getFileAssets(context, FileType.VIDEO);
      LogicTestLog.number(name, "Result mutation cannot change listing", 1, again.length);
      expect(again.length).assertEqual(1);
      LogicTestLog.value(name, "Independent repeated names", "clip.mp4",
        again.map((item: FileInfo) => item.fileName).join("|"));
      expect(again.map((item: FileInfo) => item.fileName).join("|")).assertEqual("clip.mp4");
      LogicTestLog.number(name, "Repeated selected stat count", 2, files.stats.length);
      expect(files.stats.length).assertEqual(2);
      LogicTestLog.value(name, "Directory contents remain intact",
        "note.txt|tone.mp3|photo.jpg|clip.mp4|UPPER.TXT|raw", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("note.txt|tone.mp3|photo.jpg|clip.mp4|UPPER.TXT|raw");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1061
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1061
     * @tc.nameDesc FileInfo listing is typed and optionally suffix filtered: Verify default unfiltered behavior,
     * explicit suffix filtering before stat and snapshot path isolation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1061", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1061";
      LogicTestLog.begin(name, "optional type FileType.AUDIO; synthetic names note.txt,tone." +
        "mp3,photo.jpg,clip.mp4,UPPER.TXT,raw");
      files.names = ["note.txt","tone.mp3","photo.jpg","clip.mp4","UPPER.TXT","raw"];
      files.mtimes.set("/synthetic/media/alpha/note.txt", 11);
      files.mtimes.set("/synthetic/media/alpha/tone.mp3", 22);
      files.mtimes.set("/synthetic/media/alpha/photo.jpg", 33);
      files.mtimes.set("/synthetic/media/alpha/clip.mp4", 44);
      files.mtimes.set("/synthetic/media/alpha/UPPER.TXT", 55);
      files.mtimes.set("/synthetic/media/alpha/raw", 66);
      const alternate: common.UIAbilityContext = mediaContext('/synthetic/media/unused');
      const infos: FileInfo[] = await media.getFileAssets(alternate, FileType.AUDIO);
      LogicTestLog.number(name, "FileInfo count", 1, infos.length);
      expect(infos.length).assertEqual(1);
      LogicTestLog.value(name, "FileInfo names in input order", "tone.mp3",
        infos.map((item: FileInfo) => item.fileName).join("|"));
      expect(infos.map((item: FileInfo) => item.fileName).join("|")).assertEqual("tone.mp3");
      LogicTestLog.value(name, "FileInfo URI paths", "/synthetic/media/alpha/tone.mp3",
        infos.map((item: FileInfo) => item.uri).join("|"));
      expect(infos.map((item: FileInfo) => item.uri).join("|")).assertEqual("/synthetic/media/alpha/tone.mp3");
      LogicTestLog.value(name, "FileInfo mtimes preserve numeric values", "22",
        infos.map((item: FileInfo) => String(item.mtime)).join("|"));
      expect(infos.map((item: FileInfo) => String(item.mtime)).join("|")).assertEqual("22");
      LogicTestLog.number(name, "Only selected files are statted", 1, files.stats.length);
      expect(files.stats.length).assertEqual(1);
      LogicTestLog.value(name, "Stat paths match selected files", "/synthetic/media/alpha/tone.mp3",
        files.stats.join("|"));
      expect(files.stats.join("|")).assertEqual("/synthetic/media/alpha/tone.mp3");
      LogicTestLog.value(name, "Argument context does not override constructor path",
        "/synthetic/media/alpha", files.lists[0]);
      expect(files.lists[0]).assertEqual("/synthetic/media/alpha");
      LogicTestLog.number(name, "One list request", 1, files.lists.length);
      expect(files.lists.length).assertEqual(1);
      LogicTestLog.number(name, "No descriptor open", 0, files.opens.length);
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
      LogicTestLog.value(name, "Filter precedes stat", "files.list|files.stat", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.list|files.stat");
      infos.splice(0, infos.length);
      const again: FileInfo[] = await media.getFileAssets(context, FileType.AUDIO);
      LogicTestLog.number(name, "Result mutation cannot change listing", 1, again.length);
      expect(again.length).assertEqual(1);
      LogicTestLog.value(name, "Independent repeated names", "tone.mp3",
        again.map((item: FileInfo) => item.fileName).join("|"));
      expect(again.map((item: FileInfo) => item.fileName).join("|")).assertEqual("tone.mp3");
      LogicTestLog.number(name, "Repeated selected stat count", 2, files.stats.length);
      expect(files.stats.length).assertEqual(2);
      LogicTestLog.value(name, "Directory contents remain intact",
        "note.txt|tone.mp3|photo.jpg|clip.mp4|UPPER.TXT|raw", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("note.txt|tone.mp3|photo.jpg|clip.mp4|UPPER.TXT|raw");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1062
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1062
     * @tc.nameDesc FileInfo listing is typed and optionally suffix filtered: Verify default unfiltered behavior,
     * explicit suffix filtering before stat and snapshot path isolation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1062", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1062";
      LogicTestLog.begin(name, "optional type FileType.FILE; synthetic names note.txt,tone.m" +
        "p3,photo.jpg,clip.mp4,UPPER.TXT,raw");
      files.names = ["note.txt","tone.mp3","photo.jpg","clip.mp4","UPPER.TXT","raw"];
      files.mtimes.set("/synthetic/media/alpha/note.txt", 11);
      files.mtimes.set("/synthetic/media/alpha/tone.mp3", 22);
      files.mtimes.set("/synthetic/media/alpha/photo.jpg", 33);
      files.mtimes.set("/synthetic/media/alpha/clip.mp4", 44);
      files.mtimes.set("/synthetic/media/alpha/UPPER.TXT", 55);
      files.mtimes.set("/synthetic/media/alpha/raw", 66);
      const alternate: common.UIAbilityContext = mediaContext('/synthetic/media/unused');
      const infos: FileInfo[] = await media.getFileAssets(alternate, FileType.FILE);
      LogicTestLog.number(name, "FileInfo count", 1, infos.length);
      expect(infos.length).assertEqual(1);
      LogicTestLog.value(name, "FileInfo names in input order", "note.txt",
        infos.map((item: FileInfo) => item.fileName).join("|"));
      expect(infos.map((item: FileInfo) => item.fileName).join("|")).assertEqual("note.txt");
      LogicTestLog.value(name, "FileInfo URI paths", "/synthetic/media/alpha/note.txt",
        infos.map((item: FileInfo) => item.uri).join("|"));
      expect(infos.map((item: FileInfo) => item.uri).join("|")).assertEqual("/synthetic/media/alpha/note.txt");
      LogicTestLog.value(name, "FileInfo mtimes preserve numeric values", "11",
        infos.map((item: FileInfo) => String(item.mtime)).join("|"));
      expect(infos.map((item: FileInfo) => String(item.mtime)).join("|")).assertEqual("11");
      LogicTestLog.number(name, "Only selected files are statted", 1, files.stats.length);
      expect(files.stats.length).assertEqual(1);
      LogicTestLog.value(name, "Stat paths match selected files", "/synthetic/media/alpha/note.txt",
        files.stats.join("|"));
      expect(files.stats.join("|")).assertEqual("/synthetic/media/alpha/note.txt");
      LogicTestLog.value(name, "Argument context does not override constructor path",
        "/synthetic/media/alpha", files.lists[0]);
      expect(files.lists[0]).assertEqual("/synthetic/media/alpha");
      LogicTestLog.number(name, "One list request", 1, files.lists.length);
      expect(files.lists.length).assertEqual(1);
      LogicTestLog.number(name, "No descriptor open", 0, files.opens.length);
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
      LogicTestLog.value(name, "Filter precedes stat", "files.list|files.stat", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.list|files.stat");
      infos.splice(0, infos.length);
      const again: FileInfo[] = await media.getFileAssets(context, FileType.FILE);
      LogicTestLog.number(name, "Result mutation cannot change listing", 1, again.length);
      expect(again.length).assertEqual(1);
      LogicTestLog.value(name, "Independent repeated names", "note.txt",
        again.map((item: FileInfo) => item.fileName).join("|"));
      expect(again.map((item: FileInfo) => item.fileName).join("|")).assertEqual("note.txt");
      LogicTestLog.number(name, "Repeated selected stat count", 2, files.stats.length);
      expect(files.stats.length).assertEqual(2);
      LogicTestLog.value(name, "Directory contents remain intact",
        "note.txt|tone.mp3|photo.jpg|clip.mp4|UPPER.TXT|raw", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("note.txt|tone.mp3|photo.jpg|clip.mp4|UPPER.TXT|raw");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1063
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1063
     * @tc.nameDesc FileInfo listing is typed and optionally suffix filtered: Verify default unfiltered behavior,
     * explicit suffix filtering before stat and snapshot path isolation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1063", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1063";
      LogicTestLog.begin(name, "optional type 99; synthetic names note.txt,tone.mp3,photo.jpg,clip.mp4,UPPER.TXT,raw");
      files.names = ["note.txt","tone.mp3","photo.jpg","clip.mp4","UPPER.TXT","raw"];
      files.mtimes.set("/synthetic/media/alpha/note.txt", 11);
      files.mtimes.set("/synthetic/media/alpha/tone.mp3", 22);
      files.mtimes.set("/synthetic/media/alpha/photo.jpg", 33);
      files.mtimes.set("/synthetic/media/alpha/clip.mp4", 44);
      files.mtimes.set("/synthetic/media/alpha/UPPER.TXT", 55);
      files.mtimes.set("/synthetic/media/alpha/raw", 66);
      const alternate: common.UIAbilityContext = mediaContext('/synthetic/media/unused');
      const infos: FileInfo[] = await media.getFileAssets(alternate, 99);
      LogicTestLog.number(name, "FileInfo count", 1, infos.length);
      expect(infos.length).assertEqual(1);
      LogicTestLog.value(name, "FileInfo names in input order", "note.txt",
        infos.map((item: FileInfo) => item.fileName).join("|"));
      expect(infos.map((item: FileInfo) => item.fileName).join("|")).assertEqual("note.txt");
      LogicTestLog.value(name, "FileInfo URI paths", "/synthetic/media/alpha/note.txt",
        infos.map((item: FileInfo) => item.uri).join("|"));
      expect(infos.map((item: FileInfo) => item.uri).join("|")).assertEqual("/synthetic/media/alpha/note.txt");
      LogicTestLog.value(name, "FileInfo mtimes preserve numeric values", "11",
        infos.map((item: FileInfo) => String(item.mtime)).join("|"));
      expect(infos.map((item: FileInfo) => String(item.mtime)).join("|")).assertEqual("11");
      LogicTestLog.number(name, "Only selected files are statted", 1, files.stats.length);
      expect(files.stats.length).assertEqual(1);
      LogicTestLog.value(name, "Stat paths match selected files", "/synthetic/media/alpha/note.txt",
        files.stats.join("|"));
      expect(files.stats.join("|")).assertEqual("/synthetic/media/alpha/note.txt");
      LogicTestLog.value(name, "Argument context does not override constructor path",
        "/synthetic/media/alpha", files.lists[0]);
      expect(files.lists[0]).assertEqual("/synthetic/media/alpha");
      LogicTestLog.number(name, "One list request", 1, files.lists.length);
      expect(files.lists.length).assertEqual(1);
      LogicTestLog.number(name, "No descriptor open", 0, files.opens.length);
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
      LogicTestLog.value(name, "Filter precedes stat", "files.list|files.stat", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.list|files.stat");
      infos.splice(0, infos.length);
      const again: FileInfo[] = await media.getFileAssets(context, 99);
      LogicTestLog.number(name, "Result mutation cannot change listing", 1, again.length);
      expect(again.length).assertEqual(1);
      LogicTestLog.value(name, "Independent repeated names", "note.txt",
        again.map((item: FileInfo) => item.fileName).join("|"));
      expect(again.map((item: FileInfo) => item.fileName).join("|")).assertEqual("note.txt");
      LogicTestLog.number(name, "Repeated selected stat count", 2, files.stats.length);
      expect(files.stats.length).assertEqual(2);
      LogicTestLog.value(name, "Directory contents remain intact",
        "note.txt|tone.mp3|photo.jpg|clip.mp4|UPPER.TXT|raw", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("note.txt|tone.mp3|photo.jpg|clip.mp4|UPPER.TXT|raw");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1064
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1064
     * @tc.nameDesc FileInfo listing is typed and optionally suffix filtered: Verify default unfiltered behavior,
     * explicit suffix filtering before stat and snapshot path isolation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1064", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1064";
      LogicTestLog.begin(name, "optional type undefined; synthetic names b.txt,a.txt,.mp3,do" +
        "uble.mp4.jpg,.txt,x.txt.bak");
      files.names = ["b.txt","a.txt",".mp3","double.mp4.jpg",".txt","x.txt.bak"];
      files.mtimes.set("/synthetic/media/alpha/b.txt", 0);
      files.mtimes.set("/synthetic/media/alpha/a.txt", -1);
      files.mtimes.set("/synthetic/media/alpha/.mp3", 0.5);
      files.mtimes.set("/synthetic/media/alpha/double.mp4.jpg", 9007199254740991);
      files.mtimes.set("/synthetic/media/alpha/.txt", 99);
      files.mtimes.set("/synthetic/media/alpha/x.txt.bak", 123);
      const alternate: common.UIAbilityContext = mediaContext('/synthetic/media/unused');
      const infos: FileInfo[] = await media.getFileAssets(alternate, undefined);
      LogicTestLog.number(name, "FileInfo count", 6, infos.length);
      expect(infos.length).assertEqual(6);
      LogicTestLog.value(name, "FileInfo names in input order",
        "b.txt|a.txt|.mp3|double.mp4.jpg|.txt|x.txt.bak", infos.map((item: FileInfo) => item.fileName).join("|"));
      expect(infos.map((item: FileInfo) => item.fileName).join("|")).assertEqual(
        "b.txt|a.txt|.mp3|double.mp4.jpg|.txt|x.txt.bak");
      LogicTestLog.value(name, "FileInfo URI paths", "/synthetic/media/alpha/b.txt|/synthetic/media/alpha/a.txt|/s" +
        "ynthetic/media/alpha/.mp3|/synthetic/media/alpha/double.mp4." +
        "jpg|/synthetic/media/alpha/.txt|/synthetic/media/alpha/x.txt" +
        ".bak", infos.map((item: FileInfo) => item.uri).join("|"));
      expect(infos.map((item: FileInfo) => item.uri).join("|")).assertEqual(
        "/synthetic/media/alpha/b.txt|/synthetic/media/alpha/a.txt|/s" +
        "ynthetic/media/alpha/.mp3|/synthetic/media/alpha/double.mp4." +
        "jpg|/synthetic/media/alpha/.txt|/synthetic/media/alpha/x.txt" +
        ".bak");
      LogicTestLog.value(name, "FileInfo mtimes preserve numeric values", "0|-1|0.5|9007199254740991|99|123",
        infos.map((item: FileInfo) => String(item.mtime)).join("|"));
      expect(infos.map((item: FileInfo) => String(item.mtime)).join("|")).assertEqual(
        "0|-1|0.5|9007199254740991|99|123");
      LogicTestLog.number(name, "Only selected files are statted", 6, files.stats.length);
      expect(files.stats.length).assertEqual(6);
      LogicTestLog.value(name, "Stat paths match selected files",
        "/synthetic/media/alpha/b.txt|/synthetic/media/alpha/a.txt|/s" +
        "ynthetic/media/alpha/.mp3|/synthetic/media/alpha/double.mp4." +
        "jpg|/synthetic/media/alpha/.txt|/synthetic/media/alpha/x.txt" +
        ".bak", files.stats.join("|"));
      expect(files.stats.join("|")).assertEqual("/synthetic/media/alpha/b.txt|/synthetic/media/alpha/a.txt|/s" +
        "ynthetic/media/alpha/.mp3|/synthetic/media/alpha/double.mp4." +
        "jpg|/synthetic/media/alpha/.txt|/synthetic/media/alpha/x.txt" +
        ".bak");
      LogicTestLog.value(name, "Argument context does not override constructor path",
        "/synthetic/media/alpha", files.lists[0]);
      expect(files.lists[0]).assertEqual("/synthetic/media/alpha");
      LogicTestLog.number(name, "One list request", 1, files.lists.length);
      expect(files.lists.length).assertEqual(1);
      LogicTestLog.number(name, "No descriptor open", 0, files.opens.length);
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
      LogicTestLog.value(name, "Filter precedes stat", "files.list|files.stat|files.stat|files.stat|files.stat|files" +
        ".stat|files.stat", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.list|files.stat|files.stat|files.stat|files.stat|files" +
        ".stat|files.stat");
      infos.splice(0, infos.length);
      const again: FileInfo[] = await media.getFileAssets(context, undefined);
      LogicTestLog.number(name, "Result mutation cannot change listing", 6, again.length);
      expect(again.length).assertEqual(6);
      LogicTestLog.value(name, "Independent repeated names", "b.txt|a.txt|.mp3|double.mp4.jpg|.txt|x.txt.bak",
        again.map((item: FileInfo) => item.fileName).join("|"));
      expect(again.map((item: FileInfo) => item.fileName).join("|")).assertEqual(
        "b.txt|a.txt|.mp3|double.mp4.jpg|.txt|x.txt.bak");
      LogicTestLog.number(name, "Repeated selected stat count", 12, files.stats.length);
      expect(files.stats.length).assertEqual(12);
      LogicTestLog.value(name, "Directory contents remain intact",
        "b.txt|a.txt|.mp3|double.mp4.jpg|.txt|x.txt.bak", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("b.txt|a.txt|.mp3|double.mp4.jpg|.txt|x.txt.bak");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1065
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1065
     * @tc.nameDesc FileInfo listing is typed and optionally suffix filtered: Verify default unfiltered behavior,
     * explicit suffix filtering before stat and snapshot path isolation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1065", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1065";
      LogicTestLog.begin(name, "optional type FileType.IMAGE; synthetic names b.txt,a.txt,.m" +
        "p3,double.mp4.jpg,.txt,x.txt.bak");
      files.names = ["b.txt","a.txt",".mp3","double.mp4.jpg",".txt","x.txt.bak"];
      files.mtimes.set("/synthetic/media/alpha/b.txt", 0);
      files.mtimes.set("/synthetic/media/alpha/a.txt", -1);
      files.mtimes.set("/synthetic/media/alpha/.mp3", 0.5);
      files.mtimes.set("/synthetic/media/alpha/double.mp4.jpg", 9007199254740991);
      files.mtimes.set("/synthetic/media/alpha/.txt", 99);
      files.mtimes.set("/synthetic/media/alpha/x.txt.bak", 123);
      const alternate: common.UIAbilityContext = mediaContext('/synthetic/media/unused');
      const infos: FileInfo[] = await media.getFileAssets(alternate, FileType.IMAGE);
      LogicTestLog.number(name, "FileInfo count", 1, infos.length);
      expect(infos.length).assertEqual(1);
      LogicTestLog.value(name, "FileInfo names in input order", "double.mp4.jpg",
        infos.map((item: FileInfo) => item.fileName).join("|"));
      expect(infos.map((item: FileInfo) => item.fileName).join("|")).assertEqual("double.mp4.jpg");
      LogicTestLog.value(name, "FileInfo URI paths", "/synthetic/media/alpha/double.mp4.jpg",
        infos.map((item: FileInfo) => item.uri).join("|"));
      expect(infos.map((item: FileInfo) => item.uri).join("|")).assertEqual("/synthetic/media/alpha/double.mp4.jpg");
      LogicTestLog.value(name, "FileInfo mtimes preserve numeric values", "9007199254740991",
        infos.map((item: FileInfo) => String(item.mtime)).join("|"));
      expect(infos.map((item: FileInfo) => String(item.mtime)).join("|")).assertEqual("9007199254740991");
      LogicTestLog.number(name, "Only selected files are statted", 1, files.stats.length);
      expect(files.stats.length).assertEqual(1);
      LogicTestLog.value(name, "Stat paths match selected files", "/synthetic/media/alpha/double.mp4.jpg",
        files.stats.join("|"));
      expect(files.stats.join("|")).assertEqual("/synthetic/media/alpha/double.mp4.jpg");
      LogicTestLog.value(name, "Argument context does not override constructor path",
        "/synthetic/media/alpha", files.lists[0]);
      expect(files.lists[0]).assertEqual("/synthetic/media/alpha");
      LogicTestLog.number(name, "One list request", 1, files.lists.length);
      expect(files.lists.length).assertEqual(1);
      LogicTestLog.number(name, "No descriptor open", 0, files.opens.length);
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
      LogicTestLog.value(name, "Filter precedes stat", "files.list|files.stat", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.list|files.stat");
      infos.splice(0, infos.length);
      const again: FileInfo[] = await media.getFileAssets(context, FileType.IMAGE);
      LogicTestLog.number(name, "Result mutation cannot change listing", 1, again.length);
      expect(again.length).assertEqual(1);
      LogicTestLog.value(name, "Independent repeated names", "double.mp4.jpg",
        again.map((item: FileInfo) => item.fileName).join("|"));
      expect(again.map((item: FileInfo) => item.fileName).join("|")).assertEqual("double.mp4.jpg");
      LogicTestLog.number(name, "Repeated selected stat count", 2, files.stats.length);
      expect(files.stats.length).assertEqual(2);
      LogicTestLog.value(name, "Directory contents remain intact",
        "b.txt|a.txt|.mp3|double.mp4.jpg|.txt|x.txt.bak", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("b.txt|a.txt|.mp3|double.mp4.jpg|.txt|x.txt.bak");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1066
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1066
     * @tc.nameDesc FileInfo listing is typed and optionally suffix filtered: Verify default unfiltered behavior,
     * explicit suffix filtering before stat and snapshot path isolation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1066", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1066";
      LogicTestLog.begin(name, "optional type FileType.VIDEO; synthetic names b.txt,a.txt,.m" +
        "p3,double.mp4.jpg,.txt,x.txt.bak");
      files.names = ["b.txt","a.txt",".mp3","double.mp4.jpg",".txt","x.txt.bak"];
      files.mtimes.set("/synthetic/media/alpha/b.txt", 0);
      files.mtimes.set("/synthetic/media/alpha/a.txt", -1);
      files.mtimes.set("/synthetic/media/alpha/.mp3", 0.5);
      files.mtimes.set("/synthetic/media/alpha/double.mp4.jpg", 9007199254740991);
      files.mtimes.set("/synthetic/media/alpha/.txt", 99);
      files.mtimes.set("/synthetic/media/alpha/x.txt.bak", 123);
      const alternate: common.UIAbilityContext = mediaContext('/synthetic/media/unused');
      const infos: FileInfo[] = await media.getFileAssets(alternate, FileType.VIDEO);
      LogicTestLog.number(name, "FileInfo count", 0, infos.length);
      expect(infos.length).assertEqual(0);
      LogicTestLog.value(name, "FileInfo names in input order", "",
        infos.map((item: FileInfo) => item.fileName).join("|"));
      expect(infos.map((item: FileInfo) => item.fileName).join("|")).assertEqual("");
      LogicTestLog.value(name, "FileInfo URI paths", "", infos.map((item: FileInfo) => item.uri).join("|"));
      expect(infos.map((item: FileInfo) => item.uri).join("|")).assertEqual("");
      LogicTestLog.value(name, "FileInfo mtimes preserve numeric values", "",
        infos.map((item: FileInfo) => String(item.mtime)).join("|"));
      expect(infos.map((item: FileInfo) => String(item.mtime)).join("|")).assertEqual("");
      LogicTestLog.number(name, "Only selected files are statted", 0, files.stats.length);
      expect(files.stats.length).assertEqual(0);
      LogicTestLog.value(name, "Stat paths match selected files", "", files.stats.join("|"));
      expect(files.stats.join("|")).assertEqual("");
      LogicTestLog.value(name, "Argument context does not override constructor path",
        "/synthetic/media/alpha", files.lists[0]);
      expect(files.lists[0]).assertEqual("/synthetic/media/alpha");
      LogicTestLog.number(name, "One list request", 1, files.lists.length);
      expect(files.lists.length).assertEqual(1);
      LogicTestLog.number(name, "No descriptor open", 0, files.opens.length);
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
      LogicTestLog.value(name, "Filter precedes stat", "files.list", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.list");
      infos.splice(0, infos.length);
      const again: FileInfo[] = await media.getFileAssets(context, FileType.VIDEO);
      LogicTestLog.number(name, "Result mutation cannot change listing", 0, again.length);
      expect(again.length).assertEqual(0);
      LogicTestLog.value(name, "Independent repeated names", "",
        again.map((item: FileInfo) => item.fileName).join("|"));
      expect(again.map((item: FileInfo) => item.fileName).join("|")).assertEqual("");
      LogicTestLog.number(name, "Repeated selected stat count", 0, files.stats.length);
      expect(files.stats.length).assertEqual(0);
      LogicTestLog.value(name, "Directory contents remain intact",
        "b.txt|a.txt|.mp3|double.mp4.jpg|.txt|x.txt.bak", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("b.txt|a.txt|.mp3|double.mp4.jpg|.txt|x.txt.bak");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1067
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1067
     * @tc.nameDesc FileInfo listing is typed and optionally suffix filtered: Verify default unfiltered behavior,
     * explicit suffix filtering before stat and snapshot path isolation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1067", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1067";
      LogicTestLog.begin(name, "optional type FileType.AUDIO; synthetic names b.txt,a.txt,.m" +
        "p3,double.mp4.jpg,.txt,x.txt.bak");
      files.names = ["b.txt","a.txt",".mp3","double.mp4.jpg",".txt","x.txt.bak"];
      files.mtimes.set("/synthetic/media/alpha/b.txt", 0);
      files.mtimes.set("/synthetic/media/alpha/a.txt", -1);
      files.mtimes.set("/synthetic/media/alpha/.mp3", 0.5);
      files.mtimes.set("/synthetic/media/alpha/double.mp4.jpg", 9007199254740991);
      files.mtimes.set("/synthetic/media/alpha/.txt", 99);
      files.mtimes.set("/synthetic/media/alpha/x.txt.bak", 123);
      const alternate: common.UIAbilityContext = mediaContext('/synthetic/media/unused');
      const infos: FileInfo[] = await media.getFileAssets(alternate, FileType.AUDIO);
      LogicTestLog.number(name, "FileInfo count", 1, infos.length);
      expect(infos.length).assertEqual(1);
      LogicTestLog.value(name, "FileInfo names in input order", ".mp3",
        infos.map((item: FileInfo) => item.fileName).join("|"));
      expect(infos.map((item: FileInfo) => item.fileName).join("|")).assertEqual(".mp3");
      LogicTestLog.value(name, "FileInfo URI paths", "/synthetic/media/alpha/.mp3",
        infos.map((item: FileInfo) => item.uri).join("|"));
      expect(infos.map((item: FileInfo) => item.uri).join("|")).assertEqual("/synthetic/media/alpha/.mp3");
      LogicTestLog.value(name, "FileInfo mtimes preserve numeric values", "0.5",
        infos.map((item: FileInfo) => String(item.mtime)).join("|"));
      expect(infos.map((item: FileInfo) => String(item.mtime)).join("|")).assertEqual("0.5");
      LogicTestLog.number(name, "Only selected files are statted", 1, files.stats.length);
      expect(files.stats.length).assertEqual(1);
      LogicTestLog.value(name, "Stat paths match selected files", "/synthetic/media/alpha/.mp3", files.stats.join("|"));
      expect(files.stats.join("|")).assertEqual("/synthetic/media/alpha/.mp3");
      LogicTestLog.value(name, "Argument context does not override constructor path",
        "/synthetic/media/alpha", files.lists[0]);
      expect(files.lists[0]).assertEqual("/synthetic/media/alpha");
      LogicTestLog.number(name, "One list request", 1, files.lists.length);
      expect(files.lists.length).assertEqual(1);
      LogicTestLog.number(name, "No descriptor open", 0, files.opens.length);
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
      LogicTestLog.value(name, "Filter precedes stat", "files.list|files.stat", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.list|files.stat");
      infos.splice(0, infos.length);
      const again: FileInfo[] = await media.getFileAssets(context, FileType.AUDIO);
      LogicTestLog.number(name, "Result mutation cannot change listing", 1, again.length);
      expect(again.length).assertEqual(1);
      LogicTestLog.value(name, "Independent repeated names", ".mp3",
        again.map((item: FileInfo) => item.fileName).join("|"));
      expect(again.map((item: FileInfo) => item.fileName).join("|")).assertEqual(".mp3");
      LogicTestLog.number(name, "Repeated selected stat count", 2, files.stats.length);
      expect(files.stats.length).assertEqual(2);
      LogicTestLog.value(name, "Directory contents remain intact",
        "b.txt|a.txt|.mp3|double.mp4.jpg|.txt|x.txt.bak", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("b.txt|a.txt|.mp3|double.mp4.jpg|.txt|x.txt.bak");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1068
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1068
     * @tc.nameDesc FileInfo listing is typed and optionally suffix filtered: Verify default unfiltered behavior,
     * explicit suffix filtering before stat and snapshot path isolation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1068", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1068";
      LogicTestLog.begin(name, "optional type FileType.FILE; synthetic names b.txt,a.txt,.mp" +
        "3,double.mp4.jpg,.txt,x.txt.bak");
      files.names = ["b.txt","a.txt",".mp3","double.mp4.jpg",".txt","x.txt.bak"];
      files.mtimes.set("/synthetic/media/alpha/b.txt", 0);
      files.mtimes.set("/synthetic/media/alpha/a.txt", -1);
      files.mtimes.set("/synthetic/media/alpha/.mp3", 0.5);
      files.mtimes.set("/synthetic/media/alpha/double.mp4.jpg", 9007199254740991);
      files.mtimes.set("/synthetic/media/alpha/.txt", 99);
      files.mtimes.set("/synthetic/media/alpha/x.txt.bak", 123);
      const alternate: common.UIAbilityContext = mediaContext('/synthetic/media/unused');
      const infos: FileInfo[] = await media.getFileAssets(alternate, FileType.FILE);
      LogicTestLog.number(name, "FileInfo count", 3, infos.length);
      expect(infos.length).assertEqual(3);
      LogicTestLog.value(name, "FileInfo names in input order", "b.txt|a.txt|.txt",
        infos.map((item: FileInfo) => item.fileName).join("|"));
      expect(infos.map((item: FileInfo) => item.fileName).join("|")).assertEqual("b.txt|a.txt|.txt");
      LogicTestLog.value(name, "FileInfo URI paths", "/synthetic/media/alpha/b.txt|/synthetic/media/alpha/a.txt|/s" +
        "ynthetic/media/alpha/.txt", infos.map((item: FileInfo) => item.uri).join("|"));
      expect(infos.map((item: FileInfo) => item.uri).join("|")).assertEqual(
        "/synthetic/media/alpha/b.txt|/synthetic/media/alpha/a.txt|/s" +
        "ynthetic/media/alpha/.txt");
      LogicTestLog.value(name, "FileInfo mtimes preserve numeric values", "0|-1|99",
        infos.map((item: FileInfo) => String(item.mtime)).join("|"));
      expect(infos.map((item: FileInfo) => String(item.mtime)).join("|")).assertEqual("0|-1|99");
      LogicTestLog.number(name, "Only selected files are statted", 3, files.stats.length);
      expect(files.stats.length).assertEqual(3);
      LogicTestLog.value(name, "Stat paths match selected files",
        "/synthetic/media/alpha/b.txt|/synthetic/media/alpha/a.txt|/s" +
        "ynthetic/media/alpha/.txt", files.stats.join("|"));
      expect(files.stats.join("|")).assertEqual("/synthetic/media/alpha/b.txt|/synthetic/media/alpha/a.txt|/s" +
        "ynthetic/media/alpha/.txt");
      LogicTestLog.value(name, "Argument context does not override constructor path",
        "/synthetic/media/alpha", files.lists[0]);
      expect(files.lists[0]).assertEqual("/synthetic/media/alpha");
      LogicTestLog.number(name, "One list request", 1, files.lists.length);
      expect(files.lists.length).assertEqual(1);
      LogicTestLog.number(name, "No descriptor open", 0, files.opens.length);
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
      LogicTestLog.value(name, "Filter precedes stat", "files.list|files.stat|files.stat|files.stat",
        trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.list|files.stat|files.stat|files.stat");
      infos.splice(0, infos.length);
      const again: FileInfo[] = await media.getFileAssets(context, FileType.FILE);
      LogicTestLog.number(name, "Result mutation cannot change listing", 3, again.length);
      expect(again.length).assertEqual(3);
      LogicTestLog.value(name, "Independent repeated names", "b.txt|a.txt|.txt",
        again.map((item: FileInfo) => item.fileName).join("|"));
      expect(again.map((item: FileInfo) => item.fileName).join("|")).assertEqual("b.txt|a.txt|.txt");
      LogicTestLog.number(name, "Repeated selected stat count", 6, files.stats.length);
      expect(files.stats.length).assertEqual(6);
      LogicTestLog.value(name, "Directory contents remain intact",
        "b.txt|a.txt|.mp3|double.mp4.jpg|.txt|x.txt.bak", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("b.txt|a.txt|.mp3|double.mp4.jpg|.txt|x.txt.bak");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1069
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1069
     * @tc.nameDesc FileInfo listing is typed and optionally suffix filtered: Verify default unfiltered behavior,
     * explicit suffix filtering before stat and snapshot path isolation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1069", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1069";
      LogicTestLog.begin(name, "optional type 99; synthetic names b.txt,a.txt,.mp3,double.mp4.jpg,.txt,x.txt.bak");
      files.names = ["b.txt","a.txt",".mp3","double.mp4.jpg",".txt","x.txt.bak"];
      files.mtimes.set("/synthetic/media/alpha/b.txt", 0);
      files.mtimes.set("/synthetic/media/alpha/a.txt", -1);
      files.mtimes.set("/synthetic/media/alpha/.mp3", 0.5);
      files.mtimes.set("/synthetic/media/alpha/double.mp4.jpg", 9007199254740991);
      files.mtimes.set("/synthetic/media/alpha/.txt", 99);
      files.mtimes.set("/synthetic/media/alpha/x.txt.bak", 123);
      const alternate: common.UIAbilityContext = mediaContext('/synthetic/media/unused');
      const infos: FileInfo[] = await media.getFileAssets(alternate, 99);
      LogicTestLog.number(name, "FileInfo count", 3, infos.length);
      expect(infos.length).assertEqual(3);
      LogicTestLog.value(name, "FileInfo names in input order", "b.txt|a.txt|.txt",
        infos.map((item: FileInfo) => item.fileName).join("|"));
      expect(infos.map((item: FileInfo) => item.fileName).join("|")).assertEqual("b.txt|a.txt|.txt");
      LogicTestLog.value(name, "FileInfo URI paths", "/synthetic/media/alpha/b.txt|/synthetic/media/alpha/a.txt|/s" +
        "ynthetic/media/alpha/.txt", infos.map((item: FileInfo) => item.uri).join("|"));
      expect(infos.map((item: FileInfo) => item.uri).join("|")).assertEqual(
        "/synthetic/media/alpha/b.txt|/synthetic/media/alpha/a.txt|/s" +
        "ynthetic/media/alpha/.txt");
      LogicTestLog.value(name, "FileInfo mtimes preserve numeric values", "0|-1|99",
        infos.map((item: FileInfo) => String(item.mtime)).join("|"));
      expect(infos.map((item: FileInfo) => String(item.mtime)).join("|")).assertEqual("0|-1|99");
      LogicTestLog.number(name, "Only selected files are statted", 3, files.stats.length);
      expect(files.stats.length).assertEqual(3);
      LogicTestLog.value(name, "Stat paths match selected files",
        "/synthetic/media/alpha/b.txt|/synthetic/media/alpha/a.txt|/s" +
        "ynthetic/media/alpha/.txt", files.stats.join("|"));
      expect(files.stats.join("|")).assertEqual("/synthetic/media/alpha/b.txt|/synthetic/media/alpha/a.txt|/s" +
        "ynthetic/media/alpha/.txt");
      LogicTestLog.value(name, "Argument context does not override constructor path",
        "/synthetic/media/alpha", files.lists[0]);
      expect(files.lists[0]).assertEqual("/synthetic/media/alpha");
      LogicTestLog.number(name, "One list request", 1, files.lists.length);
      expect(files.lists.length).assertEqual(1);
      LogicTestLog.number(name, "No descriptor open", 0, files.opens.length);
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
      LogicTestLog.value(name, "Filter precedes stat", "files.list|files.stat|files.stat|files.stat",
        trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.list|files.stat|files.stat|files.stat");
      infos.splice(0, infos.length);
      const again: FileInfo[] = await media.getFileAssets(context, 99);
      LogicTestLog.number(name, "Result mutation cannot change listing", 3, again.length);
      expect(again.length).assertEqual(3);
      LogicTestLog.value(name, "Independent repeated names", "b.txt|a.txt|.txt",
        again.map((item: FileInfo) => item.fileName).join("|"));
      expect(again.map((item: FileInfo) => item.fileName).join("|")).assertEqual("b.txt|a.txt|.txt");
      LogicTestLog.number(name, "Repeated selected stat count", 6, files.stats.length);
      expect(files.stats.length).assertEqual(6);
      LogicTestLog.value(name, "Directory contents remain intact",
        "b.txt|a.txt|.mp3|double.mp4.jpg|.txt|x.txt.bak", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("b.txt|a.txt|.mp3|double.mp4.jpg|.txt|x.txt.bak");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1070
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1070
     * @tc.nameDesc Library listing filters native photo type and closes fetch: Verify typed usable handles, native
     * columns, filtered order and a fresh independent repeated listing.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1070", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1070";
      LogicTestLog.begin(name, "FileType.IMAGE; images=2; videos=1");
      const photo0: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/list-0/image-a.jpg", photoAccessHelper.PhotoType.IMAGE, "image-a.jpg");
      const photo1: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/list-0/image-c.jpg", photoAccessHelper.PhotoType.IMAGE, "image-c.jpg");
      const photo2: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/list-0/video-b.mp4", photoAccessHelper.PhotoType.VIDEO, "video-b.mp4");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo0, photo1, photo2]);
      library.results = [fetch];
      const handles: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.IMAGE);
      LogicTestLog.number(name, "Matching native photo count", 2, handles.length);
      expect(handles.length).assertEqual(2);
      LogicTestLog.value(name, "Native display names", "image-a.jpg|image-c.jpg",
        handles.map((item: MediaAssetHandle) => item.displayName).join("|"));
      expect(handles.map((item: MediaAssetHandle) => item.displayName).join("|")).assertEqual(
        "image-a.jpg|image-c.jpg");
      LogicTestLog.value(name, "Native URIs in filtered order",
        "fake://media/list-0/image-a.jpg|fake://media/list-0/image-c.jpg",
        handles.map((item: MediaAssetHandle) => item.uri).join("|"));
      expect(handles.map((item: MediaAssetHandle) => item.uri).join("|")).assertEqual(
        "fake://media/list-0/image-a.jpg|fake://media/list-0/image-c.jpg");
      LogicTestLog.value(name, "Requested type on every handle", "1|1",
        handles.map((item: MediaAssetHandle) => String(item.mediaType)).join("|"));
      expect(handles.map((item: MediaAssetHandle) => String(item.mediaType)).join("|")).assertEqual("1|1");
      LogicTestLog.number(name, "One library fetch", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.value(name, "Required native fetch columns", "duration|date_added",
        library.fetches[0].fetchColumns.join("|"));
      expect(library.fetches[0].fetchColumns.join("|")).assertEqual("duration|date_added");
      LogicTestLog.flag(name, "Predicates are supplied for media listing", library.fetches[0].predicates !== undefined);
      expect(library.fetches[0].predicates !== undefined).assertTrue();
      LogicTestLog.number(name, "Fetch objects read once", 1, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Fetch closed once", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.value(name, "Listing closes after constructing matching handles",
        "library.fetch|fetch.all|photo.get|photo.get|fetch.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("library.fetch|fetch.all|photo.get|photo.get|fetch.close");
      LogicTestLog.number(name, "No file open", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No file rename", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "No file unlink", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.number(name, "No directory listing", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.number(name, "No file stat", 0, files.stats.length);
      expect(files.stats.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      handles.splice(0, handles.length);
      const repeated: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.IMAGE);
      LogicTestLog.number(name, "Independent repeated native result", 2, repeated.length);
      expect(repeated.length).assertEqual(2);
      LogicTestLog.number(name, "Fetch closed for both listings", 2, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(2);
      LogicTestLog.number(name, "Two native fetch requests", 2, library.fetches.length);
      expect(library.fetches.length).assertEqual(2);
      LogicTestLog.value(name, "Source assets not deleted by result mutation",
        "fake://media/list-0/image-a.jpg|fake://media/list-0/image-c." +
        "jpg|fake://media/list-0/video-b.mp4", fetch.assets.map((item: MediaPhotoAsset) => item.uri).join("|"));
      expect(fetch.assets.map((item: MediaPhotoAsset) => item.uri).join("|")).assertEqual(
        "fake://media/list-0/image-a.jpg|fake://media/list-0/image-c." +
        "jpg|fake://media/list-0/video-b.mp4");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1071
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1071
     * @tc.nameDesc Library listing filters native photo type and closes fetch: Verify typed usable handles, native
     * columns, filtered order and a fresh independent repeated listing.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1071", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1071";
      LogicTestLog.begin(name, "FileType.VIDEO; images=2; videos=1");
      const photo0: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/list-1/image-a.jpg", photoAccessHelper.PhotoType.IMAGE, "image-a.jpg");
      const photo1: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/list-1/image-c.jpg", photoAccessHelper.PhotoType.IMAGE, "image-c.jpg");
      const photo2: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/list-1/video-b.mp4", photoAccessHelper.PhotoType.VIDEO, "video-b.mp4");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo0, photo1, photo2]);
      library.results = [fetch];
      const handles: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.VIDEO);
      LogicTestLog.number(name, "Matching native photo count", 1, handles.length);
      expect(handles.length).assertEqual(1);
      LogicTestLog.value(name, "Native display names", "video-b.mp4",
        handles.map((item: MediaAssetHandle) => item.displayName).join("|"));
      expect(handles.map((item: MediaAssetHandle) => item.displayName).join("|")).assertEqual("video-b.mp4");
      LogicTestLog.value(name, "Native URIs in filtered order", "fake://media/list-1/video-b.mp4",
        handles.map((item: MediaAssetHandle) => item.uri).join("|"));
      expect(handles.map((item: MediaAssetHandle) => item.uri).join("|")).assertEqual(
        "fake://media/list-1/video-b.mp4");
      LogicTestLog.value(name, "Requested type on every handle", "2",
        handles.map((item: MediaAssetHandle) => String(item.mediaType)).join("|"));
      expect(handles.map((item: MediaAssetHandle) => String(item.mediaType)).join("|")).assertEqual("2");
      LogicTestLog.number(name, "One library fetch", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.value(name, "Required native fetch columns", "duration|date_added",
        library.fetches[0].fetchColumns.join("|"));
      expect(library.fetches[0].fetchColumns.join("|")).assertEqual("duration|date_added");
      LogicTestLog.flag(name, "Predicates are supplied for media listing", library.fetches[0].predicates !== undefined);
      expect(library.fetches[0].predicates !== undefined).assertTrue();
      LogicTestLog.number(name, "Fetch objects read once", 1, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Fetch closed once", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.value(name, "Listing closes after constructing matching handles",
        "library.fetch|fetch.all|photo.get|fetch.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("library.fetch|fetch.all|photo.get|fetch.close");
      LogicTestLog.number(name, "No file open", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No file rename", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "No file unlink", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.number(name, "No directory listing", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.number(name, "No file stat", 0, files.stats.length);
      expect(files.stats.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      handles.splice(0, handles.length);
      const repeated: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.VIDEO);
      LogicTestLog.number(name, "Independent repeated native result", 1, repeated.length);
      expect(repeated.length).assertEqual(1);
      LogicTestLog.number(name, "Fetch closed for both listings", 2, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(2);
      LogicTestLog.number(name, "Two native fetch requests", 2, library.fetches.length);
      expect(library.fetches.length).assertEqual(2);
      LogicTestLog.value(name, "Source assets not deleted by result mutation",
        "fake://media/list-1/image-a.jpg|fake://media/list-1/image-c." +
        "jpg|fake://media/list-1/video-b.mp4", fetch.assets.map((item: MediaPhotoAsset) => item.uri).join("|"));
      expect(fetch.assets.map((item: MediaPhotoAsset) => item.uri).join("|")).assertEqual(
        "fake://media/list-1/image-a.jpg|fake://media/list-1/image-c." +
        "jpg|fake://media/list-1/video-b.mp4");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1072
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1072
     * @tc.nameDesc Library listing filters native photo type and closes fetch: Verify typed usable handles, native
     * columns, filtered order and a fresh independent repeated listing.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1072", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1072";
      LogicTestLog.begin(name, "FileType.IMAGE; images=2; videos=1");
      const photo0: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/list-2/image-a.jpg", photoAccessHelper.PhotoType.IMAGE, "image-a.jpg");
      const photo1: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/list-2/image-c.jpg", photoAccessHelper.PhotoType.IMAGE, "image-c.jpg");
      const photo2: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/list-2/video-b.mp4", photoAccessHelper.PhotoType.VIDEO, "video-b.mp4");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo0, photo1, photo2]);
      library.results = [fetch];
      const handles: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.IMAGE);
      LogicTestLog.number(name, "Matching native photo count", 2, handles.length);
      expect(handles.length).assertEqual(2);
      LogicTestLog.value(name, "Native display names", "image-a.jpg|image-c.jpg",
        handles.map((item: MediaAssetHandle) => item.displayName).join("|"));
      expect(handles.map((item: MediaAssetHandle) => item.displayName).join("|")).assertEqual(
        "image-a.jpg|image-c.jpg");
      LogicTestLog.value(name, "Native URIs in filtered order",
        "fake://media/list-2/image-a.jpg|fake://media/list-2/image-c.jpg",
        handles.map((item: MediaAssetHandle) => item.uri).join("|"));
      expect(handles.map((item: MediaAssetHandle) => item.uri).join("|")).assertEqual(
        "fake://media/list-2/image-a.jpg|fake://media/list-2/image-c.jpg");
      LogicTestLog.value(name, "Requested type on every handle", "1|1",
        handles.map((item: MediaAssetHandle) => String(item.mediaType)).join("|"));
      expect(handles.map((item: MediaAssetHandle) => String(item.mediaType)).join("|")).assertEqual("1|1");
      LogicTestLog.number(name, "One library fetch", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.value(name, "Required native fetch columns", "duration|date_added",
        library.fetches[0].fetchColumns.join("|"));
      expect(library.fetches[0].fetchColumns.join("|")).assertEqual("duration|date_added");
      LogicTestLog.flag(name, "Predicates are supplied for media listing", library.fetches[0].predicates !== undefined);
      expect(library.fetches[0].predicates !== undefined).assertTrue();
      LogicTestLog.number(name, "Fetch objects read once", 1, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Fetch closed once", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.value(name, "Listing closes after constructing matching handles",
        "library.fetch|fetch.all|photo.get|photo.get|fetch.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("library.fetch|fetch.all|photo.get|photo.get|fetch.close");
      LogicTestLog.number(name, "No file open", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No file rename", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "No file unlink", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.number(name, "No directory listing", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.number(name, "No file stat", 0, files.stats.length);
      expect(files.stats.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      handles.splice(0, handles.length);
      const repeated: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.IMAGE);
      LogicTestLog.number(name, "Independent repeated native result", 2, repeated.length);
      expect(repeated.length).assertEqual(2);
      LogicTestLog.number(name, "Fetch closed for both listings", 2, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(2);
      LogicTestLog.number(name, "Two native fetch requests", 2, library.fetches.length);
      expect(library.fetches.length).assertEqual(2);
      LogicTestLog.value(name, "Source assets not deleted by result mutation",
        "fake://media/list-2/image-a.jpg|fake://media/list-2/image-c." +
        "jpg|fake://media/list-2/video-b.mp4", fetch.assets.map((item: MediaPhotoAsset) => item.uri).join("|"));
      expect(fetch.assets.map((item: MediaPhotoAsset) => item.uri).join("|")).assertEqual(
        "fake://media/list-2/image-a.jpg|fake://media/list-2/image-c." +
        "jpg|fake://media/list-2/video-b.mp4");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1073
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1073
     * @tc.nameDesc Library listing filters native photo type and closes fetch: Verify typed usable handles, native
     * columns, filtered order and a fresh independent repeated listing.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1073", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1073";
      LogicTestLog.begin(name, "FileType.VIDEO; images=2; videos=1");
      const photo0: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/list-3/image-a.jpg", photoAccessHelper.PhotoType.IMAGE, "image-a.jpg");
      const photo1: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/list-3/image-c.jpg", photoAccessHelper.PhotoType.IMAGE, "image-c.jpg");
      const photo2: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/list-3/video-b.mp4", photoAccessHelper.PhotoType.VIDEO, "video-b.mp4");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo0, photo1, photo2]);
      library.results = [fetch];
      const handles: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.VIDEO);
      LogicTestLog.number(name, "Matching native photo count", 1, handles.length);
      expect(handles.length).assertEqual(1);
      LogicTestLog.value(name, "Native display names", "video-b.mp4",
        handles.map((item: MediaAssetHandle) => item.displayName).join("|"));
      expect(handles.map((item: MediaAssetHandle) => item.displayName).join("|")).assertEqual("video-b.mp4");
      LogicTestLog.value(name, "Native URIs in filtered order", "fake://media/list-3/video-b.mp4",
        handles.map((item: MediaAssetHandle) => item.uri).join("|"));
      expect(handles.map((item: MediaAssetHandle) => item.uri).join("|")).assertEqual(
        "fake://media/list-3/video-b.mp4");
      LogicTestLog.value(name, "Requested type on every handle", "2",
        handles.map((item: MediaAssetHandle) => String(item.mediaType)).join("|"));
      expect(handles.map((item: MediaAssetHandle) => String(item.mediaType)).join("|")).assertEqual("2");
      LogicTestLog.number(name, "One library fetch", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.value(name, "Required native fetch columns", "duration|date_added",
        library.fetches[0].fetchColumns.join("|"));
      expect(library.fetches[0].fetchColumns.join("|")).assertEqual("duration|date_added");
      LogicTestLog.flag(name, "Predicates are supplied for media listing", library.fetches[0].predicates !== undefined);
      expect(library.fetches[0].predicates !== undefined).assertTrue();
      LogicTestLog.number(name, "Fetch objects read once", 1, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Fetch closed once", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.value(name, "Listing closes after constructing matching handles",
        "library.fetch|fetch.all|photo.get|fetch.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("library.fetch|fetch.all|photo.get|fetch.close");
      LogicTestLog.number(name, "No file open", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No file rename", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "No file unlink", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.number(name, "No directory listing", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.number(name, "No file stat", 0, files.stats.length);
      expect(files.stats.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      handles.splice(0, handles.length);
      const repeated: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.VIDEO);
      LogicTestLog.number(name, "Independent repeated native result", 1, repeated.length);
      expect(repeated.length).assertEqual(1);
      LogicTestLog.number(name, "Fetch closed for both listings", 2, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(2);
      LogicTestLog.number(name, "Two native fetch requests", 2, library.fetches.length);
      expect(library.fetches.length).assertEqual(2);
      LogicTestLog.value(name, "Source assets not deleted by result mutation",
        "fake://media/list-3/image-a.jpg|fake://media/list-3/image-c." +
        "jpg|fake://media/list-3/video-b.mp4", fetch.assets.map((item: MediaPhotoAsset) => item.uri).join("|"));
      expect(fetch.assets.map((item: MediaPhotoAsset) => item.uri).join("|")).assertEqual(
        "fake://media/list-3/image-a.jpg|fake://media/list-3/image-c." +
        "jpg|fake://media/list-3/video-b.mp4");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1074
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1074
     * @tc.nameDesc Library listing filters native photo type and closes fetch: Verify typed usable handles, native
     * columns, filtered order and a fresh independent repeated listing.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1074", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1074";
      LogicTestLog.begin(name, "FileType.IMAGE; images=0; videos=1");
      const photo0: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/list-4/video-b.mp4", photoAccessHelper.PhotoType.VIDEO, "video-b.mp4");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo0]);
      library.results = [fetch];
      const handles: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.IMAGE);
      LogicTestLog.number(name, "Matching native photo count", 0, handles.length);
      expect(handles.length).assertEqual(0);
      LogicTestLog.value(name, "Native display names", "",
        handles.map((item: MediaAssetHandle) => item.displayName).join("|"));
      expect(handles.map((item: MediaAssetHandle) => item.displayName).join("|")).assertEqual("");
      LogicTestLog.value(name, "Native URIs in filtered order", "",
        handles.map((item: MediaAssetHandle) => item.uri).join("|"));
      expect(handles.map((item: MediaAssetHandle) => item.uri).join("|")).assertEqual("");
      LogicTestLog.value(name, "Requested type on every handle", "",
        handles.map((item: MediaAssetHandle) => String(item.mediaType)).join("|"));
      expect(handles.map((item: MediaAssetHandle) => String(item.mediaType)).join("|")).assertEqual("");
      LogicTestLog.number(name, "One library fetch", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.value(name, "Required native fetch columns", "duration|date_added",
        library.fetches[0].fetchColumns.join("|"));
      expect(library.fetches[0].fetchColumns.join("|")).assertEqual("duration|date_added");
      LogicTestLog.flag(name, "Predicates are supplied for media listing", library.fetches[0].predicates !== undefined);
      expect(library.fetches[0].predicates !== undefined).assertTrue();
      LogicTestLog.number(name, "Fetch objects read once", 1, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Fetch closed once", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.value(name, "Listing closes after constructing matching handles",
        "library.fetch|fetch.all|fetch.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("library.fetch|fetch.all|fetch.close");
      LogicTestLog.number(name, "No file open", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No file rename", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "No file unlink", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.number(name, "No directory listing", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.number(name, "No file stat", 0, files.stats.length);
      expect(files.stats.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      handles.splice(0, handles.length);
      const repeated: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.IMAGE);
      LogicTestLog.number(name, "Independent repeated native result", 0, repeated.length);
      expect(repeated.length).assertEqual(0);
      LogicTestLog.number(name, "Fetch closed for both listings", 2, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(2);
      LogicTestLog.number(name, "Two native fetch requests", 2, library.fetches.length);
      expect(library.fetches.length).assertEqual(2);
      LogicTestLog.value(name, "Source assets not deleted by result mutation",
        "fake://media/list-4/video-b.mp4", fetch.assets.map((item: MediaPhotoAsset) => item.uri).join("|"));
      expect(fetch.assets.map((item: MediaPhotoAsset) => item.uri).join("|")).assertEqual(
        "fake://media/list-4/video-b.mp4");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1075
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1075
     * @tc.nameDesc Library listing filters native photo type and closes fetch: Verify typed usable handles, native
     * columns, filtered order and a fresh independent repeated listing.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1075", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1075";
      LogicTestLog.begin(name, "FileType.VIDEO; images=0; videos=1");
      const photo0: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/list-5/video-b.mp4", photoAccessHelper.PhotoType.VIDEO, "video-b.mp4");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo0]);
      library.results = [fetch];
      const handles: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.VIDEO);
      LogicTestLog.number(name, "Matching native photo count", 1, handles.length);
      expect(handles.length).assertEqual(1);
      LogicTestLog.value(name, "Native display names", "video-b.mp4",
        handles.map((item: MediaAssetHandle) => item.displayName).join("|"));
      expect(handles.map((item: MediaAssetHandle) => item.displayName).join("|")).assertEqual("video-b.mp4");
      LogicTestLog.value(name, "Native URIs in filtered order", "fake://media/list-5/video-b.mp4",
        handles.map((item: MediaAssetHandle) => item.uri).join("|"));
      expect(handles.map((item: MediaAssetHandle) => item.uri).join("|")).assertEqual(
        "fake://media/list-5/video-b.mp4");
      LogicTestLog.value(name, "Requested type on every handle", "2",
        handles.map((item: MediaAssetHandle) => String(item.mediaType)).join("|"));
      expect(handles.map((item: MediaAssetHandle) => String(item.mediaType)).join("|")).assertEqual("2");
      LogicTestLog.number(name, "One library fetch", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.value(name, "Required native fetch columns", "duration|date_added",
        library.fetches[0].fetchColumns.join("|"));
      expect(library.fetches[0].fetchColumns.join("|")).assertEqual("duration|date_added");
      LogicTestLog.flag(name, "Predicates are supplied for media listing", library.fetches[0].predicates !== undefined);
      expect(library.fetches[0].predicates !== undefined).assertTrue();
      LogicTestLog.number(name, "Fetch objects read once", 1, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Fetch closed once", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.value(name, "Listing closes after constructing matching handles",
        "library.fetch|fetch.all|photo.get|fetch.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("library.fetch|fetch.all|photo.get|fetch.close");
      LogicTestLog.number(name, "No file open", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No file rename", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "No file unlink", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.number(name, "No directory listing", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.number(name, "No file stat", 0, files.stats.length);
      expect(files.stats.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      handles.splice(0, handles.length);
      const repeated: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.VIDEO);
      LogicTestLog.number(name, "Independent repeated native result", 1, repeated.length);
      expect(repeated.length).assertEqual(1);
      LogicTestLog.number(name, "Fetch closed for both listings", 2, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(2);
      LogicTestLog.number(name, "Two native fetch requests", 2, library.fetches.length);
      expect(library.fetches.length).assertEqual(2);
      LogicTestLog.value(name, "Source assets not deleted by result mutation",
        "fake://media/list-5/video-b.mp4", fetch.assets.map((item: MediaPhotoAsset) => item.uri).join("|"));
      expect(fetch.assets.map((item: MediaPhotoAsset) => item.uri).join("|")).assertEqual(
        "fake://media/list-5/video-b.mp4");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1076
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1076
     * @tc.nameDesc Library listing filters native photo type and closes fetch: Verify typed usable handles, native
     * columns, filtered order and a fresh independent repeated listing.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1076", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1076";
      LogicTestLog.begin(name, "FileType.IMAGE; images=0; videos=0");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, []);
      library.results = [fetch];
      const handles: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.IMAGE);
      LogicTestLog.number(name, "Matching native photo count", 0, handles.length);
      expect(handles.length).assertEqual(0);
      LogicTestLog.value(name, "Native display names", "",
        handles.map((item: MediaAssetHandle) => item.displayName).join("|"));
      expect(handles.map((item: MediaAssetHandle) => item.displayName).join("|")).assertEqual("");
      LogicTestLog.value(name, "Native URIs in filtered order", "",
        handles.map((item: MediaAssetHandle) => item.uri).join("|"));
      expect(handles.map((item: MediaAssetHandle) => item.uri).join("|")).assertEqual("");
      LogicTestLog.value(name, "Requested type on every handle", "",
        handles.map((item: MediaAssetHandle) => String(item.mediaType)).join("|"));
      expect(handles.map((item: MediaAssetHandle) => String(item.mediaType)).join("|")).assertEqual("");
      LogicTestLog.number(name, "One library fetch", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.value(name, "Required native fetch columns", "duration|date_added",
        library.fetches[0].fetchColumns.join("|"));
      expect(library.fetches[0].fetchColumns.join("|")).assertEqual("duration|date_added");
      LogicTestLog.flag(name, "Predicates are supplied for media listing", library.fetches[0].predicates !== undefined);
      expect(library.fetches[0].predicates !== undefined).assertTrue();
      LogicTestLog.number(name, "Fetch objects read once", 1, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Fetch closed once", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.value(name, "Listing closes after constructing matching handles",
        "library.fetch|fetch.all|fetch.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("library.fetch|fetch.all|fetch.close");
      LogicTestLog.number(name, "No file open", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No file rename", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "No file unlink", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.number(name, "No directory listing", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.number(name, "No file stat", 0, files.stats.length);
      expect(files.stats.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      handles.splice(0, handles.length);
      const repeated: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.IMAGE);
      LogicTestLog.number(name, "Independent repeated native result", 0, repeated.length);
      expect(repeated.length).assertEqual(0);
      LogicTestLog.number(name, "Fetch closed for both listings", 2, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(2);
      LogicTestLog.number(name, "Two native fetch requests", 2, library.fetches.length);
      expect(library.fetches.length).assertEqual(2);
      LogicTestLog.value(name, "Source assets not deleted by result mutation", "",
        fetch.assets.map((item: MediaPhotoAsset) => item.uri).join("|"));
      expect(fetch.assets.map((item: MediaPhotoAsset) => item.uri).join("|")).assertEqual("");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1077
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1077
     * @tc.nameDesc Library listing filters native photo type and closes fetch: Verify typed usable handles, native
     * columns, filtered order and a fresh independent repeated listing.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1077", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1077";
      LogicTestLog.begin(name, "FileType.VIDEO; images=0; videos=0");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, []);
      library.results = [fetch];
      const handles: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.VIDEO);
      LogicTestLog.number(name, "Matching native photo count", 0, handles.length);
      expect(handles.length).assertEqual(0);
      LogicTestLog.value(name, "Native display names", "",
        handles.map((item: MediaAssetHandle) => item.displayName).join("|"));
      expect(handles.map((item: MediaAssetHandle) => item.displayName).join("|")).assertEqual("");
      LogicTestLog.value(name, "Native URIs in filtered order", "",
        handles.map((item: MediaAssetHandle) => item.uri).join("|"));
      expect(handles.map((item: MediaAssetHandle) => item.uri).join("|")).assertEqual("");
      LogicTestLog.value(name, "Requested type on every handle", "",
        handles.map((item: MediaAssetHandle) => String(item.mediaType)).join("|"));
      expect(handles.map((item: MediaAssetHandle) => String(item.mediaType)).join("|")).assertEqual("");
      LogicTestLog.number(name, "One library fetch", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.value(name, "Required native fetch columns", "duration|date_added",
        library.fetches[0].fetchColumns.join("|"));
      expect(library.fetches[0].fetchColumns.join("|")).assertEqual("duration|date_added");
      LogicTestLog.flag(name, "Predicates are supplied for media listing", library.fetches[0].predicates !== undefined);
      expect(library.fetches[0].predicates !== undefined).assertTrue();
      LogicTestLog.number(name, "Fetch objects read once", 1, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Fetch closed once", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.value(name, "Listing closes after constructing matching handles",
        "library.fetch|fetch.all|fetch.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("library.fetch|fetch.all|fetch.close");
      LogicTestLog.number(name, "No file open", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No file rename", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "No file unlink", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.number(name, "No directory listing", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.number(name, "No file stat", 0, files.stats.length);
      expect(files.stats.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      handles.splice(0, handles.length);
      const repeated: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.VIDEO);
      LogicTestLog.number(name, "Independent repeated native result", 0, repeated.length);
      expect(repeated.length).assertEqual(0);
      LogicTestLog.number(name, "Fetch closed for both listings", 2, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(2);
      LogicTestLog.number(name, "Two native fetch requests", 2, library.fetches.length);
      expect(library.fetches.length).assertEqual(2);
      LogicTestLog.value(name, "Source assets not deleted by result mutation", "",
        fetch.assets.map((item: MediaPhotoAsset) => item.uri).join("|"));
      expect(fetch.assets.map((item: MediaPhotoAsset) => item.uri).join("|")).assertEqual("");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1078
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1078
     * @tc.nameDesc Album counts keep documents text only: Verify fixed album order, exact per-type counts and no audio,
     * image or arbitrary file counted as Documents.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1078", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1078";
      LogicTestLog.begin(name, "album dataset 0; sandbox files document.txt,music.mp3,image.jpg,video.mp4,other");
      files.names = ["document.txt","music.mp3","image.jpg","video.mp4","other"];
      const photo0: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/album-0-0", photoAccessHelper.PhotoType.IMAGE, "album-0.jpg");
      const photo1: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/album-0-1", photoAccessHelper.PhotoType.VIDEO, "album-1.mp4");
      const firstFetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo0, photo1]);
      const secondFetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo0, photo1]);
      library.results = [firstFetch, secondFetch];
      const albums: AlbumInfo[] = await media.getAlbums(context);
      LogicTestLog.number(name, "Four fixed albums", 4, albums.length);
      expect(albums.length).assertEqual(4);
      LogicTestLog.value(name, "Album order", "Documents|Pictures|Videos|Audios",
        albums.map((item: AlbumInfo) => item.albumName).join("|"));
      expect(albums.map((item: AlbumInfo) => item.albumName).join("|")).assertEqual("Documents|Pictures|Videos|Audios");
      LogicTestLog.value(name, "Album media type order", "4|1|2|3",
        albums.map((item: AlbumInfo) => String(item.mediaType)).join("|"));
      expect(albums.map((item: AlbumInfo) => String(item.mediaType)).join("|")).assertEqual("4|1|2|3");
      LogicTestLog.number(name, "Documents only text suffix", 1, albums[0].count);
      expect(albums[0].count).assertEqual(1);
      LogicTestLog.number(name, "Pictures only image type", 1, albums[1].count);
      expect(albums[1].count).assertEqual(1);
      LogicTestLog.number(name, "Videos only video type", 1, albums[2].count);
      expect(albums[2].count).assertEqual(1);
      LogicTestLog.number(name, "Audios only lowercase mp3 suffix", 1, albums[3].count);
      expect(albums[3].count).assertEqual(1);
      LogicTestLog.number(name, "Separate image and video fetches", 2, library.fetches.length);
      expect(library.fetches.length).assertEqual(2);
      LogicTestLog.number(name, "Image fetch closed", 1, firstFetch.closeCalls);
      expect(firstFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Video fetch closed", 1, secondFetch.closeCalls);
      expect(secondFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Each fetch read once", 2, firstFetch.allCalls + secondFetch.allCalls);
      expect(firstFetch.allCalls + secondFetch.allCalls).assertEqual(2);
      LogicTestLog.number(name, "Audio and text directory lists", 2, files.lists.length);
      expect(files.lists.length).assertEqual(2);
      LogicTestLog.value(name, "Both sandbox lists use the saved path",
        "/synthetic/media/alpha|/synthetic/media/alpha", files.lists.join("|"));
      expect(files.lists.join("|")).assertEqual("/synthetic/media/alpha|/synthetic/media/alpha");
      LogicTestLog.number(name, "Only Documents require stats", 1, files.stats.length);
      expect(files.stats.length).assertEqual(1);
      LogicTestLog.value(name, "Only text stat paths", "/synthetic/media/alpha/document.txt", files.stats.join("|"));
      expect(files.stats.join("|")).assertEqual("/synthetic/media/alpha/document.txt");
      LogicTestLog.number(name, "Album listing never opens files", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "Album listing never creates assets", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      LogicTestLog.value(name, "Album listing leaves synthetic directory unchanged",
        "document.txt|music.mp3|image.jpg|video.mp4|other", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("document.txt|music.mp3|image.jpg|video.mp4|other");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1079
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1079
     * @tc.nameDesc Album counts keep documents text only: Verify fixed album order, exact per-type counts and no audio,
     * image or arbitrary file counted as Documents.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1079", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1079";
      LogicTestLog.begin(name, "album dataset 1; sandbox files one.txt,two.txt,voice.mp3,UPPER.TXT");
      files.names = ["one.txt","two.txt","voice.mp3","UPPER.TXT"];
      const photo0: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/album-1-0", photoAccessHelper.PhotoType.IMAGE, "album-0.jpg");
      const photo1: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/album-1-1", photoAccessHelper.PhotoType.IMAGE, "album-1.jpg");
      const firstFetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo0, photo1]);
      const secondFetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo0, photo1]);
      library.results = [firstFetch, secondFetch];
      const albums: AlbumInfo[] = await media.getAlbums(context);
      LogicTestLog.number(name, "Four fixed albums", 4, albums.length);
      expect(albums.length).assertEqual(4);
      LogicTestLog.value(name, "Album order", "Documents|Pictures|Videos|Audios",
        albums.map((item: AlbumInfo) => item.albumName).join("|"));
      expect(albums.map((item: AlbumInfo) => item.albumName).join("|")).assertEqual("Documents|Pictures|Videos|Audios");
      LogicTestLog.value(name, "Album media type order", "4|1|2|3",
        albums.map((item: AlbumInfo) => String(item.mediaType)).join("|"));
      expect(albums.map((item: AlbumInfo) => String(item.mediaType)).join("|")).assertEqual("4|1|2|3");
      LogicTestLog.number(name, "Documents only text suffix", 2, albums[0].count);
      expect(albums[0].count).assertEqual(2);
      LogicTestLog.number(name, "Pictures only image type", 2, albums[1].count);
      expect(albums[1].count).assertEqual(2);
      LogicTestLog.number(name, "Videos only video type", 0, albums[2].count);
      expect(albums[2].count).assertEqual(0);
      LogicTestLog.number(name, "Audios only lowercase mp3 suffix", 1, albums[3].count);
      expect(albums[3].count).assertEqual(1);
      LogicTestLog.number(name, "Separate image and video fetches", 2, library.fetches.length);
      expect(library.fetches.length).assertEqual(2);
      LogicTestLog.number(name, "Image fetch closed", 1, firstFetch.closeCalls);
      expect(firstFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Video fetch closed", 1, secondFetch.closeCalls);
      expect(secondFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Each fetch read once", 2, firstFetch.allCalls + secondFetch.allCalls);
      expect(firstFetch.allCalls + secondFetch.allCalls).assertEqual(2);
      LogicTestLog.number(name, "Audio and text directory lists", 2, files.lists.length);
      expect(files.lists.length).assertEqual(2);
      LogicTestLog.value(name, "Both sandbox lists use the saved path",
        "/synthetic/media/alpha|/synthetic/media/alpha", files.lists.join("|"));
      expect(files.lists.join("|")).assertEqual("/synthetic/media/alpha|/synthetic/media/alpha");
      LogicTestLog.number(name, "Only Documents require stats", 2, files.stats.length);
      expect(files.stats.length).assertEqual(2);
      LogicTestLog.value(name, "Only text stat paths",
        "/synthetic/media/alpha/one.txt|/synthetic/media/alpha/two.txt", files.stats.join("|"));
      expect(files.stats.join("|")).assertEqual("/synthetic/media/alpha/one.txt|/synthetic/media/alpha/two.txt");
      LogicTestLog.number(name, "Album listing never opens files", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "Album listing never creates assets", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      LogicTestLog.value(name, "Album listing leaves synthetic directory unchanged",
        "one.txt|two.txt|voice.mp3|UPPER.TXT", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("one.txt|two.txt|voice.mp3|UPPER.TXT");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1080
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1080
     * @tc.nameDesc Album counts keep documents text only: Verify fixed album order, exact per-type counts and no audio,
     * image or arbitrary file counted as Documents.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1080", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1080";
      LogicTestLog.begin(name, "album dataset 2; sandbox files one.mp3,two.mp3,ignored.bin");
      files.names = ["one.mp3","two.mp3","ignored.bin"];
      const photo0: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/album-2-0", photoAccessHelper.PhotoType.VIDEO, "album-0.mp4");
      const photo1: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/album-2-1", photoAccessHelper.PhotoType.VIDEO, "album-1.mp4");
      const firstFetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo0, photo1]);
      const secondFetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo0, photo1]);
      library.results = [firstFetch, secondFetch];
      const albums: AlbumInfo[] = await media.getAlbums(context);
      LogicTestLog.number(name, "Four fixed albums", 4, albums.length);
      expect(albums.length).assertEqual(4);
      LogicTestLog.value(name, "Album order", "Documents|Pictures|Videos|Audios",
        albums.map((item: AlbumInfo) => item.albumName).join("|"));
      expect(albums.map((item: AlbumInfo) => item.albumName).join("|")).assertEqual("Documents|Pictures|Videos|Audios");
      LogicTestLog.value(name, "Album media type order", "4|1|2|3",
        albums.map((item: AlbumInfo) => String(item.mediaType)).join("|"));
      expect(albums.map((item: AlbumInfo) => String(item.mediaType)).join("|")).assertEqual("4|1|2|3");
      LogicTestLog.number(name, "Documents only text suffix", 0, albums[0].count);
      expect(albums[0].count).assertEqual(0);
      LogicTestLog.number(name, "Pictures only image type", 0, albums[1].count);
      expect(albums[1].count).assertEqual(0);
      LogicTestLog.number(name, "Videos only video type", 2, albums[2].count);
      expect(albums[2].count).assertEqual(2);
      LogicTestLog.number(name, "Audios only lowercase mp3 suffix", 2, albums[3].count);
      expect(albums[3].count).assertEqual(2);
      LogicTestLog.number(name, "Separate image and video fetches", 2, library.fetches.length);
      expect(library.fetches.length).assertEqual(2);
      LogicTestLog.number(name, "Image fetch closed", 1, firstFetch.closeCalls);
      expect(firstFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Video fetch closed", 1, secondFetch.closeCalls);
      expect(secondFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Each fetch read once", 2, firstFetch.allCalls + secondFetch.allCalls);
      expect(firstFetch.allCalls + secondFetch.allCalls).assertEqual(2);
      LogicTestLog.number(name, "Audio and text directory lists", 2, files.lists.length);
      expect(files.lists.length).assertEqual(2);
      LogicTestLog.value(name, "Both sandbox lists use the saved path",
        "/synthetic/media/alpha|/synthetic/media/alpha", files.lists.join("|"));
      expect(files.lists.join("|")).assertEqual("/synthetic/media/alpha|/synthetic/media/alpha");
      LogicTestLog.number(name, "Only Documents require stats", 0, files.stats.length);
      expect(files.stats.length).assertEqual(0);
      LogicTestLog.value(name, "Only text stat paths", "", files.stats.join("|"));
      expect(files.stats.join("|")).assertEqual("");
      LogicTestLog.number(name, "Album listing never opens files", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "Album listing never creates assets", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      LogicTestLog.value(name, "Album listing leaves synthetic directory unchanged",
        "one.mp3|two.mp3|ignored.bin", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("one.mp3|two.mp3|ignored.bin");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1081
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1081
     * @tc.nameDesc Album counts keep documents text only: Verify fixed album order, exact per-type counts and no audio,
     * image or arbitrary file counted as Documents.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1081", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1081";
      LogicTestLog.begin(name, "album dataset 3; sandbox files ");
      files.names = [];
      const firstFetch: FakeMediaFetch = new FakeMediaFetch(trace, []);
      const secondFetch: FakeMediaFetch = new FakeMediaFetch(trace, []);
      library.results = [firstFetch, secondFetch];
      const albums: AlbumInfo[] = await media.getAlbums(context);
      LogicTestLog.number(name, "Four fixed albums", 4, albums.length);
      expect(albums.length).assertEqual(4);
      LogicTestLog.value(name, "Album order", "Documents|Pictures|Videos|Audios",
        albums.map((item: AlbumInfo) => item.albumName).join("|"));
      expect(albums.map((item: AlbumInfo) => item.albumName).join("|")).assertEqual("Documents|Pictures|Videos|Audios");
      LogicTestLog.value(name, "Album media type order", "4|1|2|3",
        albums.map((item: AlbumInfo) => String(item.mediaType)).join("|"));
      expect(albums.map((item: AlbumInfo) => String(item.mediaType)).join("|")).assertEqual("4|1|2|3");
      LogicTestLog.number(name, "Documents only text suffix", 0, albums[0].count);
      expect(albums[0].count).assertEqual(0);
      LogicTestLog.number(name, "Pictures only image type", 0, albums[1].count);
      expect(albums[1].count).assertEqual(0);
      LogicTestLog.number(name, "Videos only video type", 0, albums[2].count);
      expect(albums[2].count).assertEqual(0);
      LogicTestLog.number(name, "Audios only lowercase mp3 suffix", 0, albums[3].count);
      expect(albums[3].count).assertEqual(0);
      LogicTestLog.number(name, "Separate image and video fetches", 2, library.fetches.length);
      expect(library.fetches.length).assertEqual(2);
      LogicTestLog.number(name, "Image fetch closed", 1, firstFetch.closeCalls);
      expect(firstFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Video fetch closed", 1, secondFetch.closeCalls);
      expect(secondFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Each fetch read once", 2, firstFetch.allCalls + secondFetch.allCalls);
      expect(firstFetch.allCalls + secondFetch.allCalls).assertEqual(2);
      LogicTestLog.number(name, "Audio and text directory lists", 2, files.lists.length);
      expect(files.lists.length).assertEqual(2);
      LogicTestLog.value(name, "Both sandbox lists use the saved path",
        "/synthetic/media/alpha|/synthetic/media/alpha", files.lists.join("|"));
      expect(files.lists.join("|")).assertEqual("/synthetic/media/alpha|/synthetic/media/alpha");
      LogicTestLog.number(name, "Only Documents require stats", 0, files.stats.length);
      expect(files.stats.length).assertEqual(0);
      LogicTestLog.value(name, "Only text stat paths", "", files.stats.join("|"));
      expect(files.stats.join("|")).assertEqual("");
      LogicTestLog.number(name, "Album listing never opens files", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "Album listing never creates assets", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      LogicTestLog.value(name, "Album listing leaves synthetic directory unchanged", "", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1082
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1082
     * @tc.nameDesc Album counts keep documents text only: Verify fixed album order, exact per-type counts and no audio,
     * image or arbitrary file counted as Documents.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1082", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1082";
      LogicTestLog.begin(name, "album dataset 4; sandbox files .txt,.mp3,case.Txt,case.Mp3");
      files.names = [".txt",".mp3","case.Txt","case.Mp3"];
      const photo0: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/album-4-0", photoAccessHelper.PhotoType.IMAGE, "album-0.jpg");
      const photo1: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/album-4-1", photoAccessHelper.PhotoType.IMAGE, "album-1.jpg");
      const photo2: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/album-4-2", photoAccessHelper.PhotoType.VIDEO, "album-2.mp4");
      const photo3: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/album-4-3", photoAccessHelper.PhotoType.VIDEO, "album-3.mp4");
      const firstFetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo0, photo1, photo2, photo3]);
      const secondFetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo0, photo1, photo2, photo3]);
      library.results = [firstFetch, secondFetch];
      const albums: AlbumInfo[] = await media.getAlbums(context);
      LogicTestLog.number(name, "Four fixed albums", 4, albums.length);
      expect(albums.length).assertEqual(4);
      LogicTestLog.value(name, "Album order", "Documents|Pictures|Videos|Audios",
        albums.map((item: AlbumInfo) => item.albumName).join("|"));
      expect(albums.map((item: AlbumInfo) => item.albumName).join("|")).assertEqual("Documents|Pictures|Videos|Audios");
      LogicTestLog.value(name, "Album media type order", "4|1|2|3",
        albums.map((item: AlbumInfo) => String(item.mediaType)).join("|"));
      expect(albums.map((item: AlbumInfo) => String(item.mediaType)).join("|")).assertEqual("4|1|2|3");
      LogicTestLog.number(name, "Documents only text suffix", 1, albums[0].count);
      expect(albums[0].count).assertEqual(1);
      LogicTestLog.number(name, "Pictures only image type", 2, albums[1].count);
      expect(albums[1].count).assertEqual(2);
      LogicTestLog.number(name, "Videos only video type", 2, albums[2].count);
      expect(albums[2].count).assertEqual(2);
      LogicTestLog.number(name, "Audios only lowercase mp3 suffix", 1, albums[3].count);
      expect(albums[3].count).assertEqual(1);
      LogicTestLog.number(name, "Separate image and video fetches", 2, library.fetches.length);
      expect(library.fetches.length).assertEqual(2);
      LogicTestLog.number(name, "Image fetch closed", 1, firstFetch.closeCalls);
      expect(firstFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Video fetch closed", 1, secondFetch.closeCalls);
      expect(secondFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Each fetch read once", 2, firstFetch.allCalls + secondFetch.allCalls);
      expect(firstFetch.allCalls + secondFetch.allCalls).assertEqual(2);
      LogicTestLog.number(name, "Audio and text directory lists", 2, files.lists.length);
      expect(files.lists.length).assertEqual(2);
      LogicTestLog.value(name, "Both sandbox lists use the saved path",
        "/synthetic/media/alpha|/synthetic/media/alpha", files.lists.join("|"));
      expect(files.lists.join("|")).assertEqual("/synthetic/media/alpha|/synthetic/media/alpha");
      LogicTestLog.number(name, "Only Documents require stats", 1, files.stats.length);
      expect(files.stats.length).assertEqual(1);
      LogicTestLog.value(name, "Only text stat paths", "/synthetic/media/alpha/.txt", files.stats.join("|"));
      expect(files.stats.join("|")).assertEqual("/synthetic/media/alpha/.txt");
      LogicTestLog.number(name, "Album listing never opens files", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "Album listing never creates assets", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      LogicTestLog.value(name, "Album listing leaves synthetic directory unchanged",
        ".txt|.mp3|case.Txt|case.Mp3", files.names.join("|"));
      expect(files.names.join("|")).assertEqual(".txt|.mp3|case.Txt|case.Mp3");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1083
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1083
     * @tc.nameDesc Album counts keep documents text only: Verify fixed album order, exact per-type counts and no audio,
     * image or arbitrary file counted as Documents.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1083", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1083";
      LogicTestLog.begin(name, "album dataset 5; sandbox files a.txt,a.txt,b.mp3,b.mp3");
      files.names = ["a.txt","a.txt","b.mp3","b.mp3"];
      const photo0: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/album-5-0", photoAccessHelper.PhotoType.IMAGE, "album-0.jpg");
      const firstFetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo0]);
      const secondFetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo0]);
      library.results = [firstFetch, secondFetch];
      const albums: AlbumInfo[] = await media.getAlbums(context);
      LogicTestLog.number(name, "Four fixed albums", 4, albums.length);
      expect(albums.length).assertEqual(4);
      LogicTestLog.value(name, "Album order", "Documents|Pictures|Videos|Audios",
        albums.map((item: AlbumInfo) => item.albumName).join("|"));
      expect(albums.map((item: AlbumInfo) => item.albumName).join("|")).assertEqual("Documents|Pictures|Videos|Audios");
      LogicTestLog.value(name, "Album media type order", "4|1|2|3",
        albums.map((item: AlbumInfo) => String(item.mediaType)).join("|"));
      expect(albums.map((item: AlbumInfo) => String(item.mediaType)).join("|")).assertEqual("4|1|2|3");
      LogicTestLog.number(name, "Documents only text suffix", 2, albums[0].count);
      expect(albums[0].count).assertEqual(2);
      LogicTestLog.number(name, "Pictures only image type", 1, albums[1].count);
      expect(albums[1].count).assertEqual(1);
      LogicTestLog.number(name, "Videos only video type", 0, albums[2].count);
      expect(albums[2].count).assertEqual(0);
      LogicTestLog.number(name, "Audios only lowercase mp3 suffix", 2, albums[3].count);
      expect(albums[3].count).assertEqual(2);
      LogicTestLog.number(name, "Separate image and video fetches", 2, library.fetches.length);
      expect(library.fetches.length).assertEqual(2);
      LogicTestLog.number(name, "Image fetch closed", 1, firstFetch.closeCalls);
      expect(firstFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Video fetch closed", 1, secondFetch.closeCalls);
      expect(secondFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Each fetch read once", 2, firstFetch.allCalls + secondFetch.allCalls);
      expect(firstFetch.allCalls + secondFetch.allCalls).assertEqual(2);
      LogicTestLog.number(name, "Audio and text directory lists", 2, files.lists.length);
      expect(files.lists.length).assertEqual(2);
      LogicTestLog.value(name, "Both sandbox lists use the saved path",
        "/synthetic/media/alpha|/synthetic/media/alpha", files.lists.join("|"));
      expect(files.lists.join("|")).assertEqual("/synthetic/media/alpha|/synthetic/media/alpha");
      LogicTestLog.number(name, "Only Documents require stats", 2, files.stats.length);
      expect(files.stats.length).assertEqual(2);
      LogicTestLog.value(name, "Only text stat paths",
        "/synthetic/media/alpha/a.txt|/synthetic/media/alpha/a.txt", files.stats.join("|"));
      expect(files.stats.join("|")).assertEqual("/synthetic/media/alpha/a.txt|/synthetic/media/alpha/a.txt");
      LogicTestLog.number(name, "Album listing never opens files", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "Album listing never creates assets", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      LogicTestLog.value(name, "Album listing leaves synthetic directory unchanged",
        "a.txt|a.txt|b.mp3|b.mp3", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("a.txt|a.txt|b.mp3|b.mp3");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1084
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1084
     * @tc.nameDesc Album counts keep documents text only: Verify fixed album order, exact per-type counts and no audio,
     * image or arbitrary file counted as Documents.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1084", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1084";
      LogicTestLog.begin(name, "album dataset 6; sandbox files report.v2.txt,not.txt.bak,sound.mp3.old");
      files.names = ["report.v2.txt","not.txt.bak","sound.mp3.old"];
      const photo0: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/album-6-0", photoAccessHelper.PhotoType.VIDEO, "album-0.mp4");
      const firstFetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo0]);
      const secondFetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo0]);
      library.results = [firstFetch, secondFetch];
      const albums: AlbumInfo[] = await media.getAlbums(context);
      LogicTestLog.number(name, "Four fixed albums", 4, albums.length);
      expect(albums.length).assertEqual(4);
      LogicTestLog.value(name, "Album order", "Documents|Pictures|Videos|Audios",
        albums.map((item: AlbumInfo) => item.albumName).join("|"));
      expect(albums.map((item: AlbumInfo) => item.albumName).join("|")).assertEqual("Documents|Pictures|Videos|Audios");
      LogicTestLog.value(name, "Album media type order", "4|1|2|3",
        albums.map((item: AlbumInfo) => String(item.mediaType)).join("|"));
      expect(albums.map((item: AlbumInfo) => String(item.mediaType)).join("|")).assertEqual("4|1|2|3");
      LogicTestLog.number(name, "Documents only text suffix", 1, albums[0].count);
      expect(albums[0].count).assertEqual(1);
      LogicTestLog.number(name, "Pictures only image type", 0, albums[1].count);
      expect(albums[1].count).assertEqual(0);
      LogicTestLog.number(name, "Videos only video type", 1, albums[2].count);
      expect(albums[2].count).assertEqual(1);
      LogicTestLog.number(name, "Audios only lowercase mp3 suffix", 0, albums[3].count);
      expect(albums[3].count).assertEqual(0);
      LogicTestLog.number(name, "Separate image and video fetches", 2, library.fetches.length);
      expect(library.fetches.length).assertEqual(2);
      LogicTestLog.number(name, "Image fetch closed", 1, firstFetch.closeCalls);
      expect(firstFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Video fetch closed", 1, secondFetch.closeCalls);
      expect(secondFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Each fetch read once", 2, firstFetch.allCalls + secondFetch.allCalls);
      expect(firstFetch.allCalls + secondFetch.allCalls).assertEqual(2);
      LogicTestLog.number(name, "Audio and text directory lists", 2, files.lists.length);
      expect(files.lists.length).assertEqual(2);
      LogicTestLog.value(name, "Both sandbox lists use the saved path",
        "/synthetic/media/alpha|/synthetic/media/alpha", files.lists.join("|"));
      expect(files.lists.join("|")).assertEqual("/synthetic/media/alpha|/synthetic/media/alpha");
      LogicTestLog.number(name, "Only Documents require stats", 1, files.stats.length);
      expect(files.stats.length).assertEqual(1);
      LogicTestLog.value(name, "Only text stat paths", "/synthetic/media/alpha/report.v2.txt", files.stats.join("|"));
      expect(files.stats.join("|")).assertEqual("/synthetic/media/alpha/report.v2.txt");
      LogicTestLog.number(name, "Album listing never opens files", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "Album listing never creates assets", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      LogicTestLog.value(name, "Album listing leaves synthetic directory unchanged",
        "report.v2.txt|not.txt.bak|sound.mp3.old", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("report.v2.txt|not.txt.bak|sound.mp3.old");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1085
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1085
     * @tc.nameDesc Album counts keep documents text only: Verify fixed album order, exact per-type counts and no audio,
     * image or arbitrary file counted as Documents.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1085", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1085";
      LogicTestLog.begin(name, "album dataset 7; sandbox files p.jpg,v.mp4,opaque,blank.");
      files.names = ["p.jpg","v.mp4","opaque","blank."];
      const photo0: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/album-7-0", photoAccessHelper.PhotoType.IMAGE, "album-0.jpg");
      const photo1: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/album-7-1", photoAccessHelper.PhotoType.VIDEO, "album-1.mp4");
      const firstFetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo0, photo1]);
      const secondFetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo0, photo1]);
      library.results = [firstFetch, secondFetch];
      const albums: AlbumInfo[] = await media.getAlbums(context);
      LogicTestLog.number(name, "Four fixed albums", 4, albums.length);
      expect(albums.length).assertEqual(4);
      LogicTestLog.value(name, "Album order", "Documents|Pictures|Videos|Audios",
        albums.map((item: AlbumInfo) => item.albumName).join("|"));
      expect(albums.map((item: AlbumInfo) => item.albumName).join("|")).assertEqual("Documents|Pictures|Videos|Audios");
      LogicTestLog.value(name, "Album media type order", "4|1|2|3",
        albums.map((item: AlbumInfo) => String(item.mediaType)).join("|"));
      expect(albums.map((item: AlbumInfo) => String(item.mediaType)).join("|")).assertEqual("4|1|2|3");
      LogicTestLog.number(name, "Documents only text suffix", 0, albums[0].count);
      expect(albums[0].count).assertEqual(0);
      LogicTestLog.number(name, "Pictures only image type", 1, albums[1].count);
      expect(albums[1].count).assertEqual(1);
      LogicTestLog.number(name, "Videos only video type", 1, albums[2].count);
      expect(albums[2].count).assertEqual(1);
      LogicTestLog.number(name, "Audios only lowercase mp3 suffix", 0, albums[3].count);
      expect(albums[3].count).assertEqual(0);
      LogicTestLog.number(name, "Separate image and video fetches", 2, library.fetches.length);
      expect(library.fetches.length).assertEqual(2);
      LogicTestLog.number(name, "Image fetch closed", 1, firstFetch.closeCalls);
      expect(firstFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Video fetch closed", 1, secondFetch.closeCalls);
      expect(secondFetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Each fetch read once", 2, firstFetch.allCalls + secondFetch.allCalls);
      expect(firstFetch.allCalls + secondFetch.allCalls).assertEqual(2);
      LogicTestLog.number(name, "Audio and text directory lists", 2, files.lists.length);
      expect(files.lists.length).assertEqual(2);
      LogicTestLog.value(name, "Both sandbox lists use the saved path",
        "/synthetic/media/alpha|/synthetic/media/alpha", files.lists.join("|"));
      expect(files.lists.join("|")).assertEqual("/synthetic/media/alpha|/synthetic/media/alpha");
      LogicTestLog.number(name, "Only Documents require stats", 0, files.stats.length);
      expect(files.stats.length).assertEqual(0);
      LogicTestLog.value(name, "Only text stat paths", "", files.stats.join("|"));
      expect(files.stats.join("|")).assertEqual("");
      LogicTestLog.number(name, "Album listing never opens files", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "Album listing never creates assets", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      LogicTestLog.value(name, "Album listing leaves synthetic directory unchanged",
        "p.jpg|v.mp4|opaque|blank.", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("p.jpg|v.mp4|opaque|blank.");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1086
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1086
     * @tc.nameDesc Listing failures close acquired results and remain retryable: Check existing empty or partial return
     * policy, exact cleanup counts and success after clearing a fake failure.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1086", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1086";
      LogicTestLog.begin(name, "failure=sandbox-list; type=FileType.AUDIO");
      files.names = ['a.txt', 'b.txt', 'tone.mp3'];
      files.mtimes.set('/synthetic/media/alpha/a.txt', 101);
      files.mtimes.set('/synthetic/media/alpha/b.txt', 202);
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/failure-list-0", photoAccessHelper.PhotoType.IMAGE, "failed-0.mp3");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/failure-list-0";
      library.results = [fetch];
      files.listError = 'synthetic list failure';
      const failed: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.AUDIO);
      LogicTestLog.number(name, "Failure result matches existing partial policy", 0, failed.length);
      expect(failed.length).assertEqual(0);
      LogicTestLog.number(name, "Acquired fetch close count on failure", 0, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(0);
      LogicTestLog.number(name, "Object read attempts on failure", 0, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(0);
      LogicTestLog.number(name, "Native fetch attempts on failure", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "Sandbox list attempts on failure", 1, files.lists.length);
      expect(files.lists.length).assertEqual(1);
      LogicTestLog.number(name, "No descriptors while failing listing", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No native create while failing listing", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No native delete while failing listing", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      files.listError = '';
      files.statError = '';
      library.fetchError = '';
      fetch.allError = '';
      fetch.closeError = '';
      photo.getError = '';
      const recovered: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.AUDIO);
      LogicTestLog.number(name, "Retry result count", 1, recovered.length);
      expect(recovered.length).assertEqual(1);
      LogicTestLog.value(name, "Retry result names", "tone.mp3",
        recovered.map((item: MediaAssetHandle) => item.displayName).join("|"));
      expect(recovered.map((item: MediaAssetHandle) => item.displayName).join("|")).assertEqual("tone.mp3");
      LogicTestLog.number(name, "Fetch closed on successful retry", 0, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(0);
      LogicTestLog.number(name, "Retry does not rename files", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.value(name, "Retry leaves all input files available", "a.txt|b.txt|tone.mp3", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("a.txt|b.txt|tone.mp3");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1087
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1087
     * @tc.nameDesc Listing failures close acquired results and remain retryable: Check existing empty or partial return
     * policy, exact cleanup counts and success after clearing a fake failure.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1087", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1087";
      LogicTestLog.begin(name, "failure=sandbox-list; type=FileType.FILE");
      files.names = ['a.txt', 'b.txt', 'tone.mp3'];
      files.mtimes.set('/synthetic/media/alpha/a.txt', 101);
      files.mtimes.set('/synthetic/media/alpha/b.txt', 202);
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/failure-list-1", photoAccessHelper.PhotoType.IMAGE, "failed-1.txt");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/failure-list-1";
      library.results = [fetch];
      files.listError = 'synthetic list failure';
      const failed: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.FILE);
      LogicTestLog.number(name, "Failure result matches existing partial policy", 0, failed.length);
      expect(failed.length).assertEqual(0);
      LogicTestLog.number(name, "Acquired fetch close count on failure", 0, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(0);
      LogicTestLog.number(name, "Object read attempts on failure", 0, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(0);
      LogicTestLog.number(name, "Native fetch attempts on failure", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "Sandbox list attempts on failure", 1, files.lists.length);
      expect(files.lists.length).assertEqual(1);
      LogicTestLog.number(name, "No descriptors while failing listing", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No native create while failing listing", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No native delete while failing listing", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      files.listError = '';
      files.statError = '';
      library.fetchError = '';
      fetch.allError = '';
      fetch.closeError = '';
      photo.getError = '';
      const recovered: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.FILE);
      LogicTestLog.number(name, "Retry result count", 2, recovered.length);
      expect(recovered.length).assertEqual(2);
      LogicTestLog.value(name, "Retry result names", "a.txt|b.txt",
        recovered.map((item: MediaAssetHandle) => item.displayName).join("|"));
      expect(recovered.map((item: MediaAssetHandle) => item.displayName).join("|")).assertEqual("a.txt|b.txt");
      LogicTestLog.number(name, "Fetch closed on successful retry", 0, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(0);
      LogicTestLog.number(name, "Retry does not rename files", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.value(name, "Retry leaves all input files available", "a.txt|b.txt|tone.mp3", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("a.txt|b.txt|tone.mp3");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1088
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1088
     * @tc.nameDesc Listing failures close acquired results and remain retryable: Check existing empty or partial return
     * policy, exact cleanup counts and success after clearing a fake failure.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1088", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1088";
      LogicTestLog.begin(name, "failure=info-list; type=FileType.FILE");
      files.names = ['a.txt', 'b.txt', 'tone.mp3'];
      files.mtimes.set('/synthetic/media/alpha/a.txt', 101);
      files.mtimes.set('/synthetic/media/alpha/b.txt', 202);
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/failure-list-2", photoAccessHelper.PhotoType.IMAGE, "failed-2.txt");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/failure-list-2";
      library.results = [fetch];
      files.listError = 'synthetic list failure';
      const failed: FileInfo[] = await media.getFileAssets(context, FileType.FILE);
      LogicTestLog.number(name, "Failure result matches existing partial policy", 0, failed.length);
      expect(failed.length).assertEqual(0);
      LogicTestLog.number(name, "Acquired fetch close count on failure", 0, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(0);
      LogicTestLog.number(name, "Object read attempts on failure", 0, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(0);
      LogicTestLog.number(name, "Native fetch attempts on failure", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "Sandbox list attempts on failure", 1, files.lists.length);
      expect(files.lists.length).assertEqual(1);
      LogicTestLog.number(name, "No descriptors while failing listing", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No native create while failing listing", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No native delete while failing listing", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      files.listError = '';
      files.statError = '';
      library.fetchError = '';
      fetch.allError = '';
      fetch.closeError = '';
      photo.getError = '';
      const recovered: FileInfo[] = await media.getFileAssets(context, FileType.FILE);
      LogicTestLog.number(name, "Retry result count", 2, recovered.length);
      expect(recovered.length).assertEqual(2);
      LogicTestLog.value(name, "Retry result names", "a.txt|b.txt",
        recovered.map((item: FileInfo) => item.fileName).join("|"));
      expect(recovered.map((item: FileInfo) => item.fileName).join("|")).assertEqual("a.txt|b.txt");
      LogicTestLog.number(name, "Fetch closed on successful retry", 0, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(0);
      LogicTestLog.number(name, "Retry does not rename files", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.value(name, "Retry leaves all input files available", "a.txt|b.txt|tone.mp3", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("a.txt|b.txt|tone.mp3");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1089
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1089
     * @tc.nameDesc Listing failures close acquired results and remain retryable: Check existing empty or partial return
     * policy, exact cleanup counts and success after clearing a fake failure.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1089", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1089";
      LogicTestLog.begin(name, "failure=info-stat; type=FileType.FILE");
      files.names = ['a.txt', 'b.txt', 'tone.mp3'];
      files.mtimes.set('/synthetic/media/alpha/a.txt', 101);
      files.mtimes.set('/synthetic/media/alpha/b.txt', 202);
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/failure-list-3", photoAccessHelper.PhotoType.IMAGE, "failed-3.txt");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/failure-list-3";
      library.results = [fetch];
      files.statError = 'synthetic stat failure';
      files.statErrorPath = '/synthetic/media/alpha/b.txt';
      const failed: FileInfo[] = await media.getFileAssets(context, FileType.FILE);
      LogicTestLog.number(name, "Failure result matches existing partial policy", 1, failed.length);
      expect(failed.length).assertEqual(1);
      LogicTestLog.number(name, "Acquired fetch close count on failure", 0, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(0);
      LogicTestLog.number(name, "Object read attempts on failure", 0, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(0);
      LogicTestLog.number(name, "Native fetch attempts on failure", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "Sandbox list attempts on failure", 1, files.lists.length);
      expect(files.lists.length).assertEqual(1);
      LogicTestLog.number(name, "No descriptors while failing listing", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No native create while failing listing", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No native delete while failing listing", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      files.listError = '';
      files.statError = '';
      library.fetchError = '';
      fetch.allError = '';
      fetch.closeError = '';
      photo.getError = '';
      const recovered: FileInfo[] = await media.getFileAssets(context, FileType.FILE);
      LogicTestLog.number(name, "Retry result count", 2, recovered.length);
      expect(recovered.length).assertEqual(2);
      LogicTestLog.value(name, "Retry result names", "a.txt|b.txt",
        recovered.map((item: FileInfo) => item.fileName).join("|"));
      expect(recovered.map((item: FileInfo) => item.fileName).join("|")).assertEqual("a.txt|b.txt");
      LogicTestLog.number(name, "Fetch closed on successful retry", 0, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(0);
      LogicTestLog.number(name, "Retry does not rename files", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.value(name, "Retry leaves all input files available", "a.txt|b.txt|tone.mp3", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("a.txt|b.txt|tone.mp3");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1090
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1090
     * @tc.nameDesc Listing failures close acquired results and remain retryable: Check existing empty or partial return
     * policy, exact cleanup counts and success after clearing a fake failure.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1090", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1090";
      LogicTestLog.begin(name, "failure=native-fetch; type=FileType.IMAGE");
      files.names = ['a.txt', 'b.txt', 'tone.mp3'];
      files.mtimes.set('/synthetic/media/alpha/a.txt', 101);
      files.mtimes.set('/synthetic/media/alpha/b.txt', 202);
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/failure-list-4", photoAccessHelper.PhotoType.IMAGE, "failed-4.jpg");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/failure-list-4";
      library.results = [fetch];
      library.fetchError = 'synthetic fetch failure';
      const failed: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.IMAGE);
      LogicTestLog.number(name, "Failure result matches existing partial policy", 0, failed.length);
      expect(failed.length).assertEqual(0);
      LogicTestLog.number(name, "Acquired fetch close count on failure", 0, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(0);
      LogicTestLog.number(name, "Object read attempts on failure", 0, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(0);
      LogicTestLog.number(name, "Native fetch attempts on failure", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Sandbox list attempts on failure", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.number(name, "No descriptors while failing listing", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No native create while failing listing", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No native delete while failing listing", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      files.listError = '';
      files.statError = '';
      library.fetchError = '';
      fetch.allError = '';
      fetch.closeError = '';
      photo.getError = '';
      const recovered: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.IMAGE);
      LogicTestLog.number(name, "Retry result count", 1, recovered.length);
      expect(recovered.length).assertEqual(1);
      LogicTestLog.value(name, "Retry result names", "failed-4.jpg",
        recovered.map((item: MediaAssetHandle) => item.displayName).join("|"));
      expect(recovered.map((item: MediaAssetHandle) => item.displayName).join("|")).assertEqual("failed-4.jpg");
      LogicTestLog.number(name, "Fetch closed on successful retry", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Retry does not rename files", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.value(name, "Retry leaves all input files available", "a.txt|b.txt|tone.mp3", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("a.txt|b.txt|tone.mp3");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1091
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1091
     * @tc.nameDesc Listing failures close acquired results and remain retryable: Check existing empty or partial return
     * policy, exact cleanup counts and success after clearing a fake failure.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1091", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1091";
      LogicTestLog.begin(name, "failure=native-fetch; type=FileType.VIDEO");
      files.names = ['a.txt', 'b.txt', 'tone.mp3'];
      files.mtimes.set('/synthetic/media/alpha/a.txt', 101);
      files.mtimes.set('/synthetic/media/alpha/b.txt', 202);
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/failure-list-5", photoAccessHelper.PhotoType.VIDEO, "failed-5.mp4");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/failure-list-5";
      library.results = [fetch];
      library.fetchError = 'synthetic fetch failure';
      const failed: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.VIDEO);
      LogicTestLog.number(name, "Failure result matches existing partial policy", 0, failed.length);
      expect(failed.length).assertEqual(0);
      LogicTestLog.number(name, "Acquired fetch close count on failure", 0, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(0);
      LogicTestLog.number(name, "Object read attempts on failure", 0, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(0);
      LogicTestLog.number(name, "Native fetch attempts on failure", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Sandbox list attempts on failure", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.number(name, "No descriptors while failing listing", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No native create while failing listing", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No native delete while failing listing", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      files.listError = '';
      files.statError = '';
      library.fetchError = '';
      fetch.allError = '';
      fetch.closeError = '';
      photo.getError = '';
      const recovered: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.VIDEO);
      LogicTestLog.number(name, "Retry result count", 1, recovered.length);
      expect(recovered.length).assertEqual(1);
      LogicTestLog.value(name, "Retry result names", "failed-5.mp4",
        recovered.map((item: MediaAssetHandle) => item.displayName).join("|"));
      expect(recovered.map((item: MediaAssetHandle) => item.displayName).join("|")).assertEqual("failed-5.mp4");
      LogicTestLog.number(name, "Fetch closed on successful retry", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Retry does not rename files", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.value(name, "Retry leaves all input files available", "a.txt|b.txt|tone.mp3", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("a.txt|b.txt|tone.mp3");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1092
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1092
     * @tc.nameDesc Listing failures close acquired results and remain retryable: Check existing empty or partial return
     * policy, exact cleanup counts and success after clearing a fake failure.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1092", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1092";
      LogicTestLog.begin(name, "failure=native-all; type=FileType.IMAGE");
      files.names = ['a.txt', 'b.txt', 'tone.mp3'];
      files.mtimes.set('/synthetic/media/alpha/a.txt', 101);
      files.mtimes.set('/synthetic/media/alpha/b.txt', 202);
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/failure-list-6", photoAccessHelper.PhotoType.IMAGE, "failed-6.jpg");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/failure-list-6";
      library.results = [fetch];
      fetch.allError = 'synthetic objects failure';
      const failed: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.IMAGE);
      LogicTestLog.number(name, "Failure result matches existing partial policy", 0, failed.length);
      expect(failed.length).assertEqual(0);
      LogicTestLog.number(name, "Acquired fetch close count on failure", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Object read attempts on failure", 1, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Native fetch attempts on failure", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Sandbox list attempts on failure", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.number(name, "No descriptors while failing listing", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No native create while failing listing", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No native delete while failing listing", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      files.listError = '';
      files.statError = '';
      library.fetchError = '';
      fetch.allError = '';
      fetch.closeError = '';
      photo.getError = '';
      const recovered: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.IMAGE);
      LogicTestLog.number(name, "Retry result count", 1, recovered.length);
      expect(recovered.length).assertEqual(1);
      LogicTestLog.value(name, "Retry result names", "failed-6.jpg",
        recovered.map((item: MediaAssetHandle) => item.displayName).join("|"));
      expect(recovered.map((item: MediaAssetHandle) => item.displayName).join("|")).assertEqual("failed-6.jpg");
      LogicTestLog.number(name, "Fetch closed on successful retry", 2, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(2);
      LogicTestLog.number(name, "Retry does not rename files", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.value(name, "Retry leaves all input files available", "a.txt|b.txt|tone.mp3", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("a.txt|b.txt|tone.mp3");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1093
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1093
     * @tc.nameDesc Listing failures close acquired results and remain retryable: Check existing empty or partial return
     * policy, exact cleanup counts and success after clearing a fake failure.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1093", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1093";
      LogicTestLog.begin(name, "failure=native-all; type=FileType.VIDEO");
      files.names = ['a.txt', 'b.txt', 'tone.mp3'];
      files.mtimes.set('/synthetic/media/alpha/a.txt', 101);
      files.mtimes.set('/synthetic/media/alpha/b.txt', 202);
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/failure-list-7", photoAccessHelper.PhotoType.VIDEO, "failed-7.mp4");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/failure-list-7";
      library.results = [fetch];
      fetch.allError = 'synthetic objects failure';
      const failed: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.VIDEO);
      LogicTestLog.number(name, "Failure result matches existing partial policy", 0, failed.length);
      expect(failed.length).assertEqual(0);
      LogicTestLog.number(name, "Acquired fetch close count on failure", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Object read attempts on failure", 1, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Native fetch attempts on failure", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Sandbox list attempts on failure", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.number(name, "No descriptors while failing listing", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No native create while failing listing", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No native delete while failing listing", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      files.listError = '';
      files.statError = '';
      library.fetchError = '';
      fetch.allError = '';
      fetch.closeError = '';
      photo.getError = '';
      const recovered: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.VIDEO);
      LogicTestLog.number(name, "Retry result count", 1, recovered.length);
      expect(recovered.length).assertEqual(1);
      LogicTestLog.value(name, "Retry result names", "failed-7.mp4",
        recovered.map((item: MediaAssetHandle) => item.displayName).join("|"));
      expect(recovered.map((item: MediaAssetHandle) => item.displayName).join("|")).assertEqual("failed-7.mp4");
      LogicTestLog.number(name, "Fetch closed on successful retry", 2, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(2);
      LogicTestLog.number(name, "Retry does not rename files", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.value(name, "Retry leaves all input files available", "a.txt|b.txt|tone.mp3", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("a.txt|b.txt|tone.mp3");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1094
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1094
     * @tc.nameDesc Listing failures close acquired results and remain retryable: Check existing empty or partial return
     * policy, exact cleanup counts and success after clearing a fake failure.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1094", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1094";
      LogicTestLog.begin(name, "failure=native-metadata; type=FileType.IMAGE");
      files.names = ['a.txt', 'b.txt', 'tone.mp3'];
      files.mtimes.set('/synthetic/media/alpha/a.txt', 101);
      files.mtimes.set('/synthetic/media/alpha/b.txt', 202);
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/failure-list-8", photoAccessHelper.PhotoType.IMAGE, "failed-8.jpg");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/failure-list-8";
      library.results = [fetch];
      photo.getError = 'synthetic metadata failure';
      const failed: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.IMAGE);
      LogicTestLog.number(name, "Failure result matches existing partial policy", 0, failed.length);
      expect(failed.length).assertEqual(0);
      LogicTestLog.number(name, "Acquired fetch close count on failure", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Object read attempts on failure", 1, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Native fetch attempts on failure", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Sandbox list attempts on failure", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.number(name, "No descriptors while failing listing", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No native create while failing listing", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No native delete while failing listing", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      files.listError = '';
      files.statError = '';
      library.fetchError = '';
      fetch.allError = '';
      fetch.closeError = '';
      photo.getError = '';
      const recovered: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.IMAGE);
      LogicTestLog.number(name, "Retry result count", 1, recovered.length);
      expect(recovered.length).assertEqual(1);
      LogicTestLog.value(name, "Retry result names", "failed-8.jpg",
        recovered.map((item: MediaAssetHandle) => item.displayName).join("|"));
      expect(recovered.map((item: MediaAssetHandle) => item.displayName).join("|")).assertEqual("failed-8.jpg");
      LogicTestLog.number(name, "Fetch closed on successful retry", 2, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(2);
      LogicTestLog.number(name, "Retry does not rename files", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.value(name, "Retry leaves all input files available", "a.txt|b.txt|tone.mp3", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("a.txt|b.txt|tone.mp3");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1095
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1095
     * @tc.nameDesc Listing failures close acquired results and remain retryable: Check existing empty or partial return
     * policy, exact cleanup counts and success after clearing a fake failure.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1095", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1095";
      LogicTestLog.begin(name, "failure=native-close; type=FileType.VIDEO");
      files.names = ['a.txt', 'b.txt', 'tone.mp3'];
      files.mtimes.set('/synthetic/media/alpha/a.txt', 101);
      files.mtimes.set('/synthetic/media/alpha/b.txt', 202);
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/failure-list-9", photoAccessHelper.PhotoType.VIDEO, "failed-9.mp4");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/failure-list-9";
      library.results = [fetch];
      fetch.closeError = 'synthetic close failure';
      const failed: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.VIDEO);
      LogicTestLog.number(name, "Failure result matches existing partial policy", 1, failed.length);
      expect(failed.length).assertEqual(1);
      LogicTestLog.number(name, "Acquired fetch close count on failure", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Object read attempts on failure", 1, fetch.allCalls);
      expect(fetch.allCalls).assertEqual(1);
      LogicTestLog.number(name, "Native fetch attempts on failure", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Sandbox list attempts on failure", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.number(name, "No descriptors while failing listing", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No native create while failing listing", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No native delete while failing listing", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      files.listError = '';
      files.statError = '';
      library.fetchError = '';
      fetch.allError = '';
      fetch.closeError = '';
      photo.getError = '';
      const recovered: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.VIDEO);
      LogicTestLog.number(name, "Retry result count", 1, recovered.length);
      expect(recovered.length).assertEqual(1);
      LogicTestLog.value(name, "Retry result names", "failed-9.mp4",
        recovered.map((item: MediaAssetHandle) => item.displayName).join("|"));
      expect(recovered.map((item: MediaAssetHandle) => item.displayName).join("|")).assertEqual("failed-9.mp4");
      LogicTestLog.number(name, "Fetch closed on successful retry", 2, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(2);
      LogicTestLog.number(name, "Retry does not rename files", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.value(name, "Retry leaves all input files available", "a.txt|b.txt|tone.mp3", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("a.txt|b.txt|tone.mp3");
      LogicTestLog.end(name);
    });
  });
}
