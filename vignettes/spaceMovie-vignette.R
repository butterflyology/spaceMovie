## ----load, echo = FALSE--------------------------------------------------
library("spaceMovie")

## ----ANH, fig.height = 1-------------------------------------------------
SW_palette("TESB")

## ----Zeb, fig.height = 1-------------------------------------------------
SW_palette("Zeb")

## ----Sabine, fig.height = 1----------------------------------------------
SW_palette("Sabine", n = 3)

## ----chopper, fig.width = 5----------------------------------------------
library("ggplot2")
ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
  theme_bw() +
  geom_point(size = 3) +
  scale_color_manual(values = SW_palette("Chopper")) +
  labs(y = "Sepal width", x = "Sepal length") +
  theme(legend.text = element_text(face = "italic"))

## ----chopper-base, fig.width = 5, fig.height = 4-------------------------
plot(x = iris$Sepal.Length, y = iris$Sepal.Width, pch = 19, col = SW_palette("Chopper")[factor(iris$Species)], cex = 1.25, xlab = "Sepal length", ylab = "Sepal width", las = 1, ylim = c(2, 4.5), xlim = c(4, 8))
legend("topleft", col = SW_palette("Chopper"), pch = 19, bty = "n", legend = c(expression(paste(italic("setosa"))), c(expression(paste(italic("versicolor")))), c(expression(paste(italic("virginica"))))))

## ----Boba, fig.height = 1------------------------------------------------
SW_palette("Boba", n = 21, type = "continuous")

## ----Boba_volcano, fig.width = 5, fig.height = 4-------------------------
SW_colors_1 <- SW_palette("Boba", 21, type = "continuous")
image(volcano, col = SW_colors_1, las = 1)

## ----Heat, fig.width = 5-------------------------------------------------
SW_colors_2 <- SW_palette("Hera", 100, type = "continuous")

ggplot(heatmap, aes(x = X2, y = X1, fill = value)) + 
  geom_tile() + 
  scale_fill_gradientn(colours = SW_colors_2) + 
  scale_x_discrete(expand = c(0, 0)) +
  scale_y_discrete(expand = c(0, 0)) + 
  coord_equal() 

