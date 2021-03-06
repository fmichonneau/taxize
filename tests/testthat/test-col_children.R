# tests for col_children fxn in taxize
context("col_children")

temp1 <- col_children(name="Apis")
temp2 <- col_children(name="Puma")
temp3 <- col_children(name="Helianthus")
temp4 <- col_children(name="Animalia")
temp5 <- col_children(name="Plantae")
temp6 <- col_children(name="Salicaceae")
temp7 <- col_children(name="Pinus contorta")
temp8 <- col_children(name="Poa")
temp9 <- col_children(name="Ursus")
temp10 <- col_children(name="Accipiter")
temp11 <- col_children(name="Accipiter striatus")
temp12 <- col_children(name=c("Apis","Accipiter striatus","Collomia","Buteo"))
temp13 <- col_children(id=c(2346405,2344165,2346405), checklist = '2012')

test_that("col_children returns the correct class", {
	expect_is(temp1[[1]][1,3], "character")
	expect_that(temp1, is_a("list"))
	expect_that(temp2, is_a("list"))
	expect_that(temp3, is_a("list"))
	expect_that(temp4, is_a("list"))
	expect_that(temp5, is_a("list"))
	expect_that(temp6, is_a("list"))
	expect_that(temp7, is_a("list"))
	expect_that(temp8, is_a("list"))
	expect_that(temp9, is_a("list"))
	expect_that(temp10, is_a("list"))
	expect_that(temp11, is_a("list"))
	expect_that(temp12, is_a("list"))
	expect_that(temp1[[1]], is_a("data.frame"))
	expect_that(temp1[[1]], is_a("data.frame"))
	expect_that(temp1[[1]], is_a("data.frame"))
	expect_that(temp1[[1]], is_a("data.frame"))
	expect_that(temp1[[1]], is_a("data.frame"))
})

test_that("col_children returns the correct dimensions", {
	expect_equal(dim(temp1[[1]]), c(7,3))
	expect_equal(dim(temp2[[1]]), c(8,3))
	expect_equal(dim(temp3[[1]]), c(74,3))
	expect_equal(dim(temp4[[1]]), c(36,3))
	expect_equal(dim(temp5[[1]]), c(2,3))
	expect_equal(dim(temp6[[1]]), c(59,3))
	expect_equal(dim(temp7[[1]]), c(3,3))
	expect_equal(dim(temp8[[1]]), c(517,3))
	
  expect_equal(length(temp9), 1)
	expect_equal(length(temp10), 1)
	expect_equal(length(temp11), 1)
	expect_equal(length(temp12), 4)
})

test_that("missing/wrong data given returns result", {
  expect_equal(nrow(col_children(name="")[[1]]), 0)
  expect_equal(nrow(col_children(name="asdfasdfdf")[[1]]), 0)
  expect_is(col_children(), "list")
#   expect_null(col_children(name = "Buteo", checklist = "1990")[[1]])
})