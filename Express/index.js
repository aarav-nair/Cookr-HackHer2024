import express from "express";
import { MongoClient, ObjectId, ServerApiVersion } from "mongodb";
import "dotenv/config";

const app = express();
const port = 3000;

app.use(express.json());

// Replace the placeholder with your actual MongoDB connection string
const url = process.env.url;

const client = new MongoClient(url, {
    serverApi: {
        version: ServerApiVersion.v1,
        strict: true,
        deprecationErrors: true,
    }
});

async function run() {
    try {
        // Connect the client to the server
        await client.connect();
        // Send a ping to confirm a successful connection
        await client.db("recipes").command({ ping: 1 });
        console.log("Pinged your deployment. You successfully connected to MongoDB!");
    } catch (error) {
        console.error("Connection to MongoDB failed:", error);
    }
}

// Retrieve all recipes
app.get('/recipes', async (req, res) => {
    try {
        const result = await client.db("recipes").collection('recipes').find().toArray();
        res.send(result);
    } catch (err) {
        res.status(500).send("Error fetching recipes: " + err.message);
    }
});

// Update a recipe
app.put('/recipes/:id', async (req, res) => {
    const recipeId = req.params.id;
    const updatedRecipe = req.body;
    try {
        const result = await client.db("recipes").collection('recipes').updateOne({ _id: new ObjectId(recipeId) }, { $set: updatedRecipe });
        res.send(result);
    } catch (err) {
        res.status(500).send("Error updating recipe: " + err.message);
    }
});

// Delete a recipe
app.delete('/recipes/:id', async (req, res) => {
    const recipeId = req.params.id;
    try {
        const result = await client.db("recipes").collection('recipes').deleteOne({ _id: new ObjectId(recipeId) });
        res.send(result);
    } catch (err) {
        res.status(500).send("Error deleting recipe: " + err.message);
    }
});

// Create a recipe
app.post('/recipes', async (req, res) => {
    const recipe = req.body;
    try {
        const result = await client.db("recipes").collection('recipes').insertOne(recipe);
        res.send(result.ops[0]);
    } catch (err) {
        res.status(500).send("Error creating recipe: " + err.message);
    }
});

app.listen(port, () => {
    run().catch(console.dir);
    console.log(`Server is running on port ${port}`);
});