main = do
    let allInputs = [1..9]
        varInput = 1
        calcBlock1 = calcBlock 1 12 4
        calcBlock2 = calcBlock 1 11 11
        calcBlock3 = calcBlock 1 13 5
        calcBlock4 = calcBlock2
        calcBlock5 = calcBlock 1 14 14
        calcBlock6 = calcBlock 26 (-10) 7
        calcBlock7 = calcBlock2
        calcBlock8 = calcBlock 26 (-9) 4
        calcBlock9 = calcBlock 26 (-3) 6
        calcBlock10 = calcBlock3
        calcBlock11 = calcBlock 26 (-5) 9
        calcBlock12 = calcBlock 26 (-10) 12
        calcBlock13 = calcBlock 26 (-4) 14
        calcBlock14 = calcBlock 26 (-5) 14
        calcBlockExp = calcBlockAlt 26 (-10) 0
        calcRes = calcBlockAlt 26 1 0 26000
        makeResText varInput res = "Outcome for " ++ show varInput ++ " = " ++ show res ++ "\n"

    putStrLn $ concatMap (\i -> makeResText i (calcRes i)) allInputs

calcBlock :: Int -> Int -> Int -> Int -> Int -> Int
calcBlock step5Div step6Add step16Add z newVar =
    let x = z `mod` 26 -- Step 2 & 3 & 4 combined
        z_1 = z `div` step5Div
        x_1 = if x + step6Add == newVar then 0 else 1 -- Step 7 & 8 combined
        y = 25 * x_1 -- Step 9 & 10 & 11 combined
        y_1 = y + 1
        z_2 = z_1 * y_1
        y_new = newVar + step16Add -- Step 14 & 15 & 16 combined
        in z_2 + y_new * x_1 -- Step 17 & 18 combined

calcBlockAlt :: Int -> Int -> Int -> Int -> Int -> Int
calcBlockAlt step5Div step6Add step16Add z newVar =
    let x_1 = if z `mod` 26 + step6Add == newVar then 0 else 1 -- Step 7 & 8 combined
        in (25 * (z `div` step5Div) + newVar + step16Add) * x_1 + (z `div` step5Div)

-- when step5Div == 1 and step6Add > 9
-- 26 * z + step16Add + newVar

-- when step5Div == 26 and z `mod` 26 + step6Add = newVar
-- z `div` 26 (step6Add and newVar are not in the result)

-- when step5Div == 26 and z `mod` 26 + step6Add != newVar
-- 26 * (z `div` 26) + step16Add + newVar (step6Add is not in the result)

-- Block 1 really does: f(var) = var + 4
-- Block 2 really does: f(var, z) = 26z + var + 11
-- Block 3 really does: f(var, z) = 26z + var + 5
-- Block 4 is the same as block 2
-- Block 5 really does: f(var, z) = 26z + var + 14
-- Block 6 only does something with step6Add when  step6Add = variable - (x `mod` 26)


        
        
        
