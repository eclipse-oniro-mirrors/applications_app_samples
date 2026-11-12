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

import { common } from '@kit.AbilityKit';
import { photoAccessHelper, PhotoSource, RecentPhotoOptions } from '@kit.MediaLibraryKit';
import { ImageEditEngine } from './feature/ImageEditEngine';
import { MediaMeta, EditParams, EditOutcome, CacheFile, ExportResult } from './feature/MediaModels';
import { PhotoAccessFeature } from './feature/PhotoAccessFeature';
import { PickerOptionFactory } from './feature/PickerOptionFactory';
import { SandboxStore } from './feature/SandboxStore';
import { Logger } from '../utils/Logger';
import { Trace } from '../utils/Trace';

// Module tag attached to every log line emitted by the facade.
const TAG: string = 'PhotoPickerFeature';

/**
 * Single entry of the module. Scenes only talk to this facade.
 * Every method is a thin pass-through: no condition, default value or return shape is changed here,
 * the facade only adds the module tag to the log stream and a trace slice around the delegation.
 */
export class PhotoPickerFeature {
  /**
   * Builds the sendable recent photo options of the recent scene.
   * @param period Requested window in seconds.
   * @param source Album the query is limited to.
   * @param autoRefresh Whether the system may refresh the result on its own.
   * @returns Options object accepted by the recent photo API.
   */
  static createRecentOptions(period: number, source: PhotoSource, autoRefresh: boolean): RecentPhotoOptions {
    // Log the entry with the normalised period only, no user data is included.
    Logger.debug(TAG, 'createRecentOptions period ' + period);
    // Delegate to the factory, which owns the defaulting rules.
    return PickerOptionFactory.createRecentPhotoOptions(period, source, autoRefresh);
  }

  /**
   * Builds the main thread recent photo options of the recent scene.
   * @param period Requested window in seconds.
   * @param source Album the query is limited to.
   * @returns Options object accepted by getRecentPhotoInfo.
   */
  static createRecentQuery(period: number, source: PhotoSource): photoAccessHelper.RecentPhotoOptions {
    // Log the entry with the requested period only.
    Logger.debug(TAG, 'createRecentQuery period ' + period);
    // Delegate to the factory, which owns the defaulting rules.
    return PickerOptionFactory.createRecentQueryOptions(period, source);
  }

  /**
   * Opens the full-screen system picker.
   * @param maxSelectNumber Maximum number of selectable assets.
   * @returns Uris granted to the caller by the picker.
   */
  static async pickFullScreen(maxSelectNumber: number): Promise<string[]> {
    // Open the trace slice of the facade entry, it nests inside the feature slice.
    Trace.start('PhotoPickerFeature.pickFullScreen');
    try {
      // Delegate to the access helper, the tracer of the helper still runs on its own.
      return await PhotoAccessFeature.pickFullScreen(maxSelectNumber);
    } finally {
      // Always close the facade slice so the trace file stays balanced.
      Trace.finish('PhotoPickerFeature.pickFullScreen');
    }
  }

  /**
   * Returns the newest asset inside the time window.
   * @param context Context used to reach the media library.
   * @param periodSeconds Length of the accepted window in seconds.
   * @param source Album the asset must belong to.
   * @returns Metadata of the newest matching asset, undefined when nothing matches.
   */
  static async queryNewest(context: common.Context, periodSeconds: number,
    source: PhotoSource): Promise<MediaMeta | undefined> {
    // Open the trace slice of the facade entry.
    Trace.start('PhotoPickerFeature.queryNewest');
    try {
      // Delegate to the access helper, which applies the window filter.
      return await PhotoAccessFeature.queryNewest(context, periodSeconds, source);
    } finally {
      // Always close the facade slice so the trace file stays balanced.
      Trace.finish('PhotoPickerFeature.queryNewest');
    }
  }

  /**
   * Queries one page of the media library.
   * @param context Context used to reach the media library.
   * @param offset Zero based position of the first asset.
   * @param pageSize Number of assets requested for the page.
   * @returns Metadata of the assets of the requested page.
   */
  static async queryPage(context: common.Context, offset: number, pageSize: number): Promise<MediaMeta[]> {
    // Open the trace slice of the facade entry.
    Trace.start('PhotoPickerFeature.queryPage');
    try {
      // Delegate to the access helper, which runs the paged query.
      return await PhotoAccessFeature.queryPage(context, offset, pageSize);
    } finally {
      // Always close the facade slice so the trace file stays balanced.
      Trace.finish('PhotoPickerFeature.queryPage');
    }
  }

