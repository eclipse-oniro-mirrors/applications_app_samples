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

import { expect } from '@ohos/hypium';
import { image } from '@kit.ImageKit';
import { fileIo as fs } from '@kit.CoreFileKit';
import { Decode } from '../../../../../main/ets/common/Decode';
import { encodeToStreamByImageSource, encodeToStreamByPixelMap } from '../../../../../main/ets/common/Encode';
import { makeBytes, Sandbox, OutputLease, equalPixels } from '../fixtures/PixelMapFixtures';
import {
  V2EncoderOwner,
  V2Handles,
  v2Context,
  v2Cache,
  v2Read,
  equalBuffers,
  v2PixelBytes,
  v2Serial,
  v2WaitJpeg
} from '../fixtures/PixelMapV2Fixtures';
import { CleanupGuard, isEncoderQuarantined, quarantineEncoder } from '../fixtures/PixelMapCleanup';
/**
 * @tc.number EXP_V2_PM_0110
 * @tc.name EXP_V2_PM_0110
 * @tc.desc fd image/png 9x9 alpha-checker; Format/AUTO isolation; encodeToStreamByImageSource(True) -> encodeToStreamByPixelMap(False) 11x10 rgba-gradient; output/source preservation
 * @tc.size MediumTest
 * @tc.type Function
 * @tc.level Level 1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    await v2Serial(async (): Promise<void> => {
      const encoded = await makeBytes({
        id: 'V2_PM_0110_first',
        format: 'image/png',
        width: 9,
        height: 9,
        pattern: 'alpha-checker',
        quality: 100
      });
      const nextEncoded = await makeBytes({
        id: 'V2_PM_0110_next',
        format: 'image/png',
        width: 11,
        height: 10,
        pattern: 'rgba-gradient',
        quality: 100
      });
      const bytesSnapshot = encoded.slice(0);
      const nextBytesSnapshot = nextEncoded.slice(0);
      const handles = new V2Handles();
      const box = new Sandbox('V2_PM_0110');
      let lease: OutputLease | undefined;
      let nativeStarted = false;
      const cleanupGuard1 = new CleanupGuard();
      let cleanupGuard1Completed = false;
      try {
        lease = new OutputLease('V2_PM_0110');
        const suffix = box.write('nested/source.png', encoded);
        const nextSuffix = box.write('next.png', nextEncoded);
        const inputPath = v2Cache() + suffix;
        const nextInputPath = v2Cache() + nextSuffix;
        const sut = new Decode(v2Context());
        const source = handles.source(sut.getImageSourceByFd(suffix));
        const referenceSource = handles.source(image.createImageSource(bytesSnapshot));
        const initial = await source.getImageInfo();
        expect(initial.size.width).assertEqual(9);
        expect(initial.size.height).assertEqual(9);
        const formatOptions: image.DecodingOptions = { editable: true,
          desiredPixelFormat: image.PixelMapFormat.RGBA_8888 };
        const autoOptions: image.DecodingOptions = { desiredDynamicRange: image.DecodingDynamicRange.AUTO };
        const expectedPrimary = handles.pixel(await referenceSource.createPixelMap(formatOptions));
        const expectedAuto = handles.pixel(await referenceSource.createPixelMap(autoOptions));
        const primary = handles.pixel(await sut.decodeByFormatWithParameter(source));
        expect(primary.getImageInfoSync().size.width).assertEqual(9);
        expect(primary.getImageInfoSync().size.height).assertEqual(9);
        expect(primary.getImageInfoSync().pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
        expect(primary.isEditable).assertTrue();
        expect(primary.getImageInfoSync().alphaType).assertEqual(expectedPrimary.getImageInfoSync().alphaType);
        expect(primary.getImageInfoSync().isHdr).assertFalse();
        await equalPixels(primary, expectedPrimary);
        const primarySnapshot = await v2PixelBytes(primary);
        const auto = handles.pixel(await sut.decodeByAutoWithParameter(source));
        expect(auto.getImageInfoSync().size.width).assertEqual(9);
        expect(auto.getImageInfoSync().size.height).assertEqual(9);
        expect(auto.getImageInfoSync().isHdr).assertFalse();
        expect(auto.getImageInfoSync().alphaType).assertEqual(expectedAuto.getImageInfoSync().alphaType);
        await equalPixels(auto, expectedAuto);
        expect(auto === primary).assertFalse();
        equalBuffers(await v2PixelBytes(primary), primarySnapshot);
        const patch = new Uint8Array([23, 71, 149, 255]);
        const patchArea: image.PositionArea = { pixels: patch.buffer,
          offset: 0,
          stride: 4,
          region: { x: 8,
            y: 8,
            size: { width: 1,
              height: 1 } } };
        await primary.writePixels(patchArea);
        const observedPatch = new Uint8Array(4);
        await primary.readPixels({ pixels: observedPatch.buffer,
          offset: 0,
          stride: 4,
          region: { x: 8,
            y: 8,
            size: { width: 1,
              height: 1 } } });
        expect(observedPatch[0]).assertEqual(23);
        expect(observedPatch[1]).assertEqual(71);
        expect(observedPatch[2]).assertEqual(149);
        expect(observedPatch[3]).assertEqual(255);
        await equalPixels(auto, expectedAuto);
        const afterPatch = handles.pixel(await sut.decodeByFormatWithParameter(source));
        await equalPixels(afterPatch, expectedPrimary);
        await primary.writeBufferToPixels(primarySnapshot);
        await equalPixels(primary, expectedPrimary);
        const afterDecode = await source.getImageInfo();
        expect(afterDecode.size.width).assertEqual(initial.size.width);
        expect(afterDecode.size.height).assertEqual(initial.size.height);
        expect(afterDecode.pixelFormat).assertEqual(initial.pixelFormat);
        equalBuffers(v2Read(inputPath), bytesSnapshot);
        const referencePacker = handles.packer(image.createImagePacker());
        const firstPacking: image.PackingOption = { format: 'image/jpeg',
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.AUTO };
        const firstJpeg = await referencePacker.packToData(referenceSource, firstPacking);
        const firstJpegSource = handles.source(image.createImageSource(firstJpeg));
        const firstExpected = handles.pixel(await firstJpegSource.createPixelMap(autoOptions));
        expect(firstExpected.getImageInfoSync().size.width).assertEqual(9);
        expect(firstExpected.getImageInfoSync().size.height).assertEqual(9);
        expect(firstExpected.getImageInfoSync().isHdr).assertFalse();
        nativeStarted = true;
        await encodeToStreamByImageSource(source, true, v2Context());
        const firstPath = v2Cache() + '/pixel_map.jpg';
        await v2WaitJpeg(firstPath, firstExpected);
        const firstOutputSnapshot = v2Read(firstPath);
        expect(fs.statSync(firstPath).size > 4).assertTrue();
        equalBuffers(await v2PixelBytes(primary), primarySnapshot);
        await equalPixels(auto, expectedAuto);
        const sourceAfterFirstEncode = await source.getImageInfo();
        expect(sourceAfterFirstEncode.size.width).assertEqual(9);
        expect(sourceAfterFirstEncode.size.height).assertEqual(9);
        const nextSource = handles.source(sut.getImageSourceByFilePath(nextSuffix));
        const nextReferenceSource = handles.source(image.createImageSource(nextBytesSnapshot));
        const expectedNext = handles.pixel(await nextReferenceSource.createPixelMap(formatOptions));
        const nextPixel = handles.pixel(await sut.decodeByFormatWithParameter(nextSource));
        expect(nextPixel.getImageInfoSync().size.width).assertEqual(11);
        expect(nextPixel.getImageInfoSync().size.height).assertEqual(10);
        expect(nextPixel.getImageInfoSync().pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
        expect(nextPixel.isEditable).assertTrue();
        await equalPixels(nextPixel, expectedNext);
        const nextPixelSnapshot = await v2PixelBytes(nextPixel);
        const secondPacking: image.PackingOption = { format: 'image/jpeg', quality: 98 };
        const secondJpeg = await referencePacker.packToData(expectedNext, secondPacking);
        const secondJpegSource = handles.source(image.createImageSource(secondJpeg));
        const secondExpected = handles.pixel(await secondJpegSource.createPixelMap(autoOptions));
        expect(secondExpected.getImageInfoSync().size.width).assertEqual(11);
        expect(secondExpected.getImageInfoSync().size.height).assertEqual(10);
        expect(secondExpected.getImageInfoSync().isHdr).assertFalse();
        equalBuffers(v2Read(firstPath), firstOutputSnapshot);
        nativeStarted = true;
        await encodeToStreamByPixelMap(nextPixel, false, v2Context());
        const secondPath = v2Cache() + '/pixel_map.jpg';
        await v2WaitJpeg(secondPath, secondExpected);
        equalBuffers(await v2PixelBytes(nextPixel), nextPixelSnapshot);
        equalBuffers(await v2PixelBytes(primary), primarySnapshot);
        const replay = handles.pixel(await sut.decodeByFormatWithParameter(source));
        await equalPixels(replay, expectedPrimary);
        const nextReplay = handles.pixel(await sut.decodeByAutoWithParameter(nextSource));
        const nextAutoReference = handles.pixel(await nextReferenceSource.createPixelMap(autoOptions));
        await equalPixels(nextReplay, nextAutoReference);
        expect(nextReplay.getImageInfoSync().isHdr).assertFalse();
        equalBuffers(encoded, bytesSnapshot);
        equalBuffers(nextEncoded, nextBytesSnapshot);
        equalBuffers(v2Read(inputPath), bytesSnapshot);
        equalBuffers(v2Read(nextInputPath), nextBytesSnapshot);
        const finalSource = await source.getImageInfo();
        expect(finalSource.size.width).assertEqual(initial.size.width);
        expect(finalSource.size.height).assertEqual(initial.size.height);
        expect(finalSource.pixelFormat).assertEqual(initial.pixelFormat);
        const finalNextSource = await nextSource.getImageInfo();
        expect(finalNextSource.size.width).assertEqual(11);
        expect(finalNextSource.size.height).assertEqual(10);
        const overwrittenSource = handles.source(image.createImageSource(v2Read(firstPath)));
        const overwrittenInfo = await overwrittenSource.getImageInfo();
        expect(overwrittenInfo.size.width).assertEqual(11);
        expect(overwrittenInfo.size.height).assertEqual(10);
        cleanupGuard1Completed = true;
      }  finally {
        if (!cleanupGuard1Completed) {
          cleanupGuard1.markFailed();
          if (nativeStarted) {
            const quarantinedOwner: V2EncoderOwner = {
              handles,
              box,
              lease,
              encoded,
              nextEncoded,
              bytesSnapshot,
              nextBytesSnapshot
            };
            quarantineEncoder(quarantinedOwner);
          }
        }
        await cleanupGuard1.runAsync(async (): Promise<void> => {
          if (!nativeStarted || !isEncoderQuarantined()) {
            const cleanupTail = new CleanupGuard();
            await cleanupTail.finishAsync(async (): Promise<void> => {
              await handles.release();
            }, async (): Promise<void> => {
              const outputCleanup = new CleanupGuard();
              outputCleanup.finishSync((): void => {
                if (lease) {
                  lease.clean();
                }
              }, (): void => {
                box.clean();
              });
            });
          }
        });
      }
      expect(handles.liveHandles).assertEqual(0);
      expect(fs.accessSync(box.root)).assertFalse();
      expect(fs.accessSync(v2Cache() + '/pixel_map.jpg')).assertFalse();
      expect(fs.accessSync(v2Cache() + '/image_source.jpg')).assertFalse();
    });
  };

export default runExpansionCase;
