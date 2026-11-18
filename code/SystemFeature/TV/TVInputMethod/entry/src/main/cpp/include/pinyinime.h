/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 *
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

#ifndef PINYINIME_INCLUDE_ANDPYIME_H_
#define PINYINIME_INCLUDE_ANDPYIME_H_

#include "./dictdef.h"
#include <cstdlib>

#ifdef __cplusplus
extern "C" {
#endif

namespace ime_pinyin {

/**
 * Open the decoder engine via the system and user dictionary file names.
 *
 * @param fnSysDict The file name of the system dictionary.
 * @param fnUsrDict The file name of the user dictionary.
 * @return true if open the decoder engine successfully.
 */
bool ImOpenDecoder(const char *fnSysDict, const char *fnUsrDict);

/**
 * Open the decoder engine via the system dictionary FD and user dictionary
 * file name. Because on the target platform, the system dictionary is embedded in the
 * whole application package file.
 *
 * @param sysFd The file in which the system dictionary is embedded.
 * @param startOffset The starting position of the system dictionary in the
 * file sysFd.
 * @param length The length of the system dictionary in the file sysFd,
 * counted in byte.
 * @return true if succeed.
 */
bool ImOpenDecoderFd(int sysFd, long startOffset, long length, const char *fnUsrDict);

/**
 * Close the decoder engine.
 */
void ImCloseDecoder();

/**
 * Set maximum limitations for decoding. If this function is not called,
 * default values will be used. For example, due to screen size limitation,
 * the UI engine of the IME can only show a certain number of letters(input)
 * to decode, and a certain number of Chinese characters(output). If after
 * user adds a new letter, the input or the output string is longer than the
 * limitations, the engine will discard the recent letter.
 *
 * @param maxSpsLen Maximum length of the spelling string(Pinyin string).
 * @maxHzsLen Maximum length of the decoded Chinese character string.
 */
void ImSetMaxLens(size_t maxSpsLen, size_t maxHzsLen);

/**
 * Flush cached data to persistent memory. Because at runtime, in order to
 * achieve best performance, some data is only store in memory.
 */
void ImFlushCache();

/**
 * Use a spelling string(Pinyin string) to Search. The engine will try to do
 * an incremental Search based on its previous Search result, so if the new
 * string has the same prefix with the previous one stored in the decoder,
 * the decoder will only continue the Search from the end of the prefix.
 * If the caller needs to do a brand new Search, please call ImResetSearch()
 * first. Calling ImSearch() is equivalent to calling ImAddLetter() one by
 * one.
 *
 * @param sps_buf The spelling string buffer to decode.
 * @param spsLen The length of the spelling string buffer.
 * @return The number of candidates.
 */
size_t ImSearch(const char *pybuf, size_t spsLen);

/**
 * Make a delete operation in the current Search result, and make research if
 * necessary.
 *
 * @param pos The posistion of char in spelling string to delete, or the
 * position of spelling id in result string to delete.
 * @param isPosInSplid Indicate whether the pos parameter is the position
 * in the spelling string, or the position in the result spelling id string.
 * @return The number of candidates.
 */
size_t ImDelsearch(size_t pos, bool isPosInSplid, bool clearFixedThisStep);

/**
 * Reset the previous Search result.
 */
void ImResetSearch();

/**
 * Add a Pinyin letter to the current spelling string kept by decoder. If the
 * decoder fails in adding the letter, it will do nothing. ImGetSpsStr()
 * can be used to get the spelling string kept by decoder currently.
 *
 * @param ch The letter to add.
 * @return The number of candidates.
 */
size_t ImAddLetter(char ch);

/**
 * Get the spelling string kept by the decoder.
 *
 * @param decodedLen Used to return how many characters in the spelling
 * string is successfully parsed.
 * @return The spelling string kept by the decoder.
 */
const char *ImGetSpsStr(size_t *decodedLen);

/**
 * Get a candidate(or choice) string.
 *
 * @param candId The id to get a candidate. Started from 0. Usually, id 0
 * is a sentence-level candidate.
 * @param candStr The buffer to store the candidate.
 * @param maxLen The maximum length of the buffer.
 * @return candStr if succeeds, otherwise nullptr.
 */
char16 *ImGetCandidate(size_t candId, char16 *candStr, size_t maxLen);

/**
 * Get the segmentation information(the starting positions) of the spelling
 * string.
 *
 * @param splStart Used to return the starting posistions.
 * @return The number of spelling ids. If it is L, there will be L+1 valid
 * elements in splStart, and splStart[L] is the posistion after the end of
 * the last spelling id.
 */
size_t ImGetSplStartPos(const uint16 *&splStart);

/**
 * Choose a candidate and make it fixed. If the candidate does not match
 * the end of all spelling ids, new candidates will be provided from the
 * first unfixed position. If the candidate matches the end of the all
 * spelling ids, there will be only one new candidates, or the whole fixed
 * sentence.
 *
 * @param candId The id of candidate to select and make it fixed.
 * @return The number of candidates. If after the selection, the whole result
 * string has been fixed, there will be only one candidate.
 */
size_t ImChoose(size_t choiceId);

/**
 * Cancel the last selection, or revert the last operation of ImChoose().
 *
 * @return The number of candidates.
 */
size_t ImCancelLastChoice();

/**
 * Get the number of fixed spelling ids, or Chinese characters.
 *
 * @return The number of fixed spelling ids, of Chinese characters.
 */
size_t ImGetFixedLen();

/**
 * Cancel the input State and Reset the Search workspace.
 */
bool ImCancelInput();

/**
 * Get prediction candiates based on the given fixed Chinese string as the
 * history.
 *
 * @param hisBuf The history buffer to do the prediction. It should be ended
 * with '\0'.
 * @param preBuf Used to return prediction result list.
 * @return The number of predicted result string.
 */
size_t ImGetPredicts(const char16 *hisBuf, char16 (*&preBuf)[K_MAX_PREDICT_SIZE + 1]);

/**
 * Enable Shengmus in ShouZiMu mode.
 */
void ImEnableShmAsSzm(bool enable);

/**
 * Enable Yunmus in ShouZiMu mode.
 */
void ImEnableYmAsSzm(bool enable);
} // namespace ime_pinyin

#ifdef __cplusplus
}
#endif

#endif // PINYINIME_INCLUDE_ANDPYIME_H_
