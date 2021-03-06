# tests for classification fxn in taxize
context("classification")

uids <- get_uid(c("Chironomus riparius", "aaa vva"), verbose=FALSE)
tsns <- get_tsn(c("Chironomus riparius", "aaa vva"), verbose=FALSE)
# eolids <- get_tsn(c("Chironomus riparius", "aaa vva"), verbose=FALSE)
# colids <- get_colid(c("Chironomus riparius", "aaa vva"), verbose=FALSE)
# tpsids <- get_tpsid(sciname=c("Helianthus excubitor", "aaa vva"), verbose=FALSE)
clas_uids <- classification(uids, verbose=FALSE)
names(clas_uids) <- NULL
clas_tsns <- classification(tsns, verbose=FALSE)
names(clas_tsns) <- NULL
# clas_eolids <- classification(eolids, verbose=FALSE)
# clas_colids <- classification(colids)
# clas_tpids <- classification(tpsids, verbose=FALSE)

clas_ncbi <- classification(c("Chironomus riparius", "aaa vva"), db = 'ncbi', 
                            verbose=FALSE)
names(clas_ncbi) <- NULL

clas_itis <- classification(c("Chironomus riparius", "aaa vva"), db = 'itis', 
                            verbose=FALSE)
names(clas_itis) <- NULL

# clas_eol <- classification(c("Helianthus petiolaris Nutt.", "aaa vva"), db = 'eol')
# names(clas_eol) <- NULL

clas_col <- suppressMessages(classification(c("Puma concolor", "aaa vva"), db = 'col'))
names(clas_col) <- NULL
colids <- get_colid(c("Puma concolor", "aaa vva"), verbose=FALSE)
clas_colids <- classification(colids)
names(clas_colids) <- NULL

# clas_tp <- suppressMessages(classification(c("Helianthus excubitor", "aaa vva"), db = 'tropicos'))
# names(clas_tp) <- NULL

test_that("classification returns the correct value", {
	expect_that(clas_ncbi[[2]], equals(NA))
	expect_that(clas_itis[[2]], equals(NA))
# 	expect_that(clas_eol[[2]], equals(NA))
# 	expect_that(clas_col[[2]], equals(NA))
# 	expect_that(clas_tp[[2]], equals(NA))
})

test_that("classification returns the correct class", {
	expect_that(clas_ncbi, is_a("classification"))
	expect_that(clas_ncbi[[1]], is_a("data.frame"))
	expect_that(length(clas_ncbi), equals(2))
	
  expect_that(clas_itis, is_a("classification"))
	expect_that(clas_itis[[1]], is_a("data.frame"))
  expect_that(length(clas_itis), equals(2))
  
# 	expect_that(clas_eol, is_a("list"))
# 	expect_that(clas_eol[[1]], is_a("data.frame"))
# 	expect_that(length(clas_eol), equals(2))
  
# 	expect_that(clas_col, is_a("list"))
# 	expect_that(clas_col[[1]], is_a("data.frame"))
# 	expect_that(length(clas_col), equals(2))
  
# 	expect_that(clas_tp, is_a("classification"))
# 	expect_that(clas_tp[[1]], is_a("data.frame"))
# 	expect_that(length(clas_tp), equals(2))
})

test_that("check S3-methods for tsn and uid class", {
  expect_identical(clas_uids, clas_ncbi)
  expect_equal(clas_tsns, clas_itis)
#   expect_identical(clas_eolids, clas_ncbi)
  #### FIX THESE TWO, SHOULD BE MATCHING
  expect_identical(clas_colids, clas_col) 
#   expect_identical(clas_tpids, clas_tp)
})

# test_that("rbind works correctly", {
# 
# })
# 
# test_that("cbind works correctly", {
# 	
# })

df <- theplantlist[sample(1:nrow(theplantlist), 50), ]
nn <- apply(df, 1, function(x) paste(x["genus"], x["sp"], collapse = " "))

test_that("works on a variety of names", {
	expect_that(classification(nn[1], db = "ncbi"), is_a("classification"))
	expect_that(classification(nn[2], db = "ncbi"), is_a("classification"))
	expect_that(classification(nn[3], db = "ncbi"), is_a("classification"))
	expect_that(classification(nn[4], db = "ncbi"), is_a("classification"))
	expect_that(classification(nn[5], db = "ncbi"), is_a("classification"))
	expect_that(classification(nn[6], db = "ncbi"), is_a("classification"))
	expect_that(classification(nn[7], db = "ncbi"), is_a("classification"))
	expect_that(classification(nn[8], db = "ncbi"), is_a("classification"))
	expect_that(classification(nn[9], db = "ncbi"), is_a("classification"))
	expect_that(classification(nn[10], db = "ncbi"), is_a("classification"))
	expect_that(classification(nn[11], db = "ncbi"), is_a("classification"))
	expect_that(classification(nn[12], db = "ncbi"), is_a("classification"))
})