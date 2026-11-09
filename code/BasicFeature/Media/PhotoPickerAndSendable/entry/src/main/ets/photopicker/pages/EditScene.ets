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
import { image } from '@kit.ImageKit';
import { promptAction } from '@kit.ArkUI';
import {
    EditOutcome,
    EditParams,
    ImageEditEngine,
    Logger,
    MediaFilterType,
    PhotoPickerFeature,
    Trace
} from 'photopickersendable';
import { selectionStore, SelectionStore } from '../data/SelectionStore';
import { FormatUtil } from '../data/FormatUtil';

// Module-scoped log tag, so editor lines can be filtered out of the shared hilog stream.
const TAG: string = 'EditScene';
// Fallback preview ratio (4:3), used until the real image size is known so the box keeps a height.
const DEFAULT_RATIO: number = 4 / 3;
// Percent base that converts a slider value into the multiplier expected by the engine.
const FULL_PERCENT: number = 100;
// Stroke width in vp of the crop outline, thick enough to read on top of any photo.
const CROP_STROKE: number = 2;
// Smallest normalized crop extent that still yields a meaningful output image.
const MIN_CROP_EXTENT: number = 0.02;
// Minimum delay in ms between two crop logs, so a drag does not flood hilog.
const GESTURE_LOG_INTERVAL: number = 200;

/**
 * One filter chip: the engine filter value plus its localized label.
 * Kept as a class because Repeat needs a stable object identity for every row.
 */
class FilterEntry {
    /** Filter value handed to the engine when this chip is selected. */
    type: MediaFilterType;
    /** Localized label rendered inside the chip button. */
    label: Resource;

    /**
     * Creates a filter chip descriptor.
     * @param type Filter value consumed by the engine.
     * @param label Localized label shown on the chip.
     */
    constructor(type: MediaFilterType, label: Resource) {
        // Remember the filter value so the click handler can assign it to the state field.
        this.type = type;
        // Remember the label resource so the builder renders it without extra lookups.
        this.label = label;
    }
}

/**
 * Payload reported by Image.onComplete; only the intrinsic pixel size matters here.
 * Declared locally because the callback hands the fields over as a plain object.
 */
interface ImageLoadInfo {
    /** Intrinsic width of the decoded image in pixels. */
    width: number;
    /** Intrinsic height of the decoded image in pixels. */
    height: number;
}

/**
 * Non-destructive image editor page.
 * The page only collects edit parameters (crop, rotation, filter, tone, watermark, output settings)
 * and delegates the heavy work to ImageEditEngine, which runs it on a worker thread.
 * Logging and tracing are attached at the page level: lifecycle, gesture callbacks,
 * the asynchronous processing run and the sandbox write.
 */
@ComponentV2
export struct EditScene {
    /** Ability context needed by the engine for the helper and by the save helper for the sandbox. */
    private context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;
    /** Shared cross-scene selection store, used to resolve the default edit source. */
    private store: SelectionStore = selectionStore;
    /** Engine instance created in aboutToAppear; null means the page is not usable yet. */
    private engine: ImageEditEngine | null = null;
    /** Ordered filter chip descriptors, the array order defines the rendered order. */
    private filters: FilterEntry[] = [
        // Original keeps the source colors untouched and is the default selection.
        new FilterEntry(MediaFilterType.ORIGINAL, $r('app.string.pp_filter_original')),
        // Grayscale conversion, the cheapest preset of the set.
        new FilterEntry(MediaFilterType.GRAY, $r('app.string.pp_filter_gray')),
        // Color inversion, kept as a demo of a full color matrix override.
        new FilterEntry(MediaFilterType.INVERT, $r('app.string.pp_filter_invert')),
        // Warm tone shift, raises the red channel gain.
        new FilterEntry(MediaFilterType.WARM, $r('app.string.pp_filter_warm')),
        // Cool tone shift, raises the blue channel gain.
        new FilterEntry(MediaFilterType.COOL, $r('app.string.pp_filter_cool')),
        // High contrast preset for a punchier look.
        new FilterEntry(MediaFilterType.HIGH_CONTRAST, $r('app.string.pp_filter_high_contrast'))
    ];
    /** Rotation options in degrees; the engine accepts exactly these quarter turns. */
    private rotations: number[] = [0, 90, 180, 270];
    /** Long edge limits in pixels offered to the user for the output size. */
    private maxEdges: number[] = [800, 1600, 2400];
    /** Uri of the image being edited; empty renders the "no source" hint instead of the editor. */
    @Local sourceUri: string = '';
    /** Aspect ratio of the preview image so the crop overlay maps onto the real pixels. */
    @Local previewRatio: number = DEFAULT_RATIO;
    /** Measured preview width in vp, required to normalize touch positions on the horizontal axis. */
    @Local previewW: number = 0;
    /** Measured preview height in vp, required to normalize touch positions on the vertical axis. */
    @Local previewH: number = 0;
    /** True when the crop rectangle is large enough to be forwarded to the engine. */
    @Local cropActive: boolean = false;
    /** Normalized left edge of the crop rectangle, in the range 0..1. */
    @Local cropLeft: number = 0;
    /** Normalized top edge of the crop rectangle, in the range 0..1. */
    @Local cropTop: number = 0;
    /** Normalized right edge of the crop rectangle, in the range 0..1. */
    @Local cropRight: number = 1;
    /** Normalized bottom edge of the crop rectangle, in the range 0..1. */
    @Local cropBottom: number = 1;
    /** Clockwise rotation in degrees, always one of the values in rotations. */
    @Local rotation: number = 0;
    /** Selected color filter, forwarded to the engine on every processing run. */
    @Local filter: MediaFilterType = MediaFilterType.ORIGINAL;
    /** Brightness offset in percent, zero means untouched. */
    @Local brightnessValue: number = 0;
    /** Contrast in percent, one hundred means untouched. */
    @Local contrastValue: number = FULL_PERCENT;
    /** Saturation in percent, one hundred means untouched. */
    @Local saturation: number = FULL_PERCENT;
    /** Optional watermark text drawn on the output; empty means no watermark. */
    @Local watermark: string = '';
    /** JPEG quality in percent used by the encoder. */
    @Local quality: number = 80;
    /** Long edge limit in pixels of the processed output. */
    @Local maxEdge: number = 1600;
    /** True while a run is in flight; it also disables the process button. */
    @Local busy: boolean = false;
    /** Pixel map of the last processed result; null hides the whole result card. */
    @Local resultMap: image.PixelMap | null = null;
    /** Width in pixels of the processed result, shown in the result stats. */
    @Local resultWidth: number = 0;
    /** Height in pixels of the processed result, shown in the result stats. */
    @Local resultHeight: number = 0;
    /** Worker thread cost in milliseconds reported by the engine for the last run. */
    @Local workerCost: number = 0;
    /** Decode cost in milliseconds reported by the engine for the last run. */
    @Local decodeCost: number = 0;
    /** Encoded size in bytes of the source image, used for the compression ratio line. */
    @Local sourceBytes: number = 0;
    /** Encoded size in bytes of the processed image. */
    @Local outputBytes: number = 0;
    /** Encoded JPEG buffer of the result, kept so the save action does not re-encode. */
    @Local outputBuffer: ArrayBuffer | null = null;
    /** Sandbox path of the last saved file; empty hides the saved hint. */
    @Local savedPath: string = '';
    /** Horizontal anchor of the current crop drag, in preview local coordinates. */
    private cropStartX: number = 0;
    /** Vertical anchor of the current crop drag, in preview local coordinates. */
    private cropStartY: number = 0;
    /** Timestamp of the last throttled crop log, so a drag does not flood hilog. */
    private lastGestureLogAt: number = 0;

