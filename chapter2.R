#====================================================================================================
# 작성일자 : 2021.03.29
# 작성목적 : Advaned R 1장 관련 소스 
# 참조주소 : https://advanced-r-solutions.rbind.io/names-and-values.html
#====================================================================================================

library(lobstr)
# install.packages("lobstr")

# Quiz 1
# df 데이터프레임의 컮럼3을 생성하여라. 
df <- data.frame(runif(3), runif(3))
df
names(df) <- c(1, 2)
df

# 답 
df$'3' <- NA  #에러발생 


# Quiz 2
# y는 얼마나 많은 메모리를 할당 받나?
x <- runif(1e6)
y <- list(x, x, x)
object.size(y)

# Quiz 3
a <- c(1, 5, 3, 2)
b <- a
b[[1]] <- 10
b


#======================================================================================

x <- c(1, 2, 3)
y <- x

obj_addr(x)  #{lobstr}
obj_addr(y)  #{lobstr}


#======================================================================================
# 2.2.2 Exercises
#======================================================================================

a <- 1:10
b <- a
c <- b
d <- 1:10

list_of_names <- list(a, b, c, d)
obj_addrs(list_of_names) # (주의) obj_addrs vs obj_addr



mean_functions <- list(
  mean,
  base::mean,
  get("mean"),
  evalq(mean),
  match.fun("mean")
)

unique(obj_addrs(mean_functions))



#======================================================================================
# 2.3
#======================================================================================

x <- c(1, 2, 3)
y <- x

y[[3]] <- 4
y[3] <- 5
x
y

x <- c(1, 2, 3)
tracemem(x)
obj_addr(x)  #{lobstr}

y <- x
y[[3]] <- 4L
y[[5]] <- 5L

untracemem(y)


f <- function(a) {
  a
}

x <- c(1, 2, 3)
tracemem(x)

z <- f(x)
untracemem(x)


