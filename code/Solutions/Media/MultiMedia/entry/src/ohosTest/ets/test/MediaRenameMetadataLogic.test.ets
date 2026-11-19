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
import type { MediaAssetHandle } from '../../../main/ets/model/MediaUtils';
import { LogicTestLog } from '../utils/LogicTestLog';
import {
  MediaTrace, FakeMediaClock, FakeMediaFiles, FakeMediaPhoto, FakeMediaFetch, FakeMediaLibrary, mediaContext
} from '../utils/MediaFakes';

export default function MediaRenameMetadataLogic(): void {
  describe("MediaRenameMetadataLogic", () => {
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
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1140
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1140
     * @tc.nameDesc Sandbox rename preserves extension exactly once: Verify native source and target, extension rules,
     * independent handle snapshots and new descriptor path.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1140", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1140";
      LogicTestLog.begin(name, "alpha.txt -> beta");
      files.names = ["alpha.txt", 'untouched.bin'];
      files.mtimes.set("/synthetic/media/alpha/alpha.txt", 501);
      const initial: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.FILE);
      const snapshot: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.FILE);
      const handle: MediaAssetHandle = initial[0];
      trace.clear();
      await handle.rename("beta");
      LogicTestLog.number(name, "Exactly one filesystem rename", 1, files.renames.length);
      expect(files.renames.length).assertEqual(1);
      LogicTestLog.value(name, "Rename source is original URI", "/synthetic/media/alpha/alpha.txt",
        files.renames[0].source);
      expect(files.renames[0].source).assertEqual("/synthetic/media/alpha/alpha.txt");
      LogicTestLog.value(name, "Rename target uses extension rule", "/synthetic/media/alpha/beta.txt",
        files.renames[0].target);
      expect(files.renames[0].target).assertEqual("/synthetic/media/alpha/beta.txt");
      LogicTestLog.value(name, "Exposed URI updates after success", "/synthetic/media/alpha/beta.txt", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/beta.txt");
      LogicTestLog.value(name, "Exposed display name updates after success", "beta.txt", handle.displayName);
      expect(handle.displayName).assertEqual("beta.txt");
      LogicTestLog.number(name, "Rename retains media type", 4, handle.mediaType);
      expect(handle.mediaType).assertEqual(4);
      LogicTestLog.value(name, "Independent snapshot URI does not change", "/synthetic/media/alpha/alpha.txt",
        snapshot[0].uri);
      expect(snapshot[0].uri).assertEqual("/synthetic/media/alpha/alpha.txt");
      LogicTestLog.value(name, "Independent snapshot display name does not change", "alpha.txt",
        snapshot[0].displayName);
      expect(snapshot[0].displayName).assertEqual("alpha.txt");
      LogicTestLog.flag(name, "Snapshots use independent handle objects", handle !== snapshot[0]);
      expect(handle !== snapshot[0]).assertTrue();
      LogicTestLog.value(name, "Only renamed file changes in directory", "beta.txt|untouched.bin",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("beta.txt|untouched.bin");
      LogicTestLog.number(name, "Mtime follows successful rename", 501,
        Number(files.mtimes.get("/synthetic/media/alpha/beta.txt")));
      expect(Number(files.mtimes.get("/synthetic/media/alpha/beta.txt"))).assertEqual(501);
      LogicTestLog.value(name, "Rename does not implicitly open a descriptor", "files.rename", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename");
      const fd: number = await media.getFdPath(handle);
      await handle.close(fd);
      LogicTestLog.value(name, "Post-rename open uses updated URI", "/synthetic/media/alpha/beta.txt",
        files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/alpha/beta.txt");
      LogicTestLog.number(name, "Post-rename open flags", fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Post-rename close fd", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
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
      LogicTestLog.value(name, "Rename then descriptor operation order",
        "files.rename|files.open|files.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename|files.open|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1141
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1141
     * @tc.nameDesc Sandbox rename preserves extension exactly once: Verify native source and target, extension rules,
     * independent handle snapshots and new descriptor path.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1141", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1141";
      LogicTestLog.begin(name, "alpha.txt -> beta.txt");
      files.names = ["alpha.txt", 'untouched.bin'];
      files.mtimes.set("/synthetic/media/alpha/alpha.txt", 502);
      const initial: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.FILE);
      const snapshot: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.FILE);
      const handle: MediaAssetHandle = initial[0];
      trace.clear();
      await handle.rename("beta.txt");
      LogicTestLog.number(name, "Exactly one filesystem rename", 1, files.renames.length);
      expect(files.renames.length).assertEqual(1);
      LogicTestLog.value(name, "Rename source is original URI", "/synthetic/media/alpha/alpha.txt",
        files.renames[0].source);
      expect(files.renames[0].source).assertEqual("/synthetic/media/alpha/alpha.txt");
      LogicTestLog.value(name, "Rename target uses extension rule", "/synthetic/media/alpha/beta.txt",
        files.renames[0].target);
      expect(files.renames[0].target).assertEqual("/synthetic/media/alpha/beta.txt");
      LogicTestLog.value(name, "Exposed URI updates after success", "/synthetic/media/alpha/beta.txt", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/beta.txt");
      LogicTestLog.value(name, "Exposed display name updates after success", "beta.txt", handle.displayName);
      expect(handle.displayName).assertEqual("beta.txt");
      LogicTestLog.number(name, "Rename retains media type", 4, handle.mediaType);
      expect(handle.mediaType).assertEqual(4);
      LogicTestLog.value(name, "Independent snapshot URI does not change", "/synthetic/media/alpha/alpha.txt",
        snapshot[0].uri);
      expect(snapshot[0].uri).assertEqual("/synthetic/media/alpha/alpha.txt");
      LogicTestLog.value(name, "Independent snapshot display name does not change", "alpha.txt",
        snapshot[0].displayName);
      expect(snapshot[0].displayName).assertEqual("alpha.txt");
      LogicTestLog.flag(name, "Snapshots use independent handle objects", handle !== snapshot[0]);
      expect(handle !== snapshot[0]).assertTrue();
      LogicTestLog.value(name, "Only renamed file changes in directory", "beta.txt|untouched.bin",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("beta.txt|untouched.bin");
      LogicTestLog.number(name, "Mtime follows successful rename", 502,
        Number(files.mtimes.get("/synthetic/media/alpha/beta.txt")));
      expect(Number(files.mtimes.get("/synthetic/media/alpha/beta.txt"))).assertEqual(502);
      LogicTestLog.value(name, "Rename does not implicitly open a descriptor", "files.rename", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename");
      const fd: number = await media.getFdPath(handle);
      await handle.close(fd);
      LogicTestLog.value(name, "Post-rename open uses updated URI", "/synthetic/media/alpha/beta.txt",
        files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/alpha/beta.txt");
      LogicTestLog.number(name, "Post-rename open flags", fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Post-rename close fd", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
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
      LogicTestLog.value(name, "Rename then descriptor operation order",
        "files.rename|files.open|files.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename|files.open|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1142
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1142
     * @tc.nameDesc Sandbox rename preserves extension exactly once: Verify native source and target, extension rules,
     * independent handle snapshots and new descriptor path.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1142", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1142";
      LogicTestLog.begin(name, "alpha.txt -> beta.TXT");
      files.names = ["alpha.txt", 'untouched.bin'];
      files.mtimes.set("/synthetic/media/alpha/alpha.txt", 503);
      const initial: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.FILE);
      const snapshot: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.FILE);
      const handle: MediaAssetHandle = initial[0];
      trace.clear();
      await handle.rename("beta.TXT");
      LogicTestLog.number(name, "Exactly one filesystem rename", 1, files.renames.length);
      expect(files.renames.length).assertEqual(1);
      LogicTestLog.value(name, "Rename source is original URI", "/synthetic/media/alpha/alpha.txt",
        files.renames[0].source);
      expect(files.renames[0].source).assertEqual("/synthetic/media/alpha/alpha.txt");
      LogicTestLog.value(name, "Rename target uses extension rule", "/synthetic/media/alpha/beta.TXT.txt",
        files.renames[0].target);
      expect(files.renames[0].target).assertEqual("/synthetic/media/alpha/beta.TXT.txt");
      LogicTestLog.value(name, "Exposed URI updates after success", "/synthetic/media/alpha/beta.TXT.txt", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/beta.TXT.txt");
      LogicTestLog.value(name, "Exposed display name updates after success", "beta.TXT.txt", handle.displayName);
      expect(handle.displayName).assertEqual("beta.TXT.txt");
      LogicTestLog.number(name, "Rename retains media type", 4, handle.mediaType);
      expect(handle.mediaType).assertEqual(4);
      LogicTestLog.value(name, "Independent snapshot URI does not change", "/synthetic/media/alpha/alpha.txt",
        snapshot[0].uri);
      expect(snapshot[0].uri).assertEqual("/synthetic/media/alpha/alpha.txt");
      LogicTestLog.value(name, "Independent snapshot display name does not change", "alpha.txt",
        snapshot[0].displayName);
      expect(snapshot[0].displayName).assertEqual("alpha.txt");
      LogicTestLog.flag(name, "Snapshots use independent handle objects", handle !== snapshot[0]);
      expect(handle !== snapshot[0]).assertTrue();
      LogicTestLog.value(name, "Only renamed file changes in directory", "beta.TXT.txt|untouched.bin",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("beta.TXT.txt|untouched.bin");
      LogicTestLog.number(name, "Mtime follows successful rename", 503,
        Number(files.mtimes.get("/synthetic/media/alpha/beta.TXT.txt")));
      expect(Number(files.mtimes.get("/synthetic/media/alpha/beta.TXT.txt"))).assertEqual(503);
      LogicTestLog.value(name, "Rename does not implicitly open a descriptor", "files.rename", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename");
      const fd: number = await media.getFdPath(handle);
      await handle.close(fd);
      LogicTestLog.value(name, "Post-rename open uses updated URI", "/synthetic/media/alpha/beta.TXT.txt",
        files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/alpha/beta.TXT.txt");
      LogicTestLog.number(name, "Post-rename open flags", fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Post-rename close fd", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
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
      LogicTestLog.value(name, "Rename then descriptor operation order",
        "files.rename|files.open|files.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename|files.open|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1143
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1143
     * @tc.nameDesc Sandbox rename preserves extension exactly once: Verify native source and target, extension rules,
     * independent handle snapshots and new descriptor path.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1143", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1143";
      LogicTestLog.begin(name, "report.v2.txt -> final.v3");
      files.names = ["report.v2.txt", 'untouched.bin'];
      files.mtimes.set("/synthetic/media/alpha/report.v2.txt", 504);
      const initial: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.FILE);
      const snapshot: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.FILE);
      const handle: MediaAssetHandle = initial[0];
      trace.clear();
      await handle.rename("final.v3");
      LogicTestLog.number(name, "Exactly one filesystem rename", 1, files.renames.length);
      expect(files.renames.length).assertEqual(1);
      LogicTestLog.value(name, "Rename source is original URI", "/synthetic/media/alpha/report.v2.txt",
        files.renames[0].source);
      expect(files.renames[0].source).assertEqual("/synthetic/media/alpha/report.v2.txt");
      LogicTestLog.value(name, "Rename target uses extension rule", "/synthetic/media/alpha/final.v3.txt",
        files.renames[0].target);
      expect(files.renames[0].target).assertEqual("/synthetic/media/alpha/final.v3.txt");
      LogicTestLog.value(name, "Exposed URI updates after success", "/synthetic/media/alpha/final.v3.txt", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/final.v3.txt");
      LogicTestLog.value(name, "Exposed display name updates after success", "final.v3.txt", handle.displayName);
      expect(handle.displayName).assertEqual("final.v3.txt");
      LogicTestLog.number(name, "Rename retains media type", 4, handle.mediaType);
      expect(handle.mediaType).assertEqual(4);
      LogicTestLog.value(name, "Independent snapshot URI does not change",
        "/synthetic/media/alpha/report.v2.txt", snapshot[0].uri);
      expect(snapshot[0].uri).assertEqual("/synthetic/media/alpha/report.v2.txt");
      LogicTestLog.value(name, "Independent snapshot display name does not change", "report.v2.txt",
        snapshot[0].displayName);
      expect(snapshot[0].displayName).assertEqual("report.v2.txt");
      LogicTestLog.flag(name, "Snapshots use independent handle objects", handle !== snapshot[0]);
      expect(handle !== snapshot[0]).assertTrue();
      LogicTestLog.value(name, "Only renamed file changes in directory", "final.v3.txt|untouched.bin",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("final.v3.txt|untouched.bin");
      LogicTestLog.number(name, "Mtime follows successful rename", 504,
        Number(files.mtimes.get("/synthetic/media/alpha/final.v3.txt")));
      expect(Number(files.mtimes.get("/synthetic/media/alpha/final.v3.txt"))).assertEqual(504);
      LogicTestLog.value(name, "Rename does not implicitly open a descriptor", "files.rename", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename");
      const fd: number = await media.getFdPath(handle);
      await handle.close(fd);
      LogicTestLog.value(name, "Post-rename open uses updated URI", "/synthetic/media/alpha/final.v3.txt",
        files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/alpha/final.v3.txt");
      LogicTestLog.number(name, "Post-rename open flags", fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Post-rename close fd", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
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
      LogicTestLog.value(name, "Rename then descriptor operation order",
        "files.rename|files.open|files.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename|files.open|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1144
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1144
     * @tc.nameDesc Sandbox rename preserves extension exactly once: Verify native source and target, extension rules,
     * independent handle snapshots and new descriptor path.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1144", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1144";
      LogicTestLog.begin(name, "tone.mp3 -> next.mp3");
      files.names = ["tone.mp3", 'untouched.bin'];
      files.mtimes.set("/synthetic/media/alpha/tone.mp3", 505);
      const initial: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.AUDIO);
      const snapshot: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.AUDIO);
      const handle: MediaAssetHandle = initial[0];
      trace.clear();
      await handle.rename("next.mp3");
      LogicTestLog.number(name, "Exactly one filesystem rename", 1, files.renames.length);
      expect(files.renames.length).assertEqual(1);
      LogicTestLog.value(name, "Rename source is original URI", "/synthetic/media/alpha/tone.mp3",
        files.renames[0].source);
      expect(files.renames[0].source).assertEqual("/synthetic/media/alpha/tone.mp3");
      LogicTestLog.value(name, "Rename target uses extension rule", "/synthetic/media/alpha/next.mp3",
        files.renames[0].target);
      expect(files.renames[0].target).assertEqual("/synthetic/media/alpha/next.mp3");
      LogicTestLog.value(name, "Exposed URI updates after success", "/synthetic/media/alpha/next.mp3", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/next.mp3");
      LogicTestLog.value(name, "Exposed display name updates after success", "next.mp3", handle.displayName);
      expect(handle.displayName).assertEqual("next.mp3");
      LogicTestLog.number(name, "Rename retains media type", 3, handle.mediaType);
      expect(handle.mediaType).assertEqual(3);
      LogicTestLog.value(name, "Independent snapshot URI does not change", "/synthetic/media/alpha/tone.mp3",
        snapshot[0].uri);
      expect(snapshot[0].uri).assertEqual("/synthetic/media/alpha/tone.mp3");
      LogicTestLog.value(name, "Independent snapshot display name does not change", "tone.mp3",
        snapshot[0].displayName);
      expect(snapshot[0].displayName).assertEqual("tone.mp3");
      LogicTestLog.flag(name, "Snapshots use independent handle objects", handle !== snapshot[0]);
      expect(handle !== snapshot[0]).assertTrue();
      LogicTestLog.value(name, "Only renamed file changes in directory", "next.mp3|untouched.bin",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("next.mp3|untouched.bin");
      LogicTestLog.number(name, "Mtime follows successful rename", 505,
        Number(files.mtimes.get("/synthetic/media/alpha/next.mp3")));
      expect(Number(files.mtimes.get("/synthetic/media/alpha/next.mp3"))).assertEqual(505);
      LogicTestLog.value(name, "Rename does not implicitly open a descriptor", "files.rename", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename");
      const fd: number = await media.getFdPath(handle);
      await handle.close(fd);
      LogicTestLog.value(name, "Post-rename open uses updated URI", "/synthetic/media/alpha/next.mp3",
        files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/alpha/next.mp3");
      LogicTestLog.number(name, "Post-rename open flags", fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Post-rename close fd", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
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
      LogicTestLog.value(name, "Rename then descriptor operation order",
        "files.rename|files.open|files.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename|files.open|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1145
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1145
     * @tc.nameDesc Sandbox rename preserves extension exactly once: Verify native source and target, extension rules,
     * independent handle snapshots and new descriptor path.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1145", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1145";
      LogicTestLog.begin(name, "tone.mp3 -> next");
      files.names = ["tone.mp3", 'untouched.bin'];
      files.mtimes.set("/synthetic/media/alpha/tone.mp3", 506);
      const initial: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.AUDIO);
      const snapshot: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.AUDIO);
      const handle: MediaAssetHandle = initial[0];
      trace.clear();
      await handle.rename("next");
      LogicTestLog.number(name, "Exactly one filesystem rename", 1, files.renames.length);
      expect(files.renames.length).assertEqual(1);
      LogicTestLog.value(name, "Rename source is original URI", "/synthetic/media/alpha/tone.mp3",
        files.renames[0].source);
      expect(files.renames[0].source).assertEqual("/synthetic/media/alpha/tone.mp3");
      LogicTestLog.value(name, "Rename target uses extension rule", "/synthetic/media/alpha/next.mp3",
        files.renames[0].target);
      expect(files.renames[0].target).assertEqual("/synthetic/media/alpha/next.mp3");
      LogicTestLog.value(name, "Exposed URI updates after success", "/synthetic/media/alpha/next.mp3", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/next.mp3");
      LogicTestLog.value(name, "Exposed display name updates after success", "next.mp3", handle.displayName);
      expect(handle.displayName).assertEqual("next.mp3");
      LogicTestLog.number(name, "Rename retains media type", 3, handle.mediaType);
      expect(handle.mediaType).assertEqual(3);
      LogicTestLog.value(name, "Independent snapshot URI does not change", "/synthetic/media/alpha/tone.mp3",
        snapshot[0].uri);
      expect(snapshot[0].uri).assertEqual("/synthetic/media/alpha/tone.mp3");
      LogicTestLog.value(name, "Independent snapshot display name does not change", "tone.mp3",
        snapshot[0].displayName);
      expect(snapshot[0].displayName).assertEqual("tone.mp3");
      LogicTestLog.flag(name, "Snapshots use independent handle objects", handle !== snapshot[0]);
      expect(handle !== snapshot[0]).assertTrue();
      LogicTestLog.value(name, "Only renamed file changes in directory", "next.mp3|untouched.bin",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("next.mp3|untouched.bin");
      LogicTestLog.number(name, "Mtime follows successful rename", 506,
        Number(files.mtimes.get("/synthetic/media/alpha/next.mp3")));
      expect(Number(files.mtimes.get("/synthetic/media/alpha/next.mp3"))).assertEqual(506);
      LogicTestLog.value(name, "Rename does not implicitly open a descriptor", "files.rename", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename");
      const fd: number = await media.getFdPath(handle);
      await handle.close(fd);
      LogicTestLog.value(name, "Post-rename open uses updated URI", "/synthetic/media/alpha/next.mp3",
        files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/alpha/next.mp3");
      LogicTestLog.number(name, "Post-rename open flags", fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Post-rename close fd", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
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
      LogicTestLog.value(name, "Rename then descriptor operation order",
        "files.rename|files.open|files.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename|files.open|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1146
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1146
     * @tc.nameDesc Sandbox rename preserves extension exactly once: Verify native source and target, extension rules,
     * independent handle snapshots and new descriptor path.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1146", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1146";
      LogicTestLog.begin(name, "mix.v2.mp3 -> mix.v3.mp3");
      files.names = ["mix.v2.mp3", 'untouched.bin'];
      files.mtimes.set("/synthetic/media/alpha/mix.v2.mp3", 507);
      const initial: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.AUDIO);
      const snapshot: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.AUDIO);
      const handle: MediaAssetHandle = initial[0];
      trace.clear();
      await handle.rename("mix.v3.mp3");
      LogicTestLog.number(name, "Exactly one filesystem rename", 1, files.renames.length);
      expect(files.renames.length).assertEqual(1);
      LogicTestLog.value(name, "Rename source is original URI", "/synthetic/media/alpha/mix.v2.mp3",
        files.renames[0].source);
      expect(files.renames[0].source).assertEqual("/synthetic/media/alpha/mix.v2.mp3");
      LogicTestLog.value(name, "Rename target uses extension rule", "/synthetic/media/alpha/mix.v3.mp3",
        files.renames[0].target);
      expect(files.renames[0].target).assertEqual("/synthetic/media/alpha/mix.v3.mp3");
      LogicTestLog.value(name, "Exposed URI updates after success", "/synthetic/media/alpha/mix.v3.mp3", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/mix.v3.mp3");
      LogicTestLog.value(name, "Exposed display name updates after success", "mix.v3.mp3", handle.displayName);
      expect(handle.displayName).assertEqual("mix.v3.mp3");
      LogicTestLog.number(name, "Rename retains media type", 3, handle.mediaType);
      expect(handle.mediaType).assertEqual(3);
      LogicTestLog.value(name, "Independent snapshot URI does not change",
        "/synthetic/media/alpha/mix.v2.mp3", snapshot[0].uri);
      expect(snapshot[0].uri).assertEqual("/synthetic/media/alpha/mix.v2.mp3");
      LogicTestLog.value(name, "Independent snapshot display name does not change", "mix.v2.mp3",
        snapshot[0].displayName);
      expect(snapshot[0].displayName).assertEqual("mix.v2.mp3");
      LogicTestLog.flag(name, "Snapshots use independent handle objects", handle !== snapshot[0]);
      expect(handle !== snapshot[0]).assertTrue();
      LogicTestLog.value(name, "Only renamed file changes in directory", "mix.v3.mp3|untouched.bin",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("mix.v3.mp3|untouched.bin");
      LogicTestLog.number(name, "Mtime follows successful rename", 507,
        Number(files.mtimes.get("/synthetic/media/alpha/mix.v3.mp3")));
      expect(Number(files.mtimes.get("/synthetic/media/alpha/mix.v3.mp3"))).assertEqual(507);
      LogicTestLog.value(name, "Rename does not implicitly open a descriptor", "files.rename", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename");
      const fd: number = await media.getFdPath(handle);
      await handle.close(fd);
      LogicTestLog.value(name, "Post-rename open uses updated URI", "/synthetic/media/alpha/mix.v3.mp3",
        files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/alpha/mix.v3.mp3");
      LogicTestLog.number(name, "Post-rename open flags", fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Post-rename close fd", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
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
      LogicTestLog.value(name, "Rename then descriptor operation order",
        "files.rename|files.open|files.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename|files.open|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1147
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1147
     * @tc.nameDesc Sandbox rename preserves extension exactly once: Verify native source and target, extension rules,
     * independent handle snapshots and new descriptor path.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1147", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1147";
      LogicTestLog.begin(name, "tone.mp3 -> sound.wav");
      files.names = ["tone.mp3", 'untouched.bin'];
      files.mtimes.set("/synthetic/media/alpha/tone.mp3", 508);
      const initial: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.AUDIO);
      const snapshot: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.AUDIO);
      const handle: MediaAssetHandle = initial[0];
      trace.clear();
      await handle.rename("sound.wav");
      LogicTestLog.number(name, "Exactly one filesystem rename", 1, files.renames.length);
      expect(files.renames.length).assertEqual(1);
      LogicTestLog.value(name, "Rename source is original URI", "/synthetic/media/alpha/tone.mp3",
        files.renames[0].source);
      expect(files.renames[0].source).assertEqual("/synthetic/media/alpha/tone.mp3");
      LogicTestLog.value(name, "Rename target uses extension rule", "/synthetic/media/alpha/sound.wav.mp3",
        files.renames[0].target);
      expect(files.renames[0].target).assertEqual("/synthetic/media/alpha/sound.wav.mp3");
      LogicTestLog.value(name, "Exposed URI updates after success", "/synthetic/media/alpha/sound.wav.mp3", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/sound.wav.mp3");
      LogicTestLog.value(name, "Exposed display name updates after success", "sound.wav.mp3", handle.displayName);
      expect(handle.displayName).assertEqual("sound.wav.mp3");
      LogicTestLog.number(name, "Rename retains media type", 3, handle.mediaType);
      expect(handle.mediaType).assertEqual(3);
      LogicTestLog.value(name, "Independent snapshot URI does not change", "/synthetic/media/alpha/tone.mp3",
        snapshot[0].uri);
      expect(snapshot[0].uri).assertEqual("/synthetic/media/alpha/tone.mp3");
      LogicTestLog.value(name, "Independent snapshot display name does not change", "tone.mp3",
        snapshot[0].displayName);
      expect(snapshot[0].displayName).assertEqual("tone.mp3");
      LogicTestLog.flag(name, "Snapshots use independent handle objects", handle !== snapshot[0]);
      expect(handle !== snapshot[0]).assertTrue();
      LogicTestLog.value(name, "Only renamed file changes in directory", "sound.wav.mp3|untouched.bin",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("sound.wav.mp3|untouched.bin");
      LogicTestLog.number(name, "Mtime follows successful rename", 508,
        Number(files.mtimes.get("/synthetic/media/alpha/sound.wav.mp3")));
      expect(Number(files.mtimes.get("/synthetic/media/alpha/sound.wav.mp3"))).assertEqual(508);
      LogicTestLog.value(name, "Rename does not implicitly open a descriptor", "files.rename", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename");
      const fd: number = await media.getFdPath(handle);
      await handle.close(fd);
      LogicTestLog.value(name, "Post-rename open uses updated URI", "/synthetic/media/alpha/sound.wav.mp3",
        files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/alpha/sound.wav.mp3");
      LogicTestLog.number(name, "Post-rename open flags", fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Post-rename close fd", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
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
      LogicTestLog.value(name, "Rename then descriptor operation order",
        "files.rename|files.open|files.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename|files.open|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1148
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1148
     * @tc.nameDesc Sandbox rename preserves extension exactly once: Verify native source and target, extension rules,
     * independent handle snapshots and new descriptor path.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1148", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1148";
      LogicTestLog.begin(name, ".txt -> hidden");
      files.names = [".txt", 'untouched.bin'];
      files.mtimes.set("/synthetic/media/alpha/.txt", 509);
      const initial: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.FILE);
      const snapshot: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.FILE);
      const handle: MediaAssetHandle = initial[0];
      trace.clear();
      await handle.rename("hidden");
      LogicTestLog.number(name, "Exactly one filesystem rename", 1, files.renames.length);
      expect(files.renames.length).assertEqual(1);
      LogicTestLog.value(name, "Rename source is original URI", "/synthetic/media/alpha/.txt", files.renames[0].source);
      expect(files.renames[0].source).assertEqual("/synthetic/media/alpha/.txt");
      LogicTestLog.value(name, "Rename target uses extension rule", "/synthetic/media/alpha/hidden",
        files.renames[0].target);
      expect(files.renames[0].target).assertEqual("/synthetic/media/alpha/hidden");
      LogicTestLog.value(name, "Exposed URI updates after success", "/synthetic/media/alpha/hidden", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/hidden");
      LogicTestLog.value(name, "Exposed display name updates after success", "hidden", handle.displayName);
      expect(handle.displayName).assertEqual("hidden");
      LogicTestLog.number(name, "Rename retains media type", 4, handle.mediaType);
      expect(handle.mediaType).assertEqual(4);
      LogicTestLog.value(name, "Independent snapshot URI does not change", "/synthetic/media/alpha/.txt",
        snapshot[0].uri);
      expect(snapshot[0].uri).assertEqual("/synthetic/media/alpha/.txt");
      LogicTestLog.value(name, "Independent snapshot display name does not change", ".txt", snapshot[0].displayName);
      expect(snapshot[0].displayName).assertEqual(".txt");
      LogicTestLog.flag(name, "Snapshots use independent handle objects", handle !== snapshot[0]);
      expect(handle !== snapshot[0]).assertTrue();
      LogicTestLog.value(name, "Only renamed file changes in directory", "hidden|untouched.bin", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("hidden|untouched.bin");
      LogicTestLog.number(name, "Mtime follows successful rename", 509,
        Number(files.mtimes.get("/synthetic/media/alpha/hidden")));
      expect(Number(files.mtimes.get("/synthetic/media/alpha/hidden"))).assertEqual(509);
      LogicTestLog.value(name, "Rename does not implicitly open a descriptor", "files.rename", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename");
      const fd: number = await media.getFdPath(handle);
      await handle.close(fd);
      LogicTestLog.value(name, "Post-rename open uses updated URI", "/synthetic/media/alpha/hidden",
        files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/alpha/hidden");
      LogicTestLog.number(name, "Post-rename open flags", fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Post-rename close fd", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
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
      LogicTestLog.value(name, "Rename then descriptor operation order",
        "files.rename|files.open|files.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename|files.open|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1149
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1149
     * @tc.nameDesc Sandbox rename preserves extension exactly once: Verify native source and target, extension rules,
     * independent handle snapshots and new descriptor path.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1149", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1149";
      LogicTestLog.begin(name, ".mp3 -> hidden");
      files.names = [".mp3", 'untouched.bin'];
      files.mtimes.set("/synthetic/media/alpha/.mp3", 510);
      const initial: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.AUDIO);
      const snapshot: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.AUDIO);
      const handle: MediaAssetHandle = initial[0];
      trace.clear();
      await handle.rename("hidden");
      LogicTestLog.number(name, "Exactly one filesystem rename", 1, files.renames.length);
      expect(files.renames.length).assertEqual(1);
      LogicTestLog.value(name, "Rename source is original URI", "/synthetic/media/alpha/.mp3", files.renames[0].source);
      expect(files.renames[0].source).assertEqual("/synthetic/media/alpha/.mp3");
      LogicTestLog.value(name, "Rename target uses extension rule", "/synthetic/media/alpha/hidden",
        files.renames[0].target);
      expect(files.renames[0].target).assertEqual("/synthetic/media/alpha/hidden");
      LogicTestLog.value(name, "Exposed URI updates after success", "/synthetic/media/alpha/hidden", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/hidden");
      LogicTestLog.value(name, "Exposed display name updates after success", "hidden", handle.displayName);
      expect(handle.displayName).assertEqual("hidden");
      LogicTestLog.number(name, "Rename retains media type", 3, handle.mediaType);
      expect(handle.mediaType).assertEqual(3);
      LogicTestLog.value(name, "Independent snapshot URI does not change", "/synthetic/media/alpha/.mp3",
        snapshot[0].uri);
      expect(snapshot[0].uri).assertEqual("/synthetic/media/alpha/.mp3");
      LogicTestLog.value(name, "Independent snapshot display name does not change", ".mp3", snapshot[0].displayName);
      expect(snapshot[0].displayName).assertEqual(".mp3");
      LogicTestLog.flag(name, "Snapshots use independent handle objects", handle !== snapshot[0]);
      expect(handle !== snapshot[0]).assertTrue();
      LogicTestLog.value(name, "Only renamed file changes in directory", "hidden|untouched.bin", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("hidden|untouched.bin");
      LogicTestLog.number(name, "Mtime follows successful rename", 510,
        Number(files.mtimes.get("/synthetic/media/alpha/hidden")));
      expect(Number(files.mtimes.get("/synthetic/media/alpha/hidden"))).assertEqual(510);
      LogicTestLog.value(name, "Rename does not implicitly open a descriptor", "files.rename", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename");
      const fd: number = await media.getFdPath(handle);
      await handle.close(fd);
      LogicTestLog.value(name, "Post-rename open uses updated URI", "/synthetic/media/alpha/hidden",
        files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/alpha/hidden");
      LogicTestLog.number(name, "Post-rename open flags", fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Post-rename close fd", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
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
      LogicTestLog.value(name, "Rename then descriptor operation order",
        "files.rename|files.open|files.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.rename|files.open|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1150
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1150
     * @tc.nameDesc Sandbox rename preserves extension exactly once: Verify native source and target, extension rules,
     * independent handle snapshots and new descriptor path.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1150", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1150";
      LogicTestLog.begin(name, "alpha.txt -> synthetic note");
      files.names = ["alpha.txt", 'untouched.bin'];
      files.mtimes.set("/synthetic/media/alpha/alpha.txt", 511);
      const initial: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.FILE);
      const snapshot: MediaAssetHandle[] = await media.getFileAssetsFromType(FileType.FILE);
      const handle: MediaAssetHandle = initial[0];
      trace.clear();
      await handle.rename("synthetic note");
      LogicTestLog.number(name, "Exactly one filesystem rename", 1, files.renames.length);
      expect(files.renames.length).assertEqual(1);
      LogicTestLog.value(name, "Rename source is original URI", "/synthetic/media/alpha/alpha.txt",
        files.renames[0].source);
      expect(files.renames[0].source).assertEqual("/synthetic/media/alpha/alpha.txt");
      LogicTestLog.value(name, "Rename target uses extension rule",