    /**
     * Creates the engine and resolves the image to edit from the shared selection store.
     * Runs once per page instance, so all one-time setup lives here.
     */
    aboutToAppear(): void {
        // Trace the page setup, engine creation plus state seeding happens on the UI thread.
        Trace.withSync('EditScene.aboutToAppear', () => {
            // Create the engine synchronously; it owns the worker thread used for processing.
            this.engine = PhotoPickerFeature.createEngine(this.context);
            // Prefer the uri handed over by another scene, otherwise fall back to the first selection.
            const candidate: string = this.store.editSource.length > 0 ? this.store.editSource : this.store.firstUri();
            // Only seed the editor when a usable uri exists, otherwise the empty state must stay visible.
            if (candidate.length > 0) {
                // Store the uri in the local state so the preview image can render it.
                this.sourceUri = candidate;
                // Publish the uri back to the store so every scene agrees on the current edit target.
                this.store.setEditSource(candidate);
            }
            // Log only the presence of a source; the uri itself is user data and stays out of hilog.
            Logger.info(TAG, 'aboutToAppear hasSource: ' + (candidate.length > 0 ? 'true' : 'false') +
                ', selection: ' + String(this.store.count()));
        });
    }

    /**
     * Releases the native pixel map and the engine so the worker thread can be torn down.
     */
    aboutToDisappear(): void {
        // Trace the teardown so native releases appear next to the setup slice in the trace view.
        Trace.withSync('EditScene.aboutToDisappear', () => {
            // Release the result pixel map first, an unreleased native buffer would leak device memory.
            if (this.resultMap !== null) {
                // Free the native memory held by the last processed image.
                this.resultMap.release();
                // Drop the reference so the result card disappears with the page.
                this.resultMap = null;
            }
            // Release the engine last because it still owns the worker thread and its caches.
            if (this.engine !== null) {
                // Stop the worker and free the engine side resources.
                this.engine.release();
                // Null the field so a late callback cannot reuse a released engine.
                this.engine = null;
            }
            // Report the teardown; sizes are omitted because they describe user content.
            Logger.info(TAG, 'aboutToDisappear resources released');
        });
    }

    /**
     * Converts the drag anchor and the current touch point into a normalized crop rectangle.
     * @param currentX Horizontal touch position in preview local coordinates.
     * @param currentY Vertical touch position in preview local coordinates.
     */
    private applyCrop(currentX: number, currentY: number): void {
        // Without a measured preview the normalization would divide by zero, so skip the update.
        if (this.previewW <= 0 || this.previewH <= 0) {
            // Debug level only, this happens on the first frame before layout is measured.
            Logger.debug(TAG, 'applyCrop skipped, preview size: ' + String(this.previewW) + 'x' + String(this.previewH));
            // Leave the previous crop rectangle untouched.
            return;
        }
        // Clamp the left edge so the rectangle never leaves the preview.
        const x1: number = Math.max(0, Math.min(this.cropStartX, currentX));
        // Clamp the right edge the same way, min/max order keeps a zero-width rectangle valid.
        const x2: number = Math.min(this.previewW, Math.max(this.cropStartX, currentX));
        // Clamp the top edge so the crop cannot start above the image.
        const y1: number = Math.max(0, Math.min(this.cropStartY, currentY));
        // Clamp the bottom edge so the crop cannot extend below the image.
        const y2: number = Math.min(this.previewH, Math.max(this.cropStartY, currentY));
        // Normalize the left edge because the engine expects fractions, not view coordinates.
        this.cropLeft = x1 / this.previewW;
        // Normalize the right edge for the same reason.
        this.cropRight = x2 / this.previewW;
        // Normalize the top edge against the preview height.
        this.cropTop = y1 / this.previewH;
        // Normalize the bottom edge against the preview height.
        this.cropBottom = y2 / this.previewH;
        // A crop narrower than the minimum extent would produce a degenerate output image.
        this.cropActive = this.cropRight - this.cropLeft > MIN_CROP_EXTENT &&
            this.cropBottom - this.cropTop > MIN_CROP_EXTENT;
        // Throttle the debug log, the gesture fires on every move and would flood hilog.
        const now: number = Date.now();
        // Emit at most one line per throttle interval.
        if (now - this.lastGestureLogAt >= GESTURE_LOG_INTERVAL) {
            // Refresh the throttle stamp only when a line is actually emitted.
            this.lastGestureLogAt = now;
            // Log the stage and the flag only, raw coordinates are view data and stay out of hilog.
            Logger.debug(TAG, 'applyCrop updated, active: ' + (this.cropActive ? 'true' : 'false'));
        }
    }

