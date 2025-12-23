const express = require('express');
const app = express();
const port = 3000;

const restaurants = [
  {
    id: "1",
    title: "Morning Delights Café",
    image: "https://images.unsplash.com/photo-1540189549336-e6e99c3679fe",
    rating: "4.9",
    reviews: "103",
    distance: "2.3km",
    time: "25 min",
    category: "fastest",
    menu: [
      { name: "Signature Tacos", price: 14.99, image: "https://images.unsplash.com/photo-1552332386-f8dd00dc2f85" },
      { name: "Avocado Toast", price: 12.50, image: "https://images.unsplash.com/photo-1525351484163-7529414344d8" },
      { name: "Iced Caramel Latte", price: 5.50, image: "https://images.unsplash.com/photo-1461023058943-07fcbe16d735" }
    ]
  },
  {
    id: "2",
    title: "Sunrise Eats",
    image: "https://images.unsplash.com/photo-1529042410759-befb1204b468",
    rating: "4.8",
    reviews: "561",
    distance: "2.3km",
    time: "25 min",
    category: "fastest",
    menu: [
      { name: "Breakfast Burrito", price: 9.99, image: "https://images.unsplash.com/photo-1626700051175-6818013e1d4f" },
      { name: "Pancake Stack", price: 11.00, image: "https://images.unsplash.com/photo-1528207776546-365bb710ee93" },
      { name: "Fresh Orange Juice", price: 4.00, image: "https://images.unsplash.com/photo-1613478223719-2ab302641482" }
    ]
  },
  {
    id: "3",
    title: "Gourmet Bites",
    image: "https://images.unsplash.com/photo-1544025162-d76694265947",
    rating: "4.7",
    reviews: "120",
    distance: "3.1km",
    time: "30 min",
    category: "recommended",
    menu: [
      { name: "Cheese Quesadillas", price: 10.99, image: "https://images.unsplash.com/photo-1593560708920-61dd98c46a4e" },
      { name: "Beef Sliders", price: 15.99, image: "https://images.unsplash.com/photo-1550317138-10000687ad32" },
      { name: "Truffle Fries", price: 8.50, image: "https://images.unsplash.com/photo-1573080496219-bb080dd4f877" }
    ]
  },
  {
    id: "4",
    title: "Pizza Palace",
    image: "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38",
    rating: "4.6",
    reviews: "95",
    distance: "2.8km",
    time: "28 min",
    category: "recommended",
    menu: [
      { name: "Classic Churros", price: 6.99, image: "https://images.unsplash.com/photo-1578314675249-a6910f80cc4e" },
      { name: "Pepperoni Large", price: 18.99, image: "https://images.unsplash.com/photo-1628840042765-356cda07504e" },
      { name: "Garlic Knots", price: 5.99, image: "https://images.unsplash.com/photo-1541745537411-b8046dc6d66c" }
    ]
  }
];

app.get('/api/restaurants', (req, res) => {
  res.json(restaurants);
});

// Use your IP 192.168.100.9
app.listen(port, "0.0.0.0", () => {
  console.log(`Server running at http://192.168.100.9:${port}`);
});