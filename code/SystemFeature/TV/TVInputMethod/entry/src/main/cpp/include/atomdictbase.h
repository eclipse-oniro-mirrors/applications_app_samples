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

/**
 * This class defines AtomDictBase class which is the base class for all atom
 * dictionaries. Atom dictionaries are managed by the decoder class
 * MatrixSearch.
 *
 * When the user appends a new character to the Pinyin string, all enabled atom
 * dictionaries' ExtendDict() will be called at least once to get candidates
 * ended in this step (the information of starting step is also given in the
 * parameter). Usually, when ExtendDict() is called, a MileStoneHandle object
 * returned by a previous calling for a earlier step is given to speed up the
 * look-up process, and a new MileStoneHandle object will be returned if
 * the extension is successful.
 *
 * A returned MileStoneHandle object should keep alive until Function
 * ResetMilestones() is called and this object is noticed to be Reset.
 *
 * Usually, the atom dictionary can use step information to manage its
 * MileStoneHandle objects, or it can make the objects in ascendant order to
 * make the Reset easier.
 *
 * When the decoder loads the dictionary, it will give a starting lemma id for
 * this atom dictionary to map a inner id to a global id. Global ids should be
 * used when an atom dictionary talks to any component outside.
 */

#ifndef PINYINIME_INCLUDE_ATOMDICTBASE_H_
#define PINYINIME_INCLUDE_ATOMDICTBASE_H_

#include "./dictdef.h"
#include "./searchutility.h"
#include <cstdlib>

namespace ime_pinyin {
class AtomDictBase {
public:
    virtual ~AtomDictBase() {}

    /**
     * Load an atom dictionary from a file.
     *
     * @param fileName The file name to Load dictionary.
     * @param startId The starting id used for this atom dictionary.
     * @param endId The end id (included) which can be used for this atom
     * dictionary. User dictionary will always use the last id space, so it can
     * ignore this paramter. All other atom dictionaries should check this
     * parameter.
     * @return True if succeed.
     */
    virtual bool LoadDict(const char *fileName, LemmaIdType startId, LemmaIdType endId) = 0;

    /**
     * Close this atom dictionary.
     *
     * @return True if succeed.
     */
    virtual bool CloseDict() = 0;

    /**
     * Get the total number of lemmas in this atom dictionary.
     *
     * @return The total number of lemmas.
     */
    virtual size_t NumberOfLemmas() = 0;

    /**
     * This function is called by the decoder when user deletes a character from
     * the input string, or begins a new input string.
     *
     * Different atom dictionaries may implement this function in different way.
     * an atom dictionary can use one of these two parameters (or both) to Reset
     * its corresponding MileStoneHandle objects according its detailed
     * implementation.
     *
     * For example, if an atom dictionary uses step information to manage its
     * MileStoneHandle objects, parameter fromStep can be used to identify which
     * objects should be Reset; otherwise, if another atom dictionary does not
     * use the detailed step information, it only uses ascendant handles
     * (according to step. For the same step, earlier call, smaller handle), it
     * can easily Reset those MileStoneHandle which are larger than fromHandle.
     *
     * The decoder always Reset the decoding State by step. So when it begins
     * resetting, it will call ResetMilestones() of its atom dictionaries with
     * the step information, and the MileStoneHandle objects returned by the
     * earliest calling of ExtendDict() for that step.
     *
     * If an atom dictionary does not implement incremental Search, this function
     * can be totally ignored.
     *
     * @param fromStep From which step(included) the MileStoneHandle
     * objects should be Reset.
     * @param fromHandle The ealiest MileStoneHandle object for step fromStep
     */
    virtual void ResetMilestones(uint16 fromStep, MileStoneHandle fromHandle) = 0;

    /**
     * Used to extend in this dictionary. The handle returned should keep valid
     * until ResetMilestones() is called.
     *
     * @param fromHandle Its previous returned extended handle without the new
     * spelling id, it can be used to speed up the extending.
     * @param dep The paramter used for extending.
     * @param lpiItems Used to fill in the lemmas matched.
     * @param lpiMax The length of the buffer
     * @param lpiNum Used to return the newly added items.
     * @return The new mile stone for this extending. 0 if fail.
     */
    virtual MileStoneHandle ExtendDict(MileStoneHandle fromHandle, const DictExtPara *dep, LmaPsbItem *lpiItems,
                                       size_t lpiMax, size_t *lpiNum) = 0;

    /**
     * Get lemma items with scores according to a spelling id stream.
     * This atom dictionary does not need to sort the returned items.
     *
     * @param splidStr The spelling id stream buffer.
     * @param splidStrLen The length of the spelling id stream buffer.
     * @param lpiItems Used to return matched lemma items with scores.
     * @param lpiMax The maximum size of the buffer to return result.
     * @return The number of matched items which have been filled in to lpiItems.
     */
    virtual size_t GetLpis(const uint16 *splidStr, uint16 splidStrLen, LmaPsbItem *lpiItems, size_t lpiMax) = 0;