    /**
     * Restores the full-image crop rectangle and hides the crop overlay.
     */
    private resetCrop(): void {
        // Reset the left edge to the image border.
        this.cropLeft = 0;
        // Reset the top edge to the image border.
        this.cropTop = 0;
        // Reset the right edge to the full width.
        this.cropRight = 1;
        // Reset the bottom edge to the full height.
        this.cropBottom = 1;
        // Deactivate the crop so the engine receives the full image on the next run.
        this.cropActive = false;
        // Record the user interaction so the reset is visible in hilog.
        Logger.info(TAG, 'resetCrop done');
    }

    /**
     * Returns the crop rectangle width expressed in preview pixels.
     * @returns Width in vp of the current crop, used to size the overlay rectangle.
     */
    private cropWidthPx(): number {
        // Scale the normalized width back to the measured preview width.
        return (this.cropRight - this.cropLeft) * this.previewW;
    }

    /**
     * Returns the crop rectangle height expressed in preview pixels.
     * @returns Height in vp of the current crop, used to size the overlay rectangle.
     */
    private cropHeightPx(): number {
        // Scale the normalized height back to the measured preview height.
        return (this.cropBottom - this.cropTop) * this.previewH;
    }

    /**
     * Returns the aspect ratio of the last processed result for the result thumbnail.
     * @returns Width divided by height, or the default ratio while no result exists.
     */
    private resultRatio(): number {
        // Without a valid result size the default ratio keeps the thumbnail box stable.
        if (this.resultWidth <= 0 || this.resultHeight <= 0) {
            // Fall back to the same ratio as the editor preview.
            return DEFAULT_RATIO;
        }
        // Use the real output ratio so the thumbnail is never letterboxed.
        return this.resultWidth / this.resultHeight;
    }

    /**
     * Forwards the current edit parameters to the engine and publishes the processed result.
     * Asynchronous because the engine decodes, filters and encodes on a worker thread.
     */
    private async runProcess(): Promise<void> {
        // Read the engine once so a concurrent release cannot turn the field null mid-run.
        const engine: ImageEditEngine | null = this.engine;
        // Refuse to start without an engine, without a source, or while another run is active.
        if (engine === null || this.sourceUri.length === 0 || this.busy) {
            // Warn with the three guard flags so a rejected tap is easy to explain from hilog.
            Logger.warn(TAG, 'runProcess skipped, engine: ' + (engine === null ? 'null' : 'ready') +
                ', hasSource: ' + (this.sourceUri.length > 0 ? 'true' : 'false') +
                ', busy: ' + (this.busy ? 'true' : 'false'));
            // Return early so the busy flag is not touched by a rejected call.
            return;
        }
        // Mark the run as active, which also disables the process button in the UI.
        this.busy = true;
        // Build the parameter object expected by the engine; a fresh instance avoids stale fields.
        const params: EditParams = new EditParams();
        // Forward the quarter turn selected by the user.
        params.rotation = this.rotation;
        // Send a zero left edge when no crop is active so the engine keeps the full image.
        params.cropLeft = this.cropActive ? this.cropLeft : 0;
        // Send a zero top edge when no crop is active.
        params.cropTop = this.cropActive ? this.cropTop : 0;
        // Send a full right edge when no crop is active.
        params.cropRight = this.cropActive ? this.cropRight : 1;
        // Send a full bottom edge when no crop is active.
        params.cropBottom = this.cropActive ? this.cropBottom : 1;
        // Forward the selected color filter preset.
        params.filter = this.filter;
        // Convert the brightness percent back into a multiplier the engine understands.
        params.brightness = this.brightnessValue / FULL_PERCENT;
        // Convert the contrast percent into a multiplier.
        params.contrast = this.contrastValue / FULL_PERCENT;
        // Convert the saturation percent into a multiplier.
        params.saturation = this.saturation / FULL_PERCENT;
        // Forward the optional watermark text; an empty string means no watermark.
        params.watermark = this.watermark;
        // Forward the JPEG quality percent.
        params.quality = this.quality;
        // Forward the long edge limit used to downscale the output.
        params.maxEdge = this.maxEdge;
        // Trace the whole run because decode, filtering and encode are CPU intensive.
        const traceName: string = 'EditScene.runProcess';
        // Open the asynchronous slice; it is closed in the finally block below.
        const traceId: number = Trace.begin(traceName);
        // Log the launch stage with the parameter flags only, never the pixel content.
        Logger.info(TAG, 'runProcess start, filter: ' + params.filter + ', rotation: ' + String(params.rotation) +
            ', crop: ' + (this.cropActive ? 'true' : 'false') + ', quality: ' + String(params.quality) +
            ', maxEdge: ' + String(params.maxEdge));
        try {
            // Await the worker result; this is the only place where the UI awaits native work.
            const outcome: EditOutcome = await engine.process(this.sourceUri, params);
            // Release the previous pixel map before replacing it, otherwise native memory grows per run.
            if (this.resultMap !== null) {
                // Free the native buffer of the outdated preview.
                this.resultMap.release();
            }
            // Publish the new pixel map so the result card can render it.
            this.resultMap = outcome.pixelMap;
            // Publish the output width for the stats and the thumbnail ratio.
            this.resultWidth = outcome.output.width;
            // Publish the output height for the stats and the thumbnail ratio.
            this.resultHeight = outcome.output.height;
            // Publish the source encoded size so the compression ratio stays comparable.
            this.sourceBytes = outcome.output.sourceByteLength;
            // Publish the output encoded size for the size line.
            this.outputBytes = outcome.output.byteLength;
            // Publish the worker cost so the user can see the off-main-thread time.
            this.workerCost = outcome.workerCost;
            // Publish the decode cost so the user can see where the time was spent.
            this.decodeCost = outcome.decodeCost;
            // Keep the encoded buffer so the save action can write it without re-encoding.
            this.outputBuffer = outcome.output.buffer;
            // Clear the previous saved path because the result changed and must be saved again.
            this.savedPath = '';
            // Log sizes and timings only, the pixel data itself must never reach hilog.
            Logger.info(TAG, 'runProcess done, bytes: ' + String(this.outputBytes) +
                ', dims: ' + String(this.resultWidth) + 'x' + String(this.resultHeight) +
                ', workerMs: ' + String(this.workerCost) + ', decodeMs: ' + String(this.decodeCost));
        } catch (error) {
            // Report the failure text; engine messages carry no user content by design.
            Logger.error(TAG, 'runProcess failed: ' + String(error));
            // Tell the user that the edit failed, the previous result stays visible.
            promptAction.showToast({
                // Localized failure text so the user is not left with a silent no-op.
                message: $r('app.string.pp_edit_process_failed'),
                // Keep the toast short, it only reports a transient failure.
                duration: 2000
            });
        } finally {
            // Close the async slice on both the success and the failure path.
            Trace.end(traceName, traceId);
            // Always clear the busy flag so the button becomes usable again.
            this.busy = false;
        }
    }