  /**
   * Queries metadata of picker granted uris.
   * @param context Context used to reach the media library.
   * @param uris Uris returned by the system picker.
   * @returns One metadata entry per readable uri.
   */
  static async queryByUris(context: common.Context, uris: string[]): Promise<MediaMeta[]> {
    // Open the trace slice of the facade entry.
    Trace.start('PhotoPickerFeature.queryByUris');
    try {
      // Delegate to the access helper, which queries the uris one by one.
      return await PhotoAccessFeature.queryByUris(context, uris);
    } finally {
      // Always close the facade slice so the trace file stays balanced.
      Trace.finish('PhotoPickerFeature.queryByUris');
    }
  }

  /**
   * Passes the recent photo query through to the kit.
   * @param context Context used to reach the media library.
   * @param options Optional recent photo options.
   * @returns Recent photo info produced by the system.
   */
  static async queryRecentInfo(context: common.Context,
    options?: photoAccessHelper.RecentPhotoOptions): Promise<photoAccessHelper.RecentPhotoInfo> {
    // Open the trace slice of the facade entry.
    Trace.start('PhotoPickerFeature.queryRecentInfo');
    try {
      // Delegate to the access helper, which forwards the options unchanged.
      return await PhotoAccessFeature.getRecentInfo(context, options);
    } finally {
      // Always close the facade slice so the trace file stays balanced.
      Trace.finish('PhotoPickerFeature.queryRecentInfo');
    }
  }

  /**
   * Creates and initialises an image editing engine.
   * @param context Context bound to the sendable access helper.
   * @returns Initialised engine ready for process() and exportOriginals().
   */
  static createEngine(context: common.Context): ImageEditEngine {
    // Open the trace slice of the facade entry, the helper creation is a kit call.
    Trace.start('PhotoPickerFeature.createEngine');
    try {
      // Create the engine instance bound to the calling context.
      const engine: ImageEditEngine = new ImageEditEngine();
      // Initialise the engine so the sendable helper is created once.
      engine.init(context);
      // Log the creation event without any path or uri.
      Logger.info(TAG, 'createEngine done');
      // Hand the ready engine back to the caller.
      return engine;
    } finally {
      // Always close the facade slice so the trace file stays balanced.
      Trace.finish('PhotoPickerFeature.createEngine');
    }
  }

  /**
   * Lists the cached output files.
   * @param context Context whose files directory hosts the output folder.
   * @returns One entry per cached file, newest first.
   */
  static listOutputs(context: common.Context): CacheFile[] {
    // Delegate to the sandbox store, which owns the directory scan and its trace slice.
    return SandboxStore.list(context);
  }

  /**
   * Sums the size of the cached output files.
   * @param files Entries returned by listOutputs().
   * @returns Total size in bytes.
   */
  static totalOutputSize(files: CacheFile[]): number {
    // Delegate to the sandbox store, a pure computation without a trace slice.
    return SandboxStore.totalSize(files);
  }

  /**
   * Resolves the output directory of the sample.
   * @param context Context whose files directory hosts the output folder.
   * @returns Absolute path of the output directory.
   */
  static outputDir(context: common.Context): string {
    // Delegate to the sandbox store, which also creates the directory when missing.
    return SandboxStore.outputDir(context);
  }

  /**
   * Writes a byte buffer into the output directory.
   * @param context Context whose files directory hosts the output folder.
   * @param buffer Bytes to write.
   * @param fileName Name of the target file.
   * @returns Absolute path of the written file.
   */
  static saveBuffer(context: common.Context, buffer: ArrayBuffer, fileName: string): string {
    // Delegate to the sandbox store, which owns the write and its trace slice.
    return SandboxStore.saveBuffer(context, buffer, fileName);
  }

  /**
   * Deletes one cached file.
   * @param path Absolute path of the file to delete.
   */
  static removeOutput(path: string): void {
    // Delegate to the sandbox store, which owns the unlink call and its trace slice.
    SandboxStore.remove(path);
  }

  /**
   * Deletes every cached output file.
   * @param context Context whose files directory hosts the output folder.
   */
  static clearOutputs(context: common.Context): void {
    // Delegate to the sandbox store, which owns the cleanup loop and its trace slice.
    SandboxStore.clear(context);
  }
}

export {
  MediaMeta,
  EditParams,
  EditOutcome,
  CacheFile,
  ExportResult,
  ImageEditEngine,
  PhotoAccessFeature,
  SandboxStore
};