    /**
     * Get a lemma string (The Chinese string) by the given lemma id.
     *
     * @param idLemma The lemma id to get the string.
     * @param strBuf The buffer to return the Chinese string.
     * @param strMax The maximum size of the buffer.
     * @return The length of the string, 0 if fail.
     */
    virtual uint16 GetLemmaStr(LemmaIdType idLemma, char16 *strBuf, uint16 strMax) = 0;

    /**
     * Get the full spelling ids for the given lemma id.
     * If the given buffer is too short, return 0.
     *
     * @param splids Used to return the spelling ids.
     * @param splidsMax The maximum buffer length of splids.
     * @param argValid Used to indicate if the incoming parameters have been
     * initialized are valid. If it is true, the splids and splidsMax are valid
     * and there may be half ids in splids to be updated to full ids. In this
     * case, splidsMax is the number of valid ids in splids.
     * @return The number of ids in the buffer.
     */
    virtual uint16 GetLemmaSplids(LemmaIdType idLemma, uint16 *splids, uint16 splidsMax, bool argValid) = 0;

    /**
     * Function used for prediction.
     * No need to sort the newly added items.
     *
     * @param lastHzs The last n Chinese chracters(called Hanzi), its length
     * should be less than or equal to K_MAX_PREDICT_SIZE.
     * @param hzsLen specifies the length(<= K_MAX_PREDICT_SIZE) of the history.
     * @param npreItems Used used to return the result.
     * @param npreMax The length of the buffer to return result
     * @param b4Used Number of prediction result (from npreItems[-b4Used])
     * from other atom dictionaries. A atom ditionary can just ignore it.
     * @return The number of prediction result from this atom dictionary.
     */
    virtual size_t Predict(const char16 lastHzs[], uint16 hzsLen, NPredictItem *npreItems, size_t npreMax,
                           size_t b4Used) = 0;

    /**
     * Add a lemma to the dictionary. If the dictionary allows to add new
     * items and this item does not exist, add it.
     *
     * @param lemmaStr The Chinese string of the lemma.
     * @param splids The spelling ids of the lemma.
     * @param lemmaLen The length of the Chinese lemma.
     * @param count The frequency count for this lemma.
     */
    virtual LemmaIdType PutLemma(char16 lemmaStr[], uint16 splids[], uint16 lemmaLen, uint16 count) = 0;

    /**
     * Update a lemma's occuring count.
     *
     * @param lemmaId The lemma id to update.
     * @param deltaCount The frequnecy count to ajust.
     * @param selected Indicate whether this lemma is selected by user and
     * submitted to target edit box.
     * @return The id if succeed, 0 if fail.
     */
    virtual LemmaIdType UpdateLemma(LemmaIdType lemmaId, int16 deltaCount, bool selected) = 0;

    /**
     * Get the lemma id for the given lemma.
     *
     * @param lemmaStr The Chinese string of the lemma.
     * @param splids The spelling ids of the lemma.
     * @param lemmaLen The length of the lemma.
     * @return The matched lemma id, or 0 if fail.
     */
    virtual LemmaIdType GetLemmaId(char16 lemmaStr[], uint16 splids[], uint16 lemmaLen) = 0;

    /**
     * Get the lemma score.
     *
     * @param lemmaId The lemma id to get score.
     * @return The score of the lemma, or 0 if fail.
     */
    virtual LmaScoreType GetLemmaScore(LemmaIdType lemmaId) = 0;

    /**
     * Get the lemma score.
     *
     * @param lemmaStr The Chinese string of the lemma.
     * @param splids The spelling ids of the lemma.
     * @param lemmaLen The length of the lemma.
     * @return The score of the lamm, or 0 if fail.
     */
    virtual LmaScoreType GetLemmaScore(char16 lemmaStr[], uint16 splids[], uint16 lemmaLen) = 0;

    /**
     * If the dictionary allowed, remove a lemma from it.
     *
     * @param lemmaId The id of the lemma to remove.
     * @return True if succeed.
     */
    virtual bool RemoveLemma(LemmaIdType lemmaId) = 0;

    /**
     * Get the total occuring count of this atom dictionary.
     *
     * @return The total occuring count of this atom dictionary.
     */
    virtual size_t GetTotalLemmaCount() = 0;

    /**
     * Set the total occuring count of other atom dictionaries.
     *
     * @param count The total occuring count of other atom dictionaies.
     */
    virtual void SetTotalLemmaCountOfOthers(size_t count) = 0;

    /**
     * Notify this atom dictionary to flush the cached data to persistent storage
     * if necessary.
     */
    virtual void FlushCache() = 0;
};
} // namespace ime_pinyin

#endif // PINYINIME_INCLUDE_ATOMDICTBASE_H_