    /**
     * Writes the encoded result buffer into the application sandbox.
     * Synchronous because writing one JPEG is cheap and the UI needs the returned path.
     */
    private saveResult(): void {
        // Read the encoded buffer once; null means nothing has been processed yet.
        const buffer: ArrayBuffer | null = this.outputBuffer;
        // Without a buffer there is nothing to write, so the tap becomes a no-op.
        if (buffer === null) {
            // Warn so a stray tap on the save button is visible in hilog.
            Logger.warn(TAG, 'saveResult skipped, no output buffer');
            // Stop before touching the file system.
            return;
        }
        // Trace the write because file IO is the slowest part of the save action.
        Trace.withSync('EditScene.saveResult', () => {
            try {
                // Build a unique file name from the timestamp so repeated saves never overwrite.
                const fileName: string = 'edit_' + String(Date.now()) + '.jpg';
                // Write the buffer into the sandbox and keep the returned path for the hint text.
                this.savedPath = PhotoPickerFeature.saveBuffer(this.context, buffer, fileName);
                // Confirm the save to the user with a short toast.
                promptAction.showToast({
                    // Localized confirmation text.
                    message: $r('app.string.pp_edit_saved_toast'),
                    // Short duration because the saved path is also shown in the result card.
                    duration: 2000
                });
                // Log the file name and the byte count only, the sandbox path stays out of hilog.
                Logger.info(TAG, 'saveResult done, file: ' + fileName + ', bytes: ' + String(this.outputBytes));
            } catch (error) {
                // Report the write failure; the message contains no media payload.
                Logger.error(TAG, 'saveResult failed: ' + String(error));
            }
        });
    }

    /**
     * Renders the filter chips, the selected chip is highlighted with the brand color.
     */
    @Builder
    filterChips() {
        // Horizontal chip strip, the 8vp gap keeps the capsules visually separated.
        Row({ space: '8vp' }) {
            // Repeat over the static filter list so the chips keep stable keys across renders.
            Repeat<FilterEntry>(this.filters)
                .each((repeatItem: RepeatItem<FilterEntry>) => {
                    // One capsule button per preset, the label is a localized resource.
                    Button(repeatItem.item.label)
                        // Stable identifier used by the UI tests of the sample.
                        .id('id_edit_filter_' + String(repeatItem.index))
                        // Fixed compact height and horizontal padding keep six chips on one line.
                        .height('32vp')
                        .padding({ left: '12vp', right: '12vp' })
                        // Capsule shape matches the rest of the sample controls.
                        .type(ButtonType.Capsule)
                        // Caption size is needed for six chips to fit a phone width.
                        .fontSize($r('app.float.pp_font_caption'))
                        // Highlight the active preset with the brand color, others stay on the card color.
                        .backgroundColor(this.filter === repeatItem.item.type ?
                            $r('app.color.pp_brand') : $r('app.color.pp_card'))
                        // Invert the label color on the active chip so it stays readable.
                        .fontColor(this.filter === repeatItem.item.type ?
                            $r('app.color.pp_card') : $r('app.color.pp_text_primary'))
                        .onClick(() => {
                            // Store the preset; the real pixel work happens later in runProcess.
                            this.filter = repeatItem.item.type;
                            // Log the chip index and the preset name, both are configuration data.
                            Logger.debug(TAG, 'filterChips selected, index: ' + String(repeatItem.index) +
                                ', type: ' + String(repeatItem.item.type));
                        })
                })
                // Key on the filter value so Repeat can diff the chips without re-creating them.
                .key((item: FilterEntry): string => item.type)
        }
        // Full width so the chip strip spans the padded column.
        .width('100%')
    }

    /**
     * Renders the rotation chips, one per supported quarter turn.
     */
    @Builder
    rotationChips() {
        // Horizontal strip with the same gap as the other chip rows.
        Row({ space: '8vp' }) {
            // Repeat over the fixed rotation values.
            Repeat<number>(this.rotations)
                .each((repeatItem: RepeatItem<number>) => {
                    // One button per angle, the label already carries the degree sign.
                    Button(String(repeatItem.item) + '°')
                        // Stable identifier used by the UI tests of the sample.
                        .id('id_edit_rotation_' + String(repeatItem.index))
                        // Fixed compact height and equal weight let all four angles fit one line.
                        .height('32vp')
                        .layoutWeight(1)
                        // Capsule shape consistent with the other controls.
                        .type(ButtonType.Capsule)
                        // Caption size keeps four labels readable on a narrow screen.
                        .fontSize($r('app.float.pp_font_caption'))
                        // Highlight the active angle with the brand color.
                        .backgroundColor(this.rotation === repeatItem.item ?
                            $r('app.color.pp_brand') : $r('app.color.pp_card'))
                        // Invert the label color on the active chip.
                        .fontColor(this.rotation === repeatItem.item ?
                            $r('app.color.pp_card') : $r('app.color.pp_text_primary'))
                        .onClick(() => {
                            // Store the angle; the pixel rotation is applied by the engine on the next run.
                            this.rotation = repeatItem.item;
                            // Log the chosen angle, which is configuration data rather than user data.
                            Logger.debug(TAG, 'rotationChips selected, degrees: ' + String(repeatItem.item));
                        })
                })
                // Key on the angle value so the chips are reused instead of rebuilt.
                .key((item: number): string => String(item))
        }
        // Full width so the chip strip spans the padded column.
        .width('100%')
    }

    /**
     * Renders the long edge limit chips used to control the output resolution.
     */
    @Builder
    maxEdgeChips() {
        // Horizontal strip with the standard chip gap.
        Row({ space: '8vp' }) {
            // Repeat over the fixed long edge options.
            Repeat<number>(this.maxEdges)
                .each((repeatItem: RepeatItem<number>) => {
                    // One button per limit, the raw pixel value is the label.
                    Button(String(repeatItem.item))
                        // Stable identifier used by the UI tests of the sample.
                        .id('id_edit_max_edge_' + String(repeatItem.index))
                        // Fixed compact height and equal weight keep the options on one line.
                        .height('32vp')
                        .layoutWeight(1)
                        // Capsule shape consistent with the rest of the page.
                        .type(ButtonType.Capsule)
                        // Caption size keeps the numeric labels readable.
                        .fontSize($r('app.float.pp_font_caption'))
                        // Highlight the active limit with the brand color.
                        .backgroundColor(this.maxEdge === repeatItem.item ?
                            $r('app.color.pp_brand') : $r('app.color.pp_card'))
                        // Invert the label color on the active chip.
                        .fontColor(this.maxEdge === repeatItem.item ?
                            $r('app.color.pp_card') : $r('app.color.pp_text_primary'))
                        .onClick(() => {
                            // Store the limit; the actual downscale happens inside the engine.
                            this.maxEdge = repeatItem.item;
                            // Log the chosen limit, which is configuration data only.
                            Logger.debug(TAG, 'maxEdgeChips selected, value: ' + String(repeatItem.item));
                        })
                })
                // Key on the numeric value so the chips are reused across renders.
                .key((item: number): string => String(item))
        }
        // Full width so the chip strip spans the padded column.
        .width('100%')
    }

    /**
     * Builds the editor page: preview with crop gesture, parameter controls and the result card.
     */
    build() {
        // NavDestination wrapper so the page participates in the home Navigation stack.
        NavDestination() {
            // Single scroll container because the parameter list is taller than one screen.
            Scroll() {
                // Vertical stack of preview, controls and result card, 12vp apart keeps the rhythm.
                Column({ space: '12vp' }) {
                    // Empty state: no uri was handed over, so the editor cannot render anything.
                    if (this.sourceUri.length === 0) {
                        // Hint text explaining that the user has to pick a photo first.
                        Text($r('app.string.pp_edit_no_source'))
                            // Stable identifier used by the UI tests of the sample.
                            .id('id_edit_no_source')
                            // Body size and secondary color mark the hint as informational.
                            .fontSize($r('app.float.pp_font_body'))
                            .fontColor($r('app.color.pp_text_secondary'))
                            // Full width so the hint aligns with the column.
                            .width('100%')
                    } else {
                        // Preview stack overlays the crop outline on top of the image.
                        Stack({ alignContent: Alignment.TopStart }) {
                            // Source image preview; gestures are attached to the stack, not the image.
                            Image(this.sourceUri)
                                // Stable identifier used by the UI tests of the sample.
                                .id('id_edit_preview')
                                // Geometry: full width with the real image ratio avoids distortion and crop drift.
                                .width('100%')
                                .aspectRatio(this.previewRatio)
                                // Cover keeps the preview filled even before the intrinsic size is known.
                                .objectFit(ImageFit.Cover)
                                // Rounded corners match the card styling of the sample.
                                .borderRadius($r('app.float.pp_radius_m'))
                                .onComplete((event?: ImageLoadInfo) => {
                                    // The callback may omit the size while the image is still decoding.
                                    if (event !== undefined && event.width > 0 && event.height > 0) {
                                        // Adopt the real ratio so the crop overlay maps one to one onto the image.
                                        this.previewRatio = event.width / event.height;
                                        // Log the resulting ratio only, the pixels themselves are user data.
                                        Logger.debug(TAG, 'preview onComplete, ratio: ' +
                                            this.previewRatio.toFixed(3));
                                    }
                                })
                        }
                        // Stable identifier used by the UI tests of the sample.
                        .id('id_edit_preview_stack')
                        // Full width so the measured area equals the visible preview.
                        .width('100%')
                        .onAreaChange((oldArea: Area, newArea: Area) => {
                            // Keep the measured size so touch positions can be normalized into fractions.
                            this.previewW = Number(newArea.width);
                            // Keep the measured height for the vertical axis of the crop rectangle.
                            this.previewH = Number(newArea.height);
                        })
                        .gesture(
                            // Pan gesture with a 1vp threshold so a plain tap does not start a crop.
                            PanGesture({ distance: 1 })
                                .onActionStart((event: GestureEvent) => {
                                    // A gesture without a finger list carries no usable position.
                                    if (event.fingerList.length === 0) {
                                        // Warn so the aborted drag is visible while debugging gestures.
                                        Logger.warn(TAG, 'crop onActionStart aborted, empty finger list');
                                        // Abort so stale anchors are not reused for the next drag.
                                        return;
                                    }
                                    // Cache the start position in local preview coordinates.
                                    const startX: number = event.fingerList[0].localX;
                                    // Cache the start position on the vertical axis as well.
                                    const startY: number = event.fingerList[0].localY;
                                    // Remember the horizontal anchor for every later move of this drag.
                                    this.cropStartX = startX;
                                    // Remember the vertical anchor for the same reason.
                                    this.cropStartY = startY;
                                    // Seed the rectangle with a zero-size crop so the overlay appears at the touch.
                                    this.applyCrop(startX, startY);
                                    // Log the gesture stage only, raw coordinates are view data.
                                    Logger.debug(TAG, 'crop onActionStart');
                                })
                                .onActionUpdate((event: GestureEvent) => {
                                    // Ignore move events without a finger list, for example a cancelled touch.
                                    if (event.fingerList.length === 0) {
                                        // Debug level because this only happens on cancelled gestures.
                                        Logger.debug(TAG, 'crop onActionUpdate skipped, empty finger list');
                                        // Skip the update so the previous rectangle stays visible.
                                        return;
                                    }
                                    // Grow the rectangle from the cached anchor to the current touch point.
                                    this.applyCrop(event.fingerList[0].localX, event.fingerList[0].localY);
                                })
                        )
                        // The overlay is conditional because a degenerate crop must not be drawn.
                        if (this.cropActive) {
                            // Transparent rectangle used purely as the crop indicator outline.
                            Rect()
                                // Stable identifier used by the UI tests of the sample.
                                .id('id_edit_crop_rect')
                                // Transparent fill so the underlying image stays visible inside the crop.
                                .fill(Color.Transparent)
                                // Brand color outline so the selection stands out on any image.
                                .stroke($r('app.color.pp_brand'))
                                // Fixed stroke width keeps the outline crisp on the overlay.
                                .strokeWidth(CROP_STROKE)
                                // Geometry: size and origin follow the normalized crop scaled to the preview.
                                .width(this.cropWidthPx())
                                .height(this.cropHeightPx())
                                .position({
                                    // Offset the rectangle to the normalized left edge of the crop.
                                    x: this.cropLeft * this.previewW,
                                    // Offset the rectangle to the normalized top edge of the crop.
                                    y: this.cropTop * this.previewH
                                })
                        }

                        // Crop hint plus reset button, kept on one line under the preview.
                        Row({ space: '12vp' }) {
                            // Hint switches between "drag to crop" and "crop active" texts.
                            Text(this.cropActive ? $r('app.string.pp_edit_crop_active') : $r('app.string.pp_edit_crop'))
                                // Stable identifier used by the UI tests of the sample.
                                .id('id_edit_crop_hint')
                                // Caption size and secondary color keep the hint behind the preview.
                                .fontSize($r('app.float.pp_font_caption'))
                                .fontColor($r('app.color.pp_text_secondary'))
                                // Take the remaining width so the reset button stays right aligned.
                                .layoutWeight(1)
                            // Reset button clears the crop rectangle back to the full image.
                            Button($r('app.string.pp_edit_crop_reset'))
                                // Stable identifier used by the UI tests of the sample.
                                .id('id_edit_crop_reset')
                                // Compact height and caption size keep the row visually light.
                                .height('30vp')
                                .fontSize($r('app.float.pp_font_caption'))
                                // Capsule shape consistent with the other buttons of the page.
                                .type(ButtonType.Capsule)
                                // Card background keeps the secondary action visually quiet.
                                .backgroundColor($r('app.color.pp_card'))
                                // Primary text color keeps the label readable on the card background.
                                .fontColor($r('app.color.pp_text_primary'))
                                .onClick(() => this.resetCrop())
                        }
                        // Full width so the hint and the button span the padded column.
                        .width('100%')

                        // Section label introducing the rotation chips.
                        Text($r('app.string.pp_edit_rotation'))
                            // Stable identifier used by the UI tests of the sample.
                            .id('id_edit_rotation_label')
                            // Body size and primary color give the section label the strongest emphasis.
                            .fontSize($r('app.float.pp_font_body'))
                            .fontColor($r('app.color.pp_text_primary'))
                            // Full width so the label aligns with the column.
                            .width('100%')
                        // Rotation chips, rendered through the builder to keep build() readable.
                        this.rotationChips()

                        // Section label introducing the filter chips.
                        Text($r('app.string.pp_edit_filter'))
                            // Stable identifier used by the UI tests of the sample.
                            .id('id_edit_filter_label')
                            // Body size and primary color give the section label the strongest emphasis.
                            .fontSize($r('app.float.pp_font_body'))
                            .fontColor($r('app.color.pp_text_primary'))
                            // Full width so the label aligns with the column.
                            .width('100%')
                        // Filter chips, rendered through the builder.
                        this.filterChips()

                        // Brightness label carrying the current percent value.
                        Text($r('app.string.pp_edit_brightness', this.brightnessValue))
                            // Stable identifier used by the UI tests of the sample.
                            .id('id_edit_brightness_label')
                            // Body size and primary color give the section label the strongest emphasis.
                            .fontSize($r('app.float.pp_font_body'))
                            .fontColor($r('app.color.pp_text_primary'))
                            // Full width so the label aligns with the column.
                            .width('100%')
                        // Brightness slider, the value is the brightness offset in percent.
                        Slider({ value: this.brightnessValue, min: 0, max: FULL_PERCENT, step: 1 })
                            // Stable identifier used by the UI tests of the sample.
                            .id('id_edit_brightness_slider')
                            // Full width so the track spans the padded column.
                            .width('100%')
                            // Brand color highlights the active track.
                            .selectedColor($r('app.color.pp_brand'))
                            .onChange((value: number) => {
                                // Store the raw percent value; the engine converts it on the next run.
                                this.brightnessValue = value;
                                // Log the slider stage only, the value itself is user content.
                                Logger.debug(TAG, 'brightness onChange');
                            })

                        // Contrast label carrying the current percent value.
                        Text($r('app.string.pp_edit_contrast', this.contrastValue))
                            // Stable identifier used by the UI tests of the sample.
                            .id('id_edit_contrast_label')
                            // Body size and primary color give the section label the strongest emphasis.
                            .fontSize($r('app.float.pp_font_body'))
                            .fontColor($r('app.color.pp_text_primary'))
                            // Full width so the label aligns with the column.
                            .width('100%')
                        // Contrast slider, one hundred percent is the neutral value.
                        Slider({ value: this.contrastValue, min: 50, max: 200, step: 1 })
                            // Stable identifier used by the UI tests of the sample.
                            .id('id_edit_contrast_slider')
                            // Full width so the track spans the padded column.
                            .width('100%')
                            // Brand color highlights the active track.
                            .selectedColor($r('app.color.pp_brand'))
                            .onChange((value: number) => {
                                // Store the raw percent value; the engine converts it on the next run.
                                this.contrastValue = value;
                                // Log the slider stage only, the value itself is user content.
                                Logger.debug(TAG, 'contrast onChange');
                            })

                        // Saturation label carrying the current percent value.
                        Text($r('app.string.pp_edit_saturation', this.saturation))
                            // Stable identifier used by the UI tests of the sample.
                            .id('id_edit_saturation_label')
                            // Body size and primary color give the section label the strongest emphasis.
                            .fontSize($r('app.float.pp_font_body'))
                            .fontColor($r('app.color.pp_text_primary'))
                            // Full width so the label aligns with the column.
                            .width('100%')
                        // Saturation slider, one hundred percent is the neutral value.
                        Slider({ value: this.saturation, min: 0, max: 200, step: 1 })
                            // Stable identifier used by the UI tests of the sample.
                            .id('id_edit_saturation_slider')
                            // Full width so the track spans the padded column.
                            .width('100%')
                            // Brand color highlights the active track.
                            .selectedColor($r('app.color.pp_brand'))
                            .onChange((value: number) => {
                                // Store the raw percent value; the engine converts it on the next run.
                                this.saturation = value;
                                // Log the slider stage only, the value itself is user content.
                                Logger.debug(TAG, 'saturation onChange');
                            })

                        // Section label introducing the watermark input.
                        Text($r('app.string.pp_edit_watermark'))
                            // Stable identifier used by the UI tests of the sample.
                            .id('id_edit_watermark_label')
                            // Body size and primary color give the section label the strongest emphasis.
                            .fontSize($r('app.float.pp_font_body'))
                            .fontColor($r('app.color.pp_text_primary'))
                            // Full width so the label aligns with the column.
                            .width('100%')
                        // Watermark text input, empty text means the output carries no watermark.
                        TextInput({
                            // Bind the current watermark so the field survives re-renders.
                            text: this.watermark,
                            // Localized placeholder shown while the field is empty.
                            placeholder: $r('app.string.pp_edit_watermark_placeholder')
                        })
                            // Stable identifier used by the UI tests of the sample.
                            .id('id_edit_watermark_input')
                            // Full width so the input spans the padded column.
                            .width('100%')
                            // Comfortable tap height for a single line input.
                            .height('40vp')
                            // Body size matches the other fields of the sample.
                            .fontSize($r('app.float.pp_font_body'))
                            // Card background distinguishes the input from the page background.
                            .backgroundColor($r('app.color.pp_card'))
                            // Small radius keeps the input consistent with the chips.
                            .borderRadius($r('app.float.pp_radius_s'))
                            .onChange((value: string) => {
                                // Store the typed text; the engine draws it on the next run.
                                this.watermark = value;
                                // Log the length only, the watermark text is user content and stays out of hilog.
                                Logger.debug(TAG, 'watermark onChange, length: ' + String(value.length));
                            })

                        // Quality label carrying the current percent value.
                        Text($r('app.string.pp_edit_quality', this.quality))
                            // Stable identifier used by the UI tests of the sample.
                            .id('id_edit_quality_label')
                            // Body size and primary color give the section label the strongest emphasis.
                            .fontSize($r('app.float.pp_font_body'))
                            .fontColor($r('app.color.pp_text_primary'))
                            // Full width so the label aligns with the column.
                            .width('100%')
                        // JPEG quality slider, the lower bound keeps the output visibly usable.
                        Slider({ value: this.quality, min: 20, max: 100, step: 1 })
                            // Stable identifier used by the UI tests of the sample.
                            .id('id_edit_quality_slider')
                            // Full width so the track spans the padded column.
                            .width('100%')
                            // Brand color highlights the active track.
                            .selectedColor($r('app.color.pp_brand'))
                            .onChange((value: number) => {
                                // Store the raw quality percent; the engine clamps it while encoding.
                                this.quality = value;
                                // Log the slider stage only, the value itself is configuration data.
                                Logger.debug(TAG, 'quality onChange, value: ' + String(value));
                            })

                        // Section label introducing the long edge options.
                        Text($r('app.string.pp_edit_max_edge'))
                            // Stable identifier used by the UI tests of the sample.
                            .id('id_edit_max_edge_label')
                            // Body size and primary color give the section label the strongest emphasis.
                            .fontSize($r('app.float.pp_font_body'))
                            .fontColor($r('app.color.pp_text_primary'))
                            // Full width so the label aligns with the column.
                            .width('100%')
                        // Long edge chips, rendered through the builder.
                        this.maxEdgeChips()

                        // Primary action that starts the whole processing pipeline.
                        Button(this.busy ? $r('app.string.pp_edit_processing') : $r('app.string.pp_edit_process'))
                            // Stable identifier used by the UI tests of the sample.
                            .id('id_edit_process')
                            // Full width so the primary action spans the padded column.
                            .width('100%')
                            // Standard button height keeps the primary action easy to tap.
                            .height($r('app.float.pp_button_height'))
                            // Capsule shape consistent with the other buttons of the page.
                            .type(ButtonType.Capsule)
                            // Brand color marks the primary action.
                            .backgroundColor($r('app.color.pp_brand'))
                            // Card color text stays readable on the brand background.
                            .fontColor($r('app.color.pp_card'))
                            // Disable the button while a run is active to prevent overlapping engine calls.
                            .enabled(!this.busy)
                            .onClick(() => this.runProcess())

                        // Result card is only rendered after a successful processing run.
                        if (this.resultMap !== null) {
                            // Vertical card holding the thumbnail, the stats and the save action.
                            Column({ space: '8vp' }) {
                                // Title of the result section.
                                Text($r('app.string.pp_edit_result_title'))
                                    // Stable identifier used by the UI tests of the sample.
                                    .id('id_edit_result_title')
                                    // Section size and medium weight make the heading stand out.
                                    .fontSize($r('app.float.pp_font_section'))
                                    .fontWeight(FontWeight.Medium)
                                    // Primary color gives the heading the strongest emphasis.
                                    .fontColor($r('app.color.pp_text_primary'))
                                    // Full width so the heading aligns with the card.
                                    .width('100%')
                                // Thumbnail of the processed pixel map.
                                Image(this.resultMap!)
                                    // Stable identifier used by the UI tests of the sample.
                                    .id('id_edit_result_image')
                                    // Geometry: full width with the real output ratio keeps it undistorted.
                                    .width('100%')
                                    .aspectRatio(this.resultRatio())
                                    // Contain so the whole processed frame is visible inside the card.
                                    .objectFit(ImageFit.Contain)
                                    // Rounded corners match the preview styling.
                                    .borderRadius($r('app.float.pp_radius_m'))
                                    // Mask background shows the thumbnail bounds on dark and light images alike.
                                    .backgroundColor($r('app.color.pp_mask'))
                                // Timing stats reported by the engine for the last run.
                                Text($r('app.string.pp_edit_stats', this.workerCost, this.decodeCost))
                                    // Stable identifier used by the UI tests of the sample.
                                    .id('id_edit_stats')
                                    // Caption size and secondary color keep the stats behind the thumbnail.
                                    .fontSize($r('app.float.pp_font_caption'))
                                    .fontColor($r('app.color.pp_text_secondary'))
                                    // Full width so the stats align with the card.
                                    .width('100%')
                                // Size comparison between the source and the processed output.
                                Text($r('app.string.pp_edit_size', FormatUtil.bytes(this.sourceBytes),
                                    FormatUtil.bytes(this.outputBytes),
                                    String(FormatUtil.percent(this.outputBytes, this.sourceBytes)) + '%'))
                                    // Stable identifier used by the UI tests of the sample.
                                    .id('id_edit_size')
                                    // Caption size and secondary color keep the size line secondary.
                                    .fontSize($r('app.float.pp_font_caption'))
                                    .fontColor($r('app.color.pp_text_secondary'))
                                    // Full width so the size line aligns with the card.
                                    .width('100%')
                                // Pixel dimensions of the processed image.
                                Text($r('app.string.pp_edit_dims', this.resultWidth, this.resultHeight))
                                    // Stable identifier used by the UI tests of the sample.
                                    .id('id_edit_dims')
                                    // Caption size and secondary color keep the dimension line secondary.
                                    .fontSize($r('app.float.pp_font_caption'))
                                    .fontColor($r('app.color.pp_text_secondary'))
                                    // Full width so the dimension line aligns with the card.
                                    .width('100%')
                                // Save action writing the encoded buffer into the sandbox.
                                Button($r('app.string.pp_edit_save'))
                                    // Stable identifier used by the UI tests of the sample.
                                    .id('id_edit_save')
                                    // Full width and standard height make the save action easy to tap.
                                    .width('100%')
                                    .height($r('app.float.pp_button_height'))
                                    // Capsule shape consistent with the other buttons of the page.
                                    .type(ButtonType.Capsule)
                                    // Success color distinguishes the save action from the process action.
                                    .backgroundColor($r('app.color.pp_success'))
                                    // Card color text stays readable on the success background.
                                    .fontColor($r('app.color.pp_card'))
                                    .onClick(() => this.saveResult())
                                // Saved hint only appears after a successful write.
                                if (this.savedPath.length > 0) {
                                    // Sandbox path of the saved file, truncated because it is very long.
                                    Text($r('app.string.pp_edit_saved', this.savedPath))
                                        // Stable identifier used by the UI tests of the sample.
                                        .id('id_edit_saved')
                                        // Caption size and success color confirm that the write succeeded.
                                        .fontSize($r('app.float.pp_font_caption'))
                                        .fontColor($r('app.color.pp_success'))
                                        // Full width so the hint aligns with the card.
                                        .width('100%')
                                        // Two lines are enough to recognize the file name at the tail.
                                        .maxLines(2)
                                        // Ellipsis keeps the card height stable for very long sandbox paths.
                                        .textOverflow({ overflow: TextOverflow.Ellipsis })
                                }
                            }
                            // Full width so the card matches the padded column.
                            .width('100%')
                            // Inner padding separates the card content from its background.
                            .padding('12vp')
                            // Card background groups the result content visually.
                            .backgroundColor($r('app.color.pp_card'))
                            // Medium radius matches the other cards of the sample.
                            .borderRadius($r('app.float.pp_radius_m'))
                            // Start alignment keeps the texts left aligned inside the card.
                            .alignItems(HorizontalAlign.Start)
                        }
                    }
                }
                // Full width so the column spans the scroll viewport.
                .width('100%')
                // Page padding keeps the controls away from the screen edges.
                .padding('16vp')
                // Start alignment makes the section labels align on the left edge.
                .alignItems(HorizontalAlign.Start)
            }
            // Stable identifier used by the UI tests of the sample.
            .id('id_edit_scroll')
            // Full width scroll viewport.
            .width('100%')
            // Full height scroll viewport, the content decides the actual scroll range.
            .height('100%')
            // Anchor the scroll content to the top so the preview is visible on entry.
            .align(Alignment.TopStart)
            // Hide the scroll bar, the sample relies on the visual affordance of the content.
            .scrollBar(BarState.Off)
        }
        // Page title shown in the navigation destination header.
        .title($r('app.string.pp_home_scene_edit_title'))
        // Neutral page background shared by every scene of the sample.
        .backgroundColor($r('app.color.pp_bg_page'))
    }
}
